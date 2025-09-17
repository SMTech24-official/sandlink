import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ResetPassController extends GetxController {
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
}
