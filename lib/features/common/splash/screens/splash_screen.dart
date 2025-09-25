import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
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
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomLeft,
            colors: [Color(0xFF0B2A34), Color(0xFF0B2A34), Color(0xFF7C6A2C)],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 150.h),
              Image.asset(
                IconsAssetsPaths.instance.appLogos, // your uploaded image
                width: 200.w,
                height: 200.h,
              ),
              Spacer(),
              SpinKitCircle(size: 50.r, color: AppColors.whiteColor),
              SizedBox(height: 50.h),
            ],
          ),
        ),
      ),
    );
  }
}
