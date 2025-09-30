import 'dart:developer';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:sandlink/core/config/api_end_points/api_end_points.dart';
import 'package:sandlink/core/network/network_caller.dart';
import '../../../../core/services/DBServices/local_db_services/storage_service.dart';
import '../model/forgotpassword_model.dart';
import '../screens/forgot_pass_verify_screen.dart';

class ForgotPassController extends GetxController {
  final forgotkey = GlobalKey<FormState>();
  final emailController = TextEditingController();

  var forgotPasswordData = Rxn<ForgotPasswordData>();

  Future<void> forgotPasswordEmail() async {
    try {
      EasyLoading.show(status: 'Loading...');

      var forgotBody = {"email": emailController.text.trim()};

      var response = await NetworkCaller().postRequest(
        ApiEndPoints.verifyuserbyemail,
        body: forgotBody,
      );

      log('Response Forgot: ${response.responseData}');

      if (response.isSuccess) {
        final model = ForgotPasswordModel.fromJson(response.responseData);

        EasyLoading.dismiss();
        EasyLoading.showSuccess(model.message ?? "Success");

        StorageService().saveData('token', response.responseData['resetToken']);
        if (kDebugMode) {
          print('RESTOKEN:${response.responseData['resetToken']}');
        }

        Get.to(() => ForgotPassVerifyScreen());

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
