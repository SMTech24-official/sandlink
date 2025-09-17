import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sandlink/core/wrappers/custom_text.dart';

import '../app_colors/app_colors.dart';

class NotificationService {
  static void successMessage(String subtitle) {
    Get.snackbar(
      '',
      '',
      colorText: Colors.white,
      backgroundColor: AppColors.primaryColor,
      titleText: CustomText(
        text: 'Success',
        fontSize: 14,
        color: const Color(0xFFFFFFFF),
        fontWeight: FontWeight.w600,
      ),
      messageText: CustomText(
        text: subtitle,
        fontSize: 14,
        color: const Color(0xFFFFFFFF),
        fontWeight: FontWeight.w400,
      ),
    );
  }

  static void errorMessage(String subtitle) {
    Get.snackbar(
      '',
      '',
      colorText: Colors.white,
      backgroundColor: AppColors.redColor,
      titleText: CustomText(
        text: 'Error!',
        fontSize: 14,
        color: const Color(0xFFFFFFFF),
        fontWeight: FontWeight.w600,
      ),
      messageText: CustomText(
        text: subtitle,
        fontSize: 14,
        color: const Color(0xFFFFFFFF),
        fontWeight: FontWeight.w400,
      ),
    );
  }
}
