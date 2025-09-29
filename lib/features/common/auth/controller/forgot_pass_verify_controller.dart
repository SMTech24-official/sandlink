import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:sandlink/core/app_routes/app_route_names.dart';
import 'package:sandlink/core/config/api_end_points/api_end_points.dart';
import 'package:sandlink/core/network/network_caller.dart';
import 'package:sandlink/core/services/DBServices/local_db_services/storage_service.dart';

import '../screens/reset_pass_screen.dart';

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


  Future<void> verifyOTPCode()async{
    EasyLoading.show(status:'Loading...' );
      try{
       var forgotOtpBody = {
         "otp":otpController.text,
       };

       final response = await NetworkCaller().postRequest(ApiEndPoints.verify_forgetpassword,
       body: forgotOtpBody,
         token: StorageService().getData('token'),
       );

       if(response.isSuccess){
         EasyLoading.dismiss();
         EasyLoading.showSuccess(response.responseData['message'] ?? "Success");

         StorageService().saveData('otptoken', response.responseData['resetToken']);

         Get.to(()=>ResetPassScreen());

       } else {
         EasyLoading.dismiss();
         EasyLoading.showError(response.responseData['message'] ?? "Invalid Email");
       }


     }catch(e){
       EasyLoading.showError('Error:${e}');
     }finally{
       EasyLoading.dismiss();
    }




  }



}
