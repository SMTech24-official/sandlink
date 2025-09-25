import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sandlink/core/app_colors/app_colors.dart';
import 'package:sandlink/core/config/constants/assets_paths/icons_assets_paths.dart';
import 'package:sandlink/core/widgets/custom_app_bar.dart';
import 'package:sandlink/core/widgets/custom_button.dart';
import 'package:sandlink/core/wrappers/custom_text.dart';

class RiderPaymentMethodsScreen extends StatelessWidget {
  const RiderPaymentMethodsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: CustomAppBar(
        title: 'Payment Methods',
        centerTitle: true,
        onLeadingPressed: () => Get.back(),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 15.h),
          child: Column(
            children: [
              Container(
                height: 80.h,
                width: double.infinity.w,
                decoration: BoxDecoration(
                  color: AppColors.whiteColor,
                  border: BoxBorder.all(
                    color: AppColors.lightGreyD1,
                    width: 2.w,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(8.r)),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 10.w,
                    vertical: 10.h,
                  ),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 25.r,
                        backgroundImage: AssetImage(
                          IconsAssetsPaths.instance.strip_icon,
                        ),
                      ),
                      SizedBox(width: 8.w),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText(
                            text: '**** **** **** 8765',
                            fontSize: 14.sp,
                            color: AppColors.primaryColor,
                            fontWeight: FontWeight.w500,
                          ),
                          CustomText(
                            text: '03/28',
                            fontSize: 14.sp,
                            color: AppColors.primaryColor,
                            fontWeight: FontWeight.w500,
                          ),
                        ],
                      ),
                      Spacer(),
                      Image.asset(IconsAssetsPaths.instance.delete_icon),
                    ],
                  ),
                ),
              ),
              Spacer(),
              CustomButton(
                onPressed: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.add, size: 22.r, color: AppColors.whiteColor),
                    CustomText(
                      text: 'Add Card',
                      color: AppColors.whiteColor,
                      fontWeight: FontWeight.w500,
                      fontSize: 18.sp,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
