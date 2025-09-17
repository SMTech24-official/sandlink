import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sandlink/core/app_colors/app_colors.dart';
import 'package:sandlink/core/config/constants/assets_paths/icons_assets_paths.dart';
import 'package:sandlink/features/common/splash/controller/spash_controller.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SplashController());
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),
            Image.asset(IconsAssetsPaths.instance.appLogo, width: 140.w),
            const Spacer(),
            CircularProgressIndicator(
              color: AppColors.primaryColor,
              strokeWidth: 1.5,
            ),
            40.verticalSpace,
          ],
        ),
      ),
    );
  }
}
