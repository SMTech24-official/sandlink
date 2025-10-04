import 'dart:developer';
import 'package:flutter/widgets.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:sandlink/core/network/network_caller.dart';
import '../../../../core/config/api_end_points/api_end_points.dart';
import '../../../../core/services/DBServices/local_db_services/storage_service.dart';
import '../screens/register_verify_screen.dart';

class RegisterController extends GetxController {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final passController = TextEditingController();
  final genderList = ['Male', 'Female', 'Other'].obs;
  final selectedGender = "Male".obs;
  final fullPhoneNumber = "".obs;
  final countryCode = "".obs;

  var isPassVisible = false.obs;
  var isChecked = true.obs;

  void togglePasswordVisibility() {
    isPassVisible.value = !isPassVisible.value;
  }

  bool _validateInputs() {
    if (nameController.text.trim().isEmpty) {
      EasyLoading.showError("Name is required");
      return false;
    }

    if (emailController.text.trim().isEmpty) {
      EasyLoading.showError("Email is required");
      return false;
    }

    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailRegex.hasMatch(emailController.text.trim())) {
      EasyLoading.showError("Enter a valid email address");
      return false;
    }

    if (phoneController.text.trim().isEmpty) {
      EasyLoading.showError("Phone number is required");
      return false;
    }

    final phoneRegex = RegExp(r'^\d{1,15}$'); // 1-15 digits
    if (!phoneRegex.hasMatch(phoneController.text.trim())) {
      EasyLoading.showError("Enter a valid phone number");
      return false;
    }

    if (passController.text.trim().isEmpty) {
      EasyLoading.showError("Password is required");
      return false;
    }

    if (passController.text.trim().length < 6) {
      EasyLoading.showError("Password must be at least 6 characters");
      return false;
    }

    if (!isChecked.value) {
      EasyLoading.showError(
        "You must agree to the Terms of Service and Privacy Policy",
      );
      return true;
    }

    return true;
  }

  Future<void> createSignupUser() async {
    try {
      if (!_validateInputs()) return;
      EasyLoading.show(status: 'Creating account...');

      var body = {
        "name": nameController.text,
        "email": emailController.text.trim(),
        "phoneNumber":
            "${countryCode.value}"
            "${phoneController.text.trim()}",
        "password": passController.text.trim(),
        "role": StorageService().getData('role'),
        "isAgreeTermsAndPrivacyPolicy": isChecked.value,
      };
      log("SignupData: $body");

      final response = await NetworkCaller().postRequest(
        ApiEndPoints.register,
        body: body,
        token: StorageService().getData('token'),
      );

      if (response.isSuccess) {
        // var otptime = response.responseData['data']['otpExpiry'];
        //   log('OTP Time${otptime}');

        StorageService().saveData('otpemail', emailController.text);

        Get.to(() => RegisterVerifyScreen());

        nameController.clear();
        emailController.clear();
        phoneController.clear();
        passController.clear();
        isChecked.value = false;
        log("Signup Successfully$body");
      } else if (response.statusCode == 400) {
        EasyLoading.showError(response.errorMessage);
      } else {
        EasyLoading.showError(response.errorMessage);
      }
    } catch (e) {
      EasyLoading.showError('Registration failed. Try again.');
    } finally {
      EasyLoading.dismiss();
    }
  }

  @override
  void onClose() {
    super.onClose();
    nameController.clear();
    emailController.clear();
    phoneController.clear();
    passController.clear();
  }
}
