import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sandlink/core/app_colors/app_colors.dart';
import 'package:sandlink/core/widgets/custom_button.dart';
import 'package:sandlink/core/wrappers/custom_text.dart';

void showCustomDialog({
  required String? imagePath,
  required String? title,
  required String? subtitle,
  required VoidCallback? secondaryButton,
  required String primaryButtonText,
  required String secondaryButtonText,
  required VoidCallback? primaryButton,
  Color? colorbutton1,colorbutton2,
  final double? buttonFontSize,




}) {
  Get.dialog(
    Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Image
            Image.asset(
              imagePath!,
              height: 140.h,
              width: 140.w,
              fit: BoxFit.contain,
            ),

            const SizedBox(height: 16),

            // Title
            CustomText(text: title??'',color: AppColors.blackColor,fontWeight: FontWeight.w500,fontSize: 20.sp,),

            const SizedBox(height: 8),

            // Subtitle
            CustomText(text: subtitle??'',color: AppColors.lightGrey,fontWeight: FontWeight.w400,fontSize: 16.sp,),


            const SizedBox(height: 20),

            // Buttons row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [

                Expanded(
                  flex: 1,
                  child: SizedBox(
                    height:45.h,
                    child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        side:  BorderSide(color: AppColors.lightGrey),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      onPressed:  primaryButton,
                      child: CustomText(text:  primaryButtonText,color: colorbutton2,fontSize:buttonFontSize ?? 14.0.sp,),
                    ),
                  ),
                ),

                SizedBox(width: 16.w,),
                Expanded(
                  flex: 1,
                  child: CustomButton(

                    onPressed:secondaryButton !,
                    child: CustomText(text:secondaryButtonText ,color: colorbutton1,fontSize:buttonFontSize ?? 14.0.sp,),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    ),
    barrierDismissible: false, // prevent tap outside to close
  );
}
