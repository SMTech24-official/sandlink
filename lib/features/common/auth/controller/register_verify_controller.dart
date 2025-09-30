import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sandlink/core/config/api_end_points/api_end_points.dart';
import 'package:sandlink/core/network/network_caller.dart';

import '../../../../core/app_routes/app_route_names.dart';
import '../../../../core/config/constants/assets_paths/svg_assets_paths.dart';
import '../../../../core/services/DBServices/local_db_services/storage_service.dart';
import '../../../../core/widgets/custom_dialog.dart';
import '../../../rider/driver_verification/screen/rider_steps_screen.dart';
import '../../splash/controller/choose_role_controller.dart';

class RegisterVerifyController extends GetxController {
  final chooseRoleController = Get.put(ChooseRoleController());

  final otpController = TextEditingController();

  var emailverify = StorageService().getData('otpemail');

  RxInt remainingSeconds = 300.obs; // 5 minutes
  Timer? _timer;
  RxBool isResendAvailable = false.obs;

  void startResendTimer() {
    isResendAvailable.value = false;
    remainingSeconds.value = 300;

    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (remainingSeconds.value > 0) {
        remainingSeconds.value--;
      } else {
        timer.cancel();
        isResendAvailable.value = true;
      }
    });
  }

  String get formattedTime {
    final minutes = (remainingSeconds.value ~/ 60).toString().padLeft(2, '0');
    final seconds = (remainingSeconds.value % 60).toString().padLeft(2, '0');
    return "$minutes:$seconds";
  }

  @override
  void onClose() {
    _timer?.cancel();
    otpController.clear();
    super.onClose();
  }

  @override
  void onInit() {
    startResendTimer();

    super.onInit();
  }

  void resendCode() {
    debugPrint("Resend OTP called.");
    startResendTimer();
  }

  Future<void> otpVerify(BuildContext context) async {
    EasyLoading.show(status: "Loading...");

    try {
      var otpBody = {"email": emailverify, "otp": otpController.text.trim()};

      var response = await NetworkCaller().postRequest(
        ApiEndPoints.verifyotp,
        body: otpBody,
        token: StorageService().getData('token'),
      );

      if (response.isSuccess) {
        EasyLoading.dismiss();

        showDialog(
          // ignore: use_build_context_synchronously
          context: context,
          barrierDismissible: false,
          builder: (dialogContext) {
            return AlertDialog(
              content: CustomDialog(
                imagePath: SvgAssetsPaths.instance.successBack,
                title: "Account Verified Successfully 🎉",
                subtitle: "You can explore the app now",
                buttonFontSize: 16.spMin,
                // ignore: unrelated_type_equality_checks
                primaryButtonText: chooseRoleController.selectedRole == 'RIDER'
                    ? "Verify Information"
                    : "Back to Login",
                onPrimaryTap: () {
                  Get.back(); // ✅ close dialog safely (no BuildContext issue)

                  // ignore: unrelated_type_equality_checks
                  if (chooseRoleController.selectedRole == 'RIDER') {
                    Get.to(() => RiderStepsScreen());
                  } else {
                    Get.offAllNamed(AppRouteNames.instance.login);
                  }
                },
              ),
            );
          },
        );
      } else {
        EasyLoading.dismiss();
        EasyLoading.showError("Invalid OTP ❌");
      }

      log('verifyEmail $otpBody');
    } catch (e) {
      EasyLoading.dismiss();
      EasyLoading.showError("Error: $e");
    } finally {
      EasyLoading.dismiss();
    }
  }

  Future<void> resendOtpCode() async {
    EasyLoading.show(status: "Loading...");

    try {
      var resendotpBody = {"email": emailverify};

      var response = await NetworkCaller().patchRequest(
        ApiEndPoints.resendotp,
        body: resendotpBody,
        token: StorageService().getData('token'),
      );

      if (response.isSuccess) {
        EasyLoading.dismiss();
        startResendTimer();
      } else {
        EasyLoading.dismiss();
        EasyLoading.showError("Invalid OTP ❌");
      }

      log('verifyEmail $resendotpBody');
    } catch (e) {
      EasyLoading.dismiss();
      EasyLoading.showError("Error: $e");
    } finally {
      EasyLoading.dismiss();
    }
  }
}
