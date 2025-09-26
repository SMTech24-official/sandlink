import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgotPassVerifyController extends GetxController {
  final otpController = TextEditingController();

  RxInt remainingSeconds = 300.obs;
  Timer? _timer;
  RxBool isResendAvailable = false.obs;

  void startResendTimer() {
    isResendAvailable.value = false;
    remainingSeconds.value = 300;

    _timer?.cancel();
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (remainingSeconds.value > 0) {
        remainingSeconds.value--;
      } else {
        timer.cancel();
        isResendAvailable.value = true;
        debugPrint("Resend Timer: $isResendAvailable");
      }
    });
    debugPrint(isResendAvailable.toString());
  }

  void resendCode() {
    debugPrint("Resend OTP called.");
    startResendTimer();
  }

  @override
  void onClose() {
    super.onClose();
    otpController.clear();
  }
}
