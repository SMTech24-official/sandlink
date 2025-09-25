import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final passController = TextEditingController();
  final genderList = ['Male', 'Female', 'Other'].obs;
  final selectedGender = "Male".obs;
  final fullPhoneNumber = "".obs;

  var isPassVisible = false.obs;
  var isChecked = true.obs;

  void togglePasswordVisibility() {
    isPassVisible.value = !isPassVisible.value;
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
