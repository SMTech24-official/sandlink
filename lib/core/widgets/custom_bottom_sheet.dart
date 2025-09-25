import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sandlink/core/app_colors/app_colors.dart';
import 'package:sandlink/core/widgets/custom_button.dart';
import 'package:sandlink/core/wrappers/custom_text.dart';

void showCustomBottomSheet(
{
  required String? title,
  required String? subtitle,
  required String? buttonTitle1,
  required String? buttonTitle2,
  required VoidCallback onTap1,
  required VoidCallback onTap2,

}) {
  Get.bottomSheet(
    Container(
      width: double.infinity.w,
      padding:  EdgeInsets.all(16.r),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 10.h,),
          Container(
            height: 5.h,
            width: 38.w,
            decoration: BoxDecoration(
                color: AppColors.GreyColors9E,
                borderRadius: BorderRadius.all(Radius.circular(60.r))
            ),
          ),
        SizedBox(height: 24.h,),
        CustomText(text: title??"",color: AppColors.blackColor,fontSize: 20.sp,fontWeight: FontWeight.w500,),
          SizedBox(height: 48.h,),
        CustomText(text: subtitle??"",color: AppColors.blackColor,fontSize: 18.sp,fontWeight: FontWeight.w500,),
          SizedBox(height: 24.h,),
          Padding(
            padding:  EdgeInsets.symmetric(horizontal: 16.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomButton(
                  width: 150.w,
                  height: 15.h,
                  text: buttonTitle1,
                  onPressed: onTap1,
                  textColor: AppColors.blackColor,
                  backgroundColor: AppColors.lightGreyD1,
                ),

                CustomButton(
                  width: 150.w,
                  height: 15.h,
                  textColor: AppColors.whiteColor,
                  text: buttonTitle2,
                  onPressed: onTap2,

                ),

              ],
            ),
          ),
          SizedBox(height: 36.h,),
        ],
      ),
    ),
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
  );
}