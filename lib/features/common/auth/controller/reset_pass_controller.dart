import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sandlink/core/config/api_end_points/api_end_points.dart';
import 'package:sandlink/core/network/network_caller.dart';
import 'package:sandlink/core/services/DBServices/local_db_services/storage_service.dart';
import '../../../../core/app_routes/app_route_names.dart';
import '../../../../core/config/constants/assets_paths/svg_assets_paths.dart';
import '../../../../core/widgets/custom_dialog.dart';

class ResetPassController extends GetxController {
  final passkey = GlobalKey<FormState>();

  final newPassController = TextEditingController();
  final confirmPassController = TextEditingController();

  var isNewPassVisible = false.obs;
  var isConfirmPassVisible = false.obs;

  void toggleNewPasswordVisibility() {
    isNewPassVisible.value = !isNewPassVisible.value;
  }

  void toggleConfirmPasswordVisibility() {
    isConfirmPassVisible.value = !isConfirmPassVisible.value;
  }

  @override
  void onClose() {
    super.onClose();
    newPassController.clear();
    confirmPassController.clear();
  }

  Future<void> createNewForgotPassword() async {
    EasyLoading.show(status: 'Loading...');

    try {
      var newpasswordBody = {"password": newPassController.text};

      final response = await NetworkCaller().postRequest(
        ApiEndPoints.forgotpassword,
        body: newpasswordBody,
        token: StorageService().getData('otptoken'),
      );

      if (response.isSuccess) {
        log("PASS:${response.responseData['password']}");
        Get.dialog(
          AlertDialog(
            backgroundColor: Colors.white,
            content: CustomDialog(
              title: "Password Changed",
              subtitle:
                  "Password changed successfully, you can login again with new password.",
              imagePath: SvgAssetsPaths.instance.successBack,
              primaryButtonText: "Back to Login",
              buttonFontSize: 16.spMin,
              onPrimaryTap: () => Get.offAllNamed(AppRouteNames.instance.login),
            ),
          ),
        );
      } else {
        EasyLoading.dismiss();
        EasyLoading.showError(
          response.responseData['message'] ?? "Invalid Password",
        );
      }
    } catch (e) {
      EasyLoading.dismiss();
      EasyLoading.showError('Error:$e');
    } finally {
      EasyLoading.dismiss();
    }
  }
}
