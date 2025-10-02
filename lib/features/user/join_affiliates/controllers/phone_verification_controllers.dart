import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:sandlink/core/config/api_end_points/api_end_points.dart';
import 'package:sandlink/core/network/network_caller.dart';
import 'package:sandlink/features/user/user_profile/controller/user_profile_controller.dart';

class PhoneVerificationController extends GetxController {
  final UserProfileController controller = Get.put(UserProfileController());
  final verifyKey = GlobalKey<FormState>();
  var isOtpverifySuccessfully = false.obs;

  final otpController = TextEditingController();
  final phoneNumberController = TextEditingController();

  @override
  void onInit() {
    super.onInit();

    try {
      if (controller.getUserphone.isNotEmpty) {
        phoneNumberController.text = controller.getUserphone.toString();
        if (kDebugMode) {
          print("✅ Phone number pre-filled: ${phoneNumberController.text}");
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print("⚠️ Could not find ProfileController: $e");
      }
    }
  }

  Future<bool> verifyPhoneOtp() async {
    // Reset success flag
    isOtpverifySuccessfully.value = false;

    // Validate OTP
    if (otpController.text.trim().isEmpty ||
        otpController.text.trim().length != 4) {
      EasyLoading.showError('Please enter a valid 4-digit OTP');
      return false;
    }

    // Validate phone number
    if (phoneNumberController.text.trim().isEmpty) {
      EasyLoading.showError('Phone number is required');
      return false;
    }

    // Check if user ID exists
    if (controller.userId == null || controller.userId.toString().isEmpty) {
      EasyLoading.showError('User ID not found. Please login again.');
      if (kDebugMode) {
        print("❌ User ID is null or empty");
      }
      return false;
    }

    EasyLoading.show(status: 'Verifying OTP...');

    try {
      var url = ApiEndPoints.verifyPhoneOtp;

      final requestBody = {
        "id": controller.userId.toString(),
        "phoneNumber": phoneNumberController.text.trim().toString(),
        "otp": otpController.text.trim().toString(),
      };

      // Print request details for debugging
      if (kDebugMode) {
        print("=== OTP Verification Request ===");
        print("URL: $url");
        print("Request Body: $requestBody");
        print("================================");
      }

      final response = await NetworkCaller().postRequest(
        url,
        body: requestBody,
      );

      EasyLoading.dismiss();

      // Print response for debugging
      if (kDebugMode) {
        print("=== OTP Verification Response ===");
        print("Is Success: ${response.isSuccess}");
        print("Status Code: ${response.statusCode}");
        print("Response Data: ${response.responseData}");
        print("Error Message: ${response.errorMessage}");
        print("=================================");
      }

      if (response.isSuccess) {
        isOtpverifySuccessfully.value = true;
        EasyLoading.showSuccess('OTP verified successfully');
        return true;
      } else {
        isOtpverifySuccessfully.value = false;
        String errorMsg = response.errorMessage ?? 'Verification failed';
        EasyLoading.showError(errorMsg);

        if (kDebugMode) {
          print("❌ Verification failed: $errorMsg");
        }
        return false;
      }
    } catch (e, stackTrace) {
      EasyLoading.dismiss();
      isOtpverifySuccessfully.value = false;
      EasyLoading.showError('Failed! Please try again');

      if (kDebugMode) {
        print("❌ Error verifying OTP: $e");
        print("Stack trace: $stackTrace");
      }
      return false;
    }
  }

  @override
  void onClose() {
    otpController.dispose();
    phoneNumberController.dispose();
    super.onClose();
  }
}
