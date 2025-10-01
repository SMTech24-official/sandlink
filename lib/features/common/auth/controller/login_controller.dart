import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:sandlink/core/config/api_end_points/api_end_points.dart';
import 'package:sandlink/core/network/network_caller.dart';
import 'package:sandlink/core/services/DBServices/local_db_services/storage_service.dart';

import '../../../../core/app_routes/app_route_names.dart';

class LoginController extends GetxController {
  var isPassVisible = false.obs;
  var isChecked = true.obs;
  final emailController = TextEditingController();
  final passController = TextEditingController();

  void togglePasswordVisibility() {
    isPassVisible.value = !isPassVisible.value;
  }

  void checkbox() {
    isChecked.value = !isChecked.value;
  }

  Future<void> userlogin() async {
    EasyLoading.show(status: 'Loading...');
    try {
      var loginBody = {
        "email": emailController.text.trim(),
        "password": passController.text.trim(),
      };

      var response = await NetworkCaller().postRequest(
        ApiEndPoints.login,
        body: loginBody,
      );

      if (response.isSuccess) {
        var token = response.responseData['accessToken'] ?? "";
        var userID = response.responseData['id'] ?? "";
        var role = response.responseData['role'] ?? "";
        var name = response.responseData['name'] ?? "";
        var email = response.responseData['email'] ?? "";

        log(
          "ResponseSave: Name: $name UserID: $userID Role: $role Email: $email Token: $token",
        );

        await StorageService().saveData('accessToken', token);
        await StorageService().saveData('UserID', userID);
        await StorageService().saveData('role', role);

        EasyLoading.dismiss();
        EasyLoading.showSuccess("Login Successful");

        if (role == "CUSTOMER") {
          Get.offAllNamed(AppRouteNames.instance.userHome);
        } else if (role == "RIDER") {
          Get.offAllNamed(AppRouteNames.instance.ridernavnar);
        } else if (response.statusCode == 404) {
          EasyLoading.showError("User not found. Please check your email.");
        }
      } else {
        EasyLoading.dismiss();
        EasyLoading.showError(
          response.responseData['message'] ?? "Invalid credentials",
        );
      }
    } catch (e) {
      EasyLoading.dismiss();
      EasyLoading.showError("Unexpected error: $e");
    } finally {
      EasyLoading.dismiss();
    }
  }
}
