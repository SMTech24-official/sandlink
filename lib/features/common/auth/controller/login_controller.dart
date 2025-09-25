import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  var isPassVisible = false.obs;
  var isChecked = true.obs;
  final emailController = TextEditingController();
  final passController = TextEditingController();



  void togglePasswordVisibility() {
    isPassVisible.value = !isPassVisible.value;
  }

  void checkbox(){
    isChecked.value = !isChecked.value;
  }

}
