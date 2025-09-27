import 'dart:developer';
import 'package:flutter/widgets.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:sandlink/core/config/api_end_points/api_end_points.dart';
import 'package:sandlink/core/network/network_caller.dart';
import '../screens/forgot_pass_verify_screen.dart';

class ForgotPassController extends GetxController {
  final forgotkey = GlobalKey<FormState>();
  final emailController = TextEditingController();

  Future<void> forgotPasswordEmail() async {
    try {
      EasyLoading.show(status: 'Loading...');

      var forgotBody = {"email": emailController.text.trim()};

      var response = await NetworkCaller().postRequest(
        ApiEndPoints.verify_user_by_email,
        body: forgotBody,
      );

      log('Response Forgot: $response');

      if (response.isSuccess) {
        // ✅ Show success
        EasyLoading.dismiss();
        EasyLoading.showSuccess(response.responseData['message'] ?? "Success");

        log('verify Forgot OTP: ${response.responseData['otp']}');
        Get.to(() => ForgotPassVerifyScreen());
      } else {
        EasyLoading.dismiss();
        EasyLoading.showError(
          response.responseData['message'] ?? "Invalid Email",
        );
      }
    } catch (e) {
      EasyLoading.dismiss();
      EasyLoading.showError("Unexpected error: $e");
    }
  }

  @override
  void onClose() {
    super.onClose();
    emailController.clear();
  }
}
