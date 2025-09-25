import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sandlink/core/app_colors/app_colors.dart';

import '../../../../core/config/constants/assets_paths/icons_assets_paths.dart';
import '../../../../core/widgets/custom_text_field.dart';
import '../../../../core/wrappers/custom_text.dart';
import '../controllers/phone_verification_controllers.dart';

class PhoneVerificationScreens extends StatelessWidget {
   PhoneVerificationScreens({super.key});

   final controller = Get.put(PhoneVerificationController());


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body:  SafeArea(
    child: Padding(
      padding:  EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
      children: [
        SizedBox(height: 50.h,),
        Container(
          height: 418.h,
          width: double.infinity.w,
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.lightGreyD1),
            borderRadius: BorderRadius.all(Radius.circular(8.r)),
          ),
          child: Column(
            children: [
              SizedBox(height: 16.h,),
              CustomText(
                text: 'Phone Verification',
                color: AppColors.blackColor,
                fontSize: 18.sp,
                fontWeight: FontWeight.w600,
              ),
              SizedBox(height: 8.h),
              CustomText(
                text: 'Verify your phone number with OTP',
                color: AppColors.lightGrey,
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
              ),
              SizedBox(height: 16.h,),
              Form(
               // key: controller.basic_key,
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Padding(
                    padding:  EdgeInsets.symmetric(horizontal: 16.w),
                    child: Column(
                      children: [
                        CustomInputField(
                          headerTitle: "Phone Number",
                          headerfontSize: 14.sp,
                          hintTextFontWeight: FontWeight.w500,
                          headerTextColor: AppColors.blackColor,
                          textController: controller.otpController,
                          hintText: '(208) 555-0112',
                          keyboardType: TextInputType.number,
                        ),
                        SizedBox(height: 12.h,),

                        Container(
                          height: 70.h,
                          width: double.infinity.w,
                          decoration: BoxDecoration(
                              color: AppColors.greenlightColor,
                              borderRadius: BorderRadius.all(Radius.circular(8.r)),
                          ),
                          child: Padding(
                            padding:  EdgeInsets.symmetric(horizontal: 16.w),
                            child: Row(
                              children: [
                                Expanded(
                                  flex:1,
                                  child: Column(
                                    children: [
                                      SizedBox(height: 16.h,),
                                      Image.asset(IconsAssetsPaths.instance.right_circle_icon,height: 24,),

                                    ],
                                  ),),

SizedBox(width: 8.w,),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [


                                    CustomText(
                                      text: 'OTP Sent!',
                                      color: AppColors.greenColor,
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w500,
                                    ),
                                    CustomText(
                                      text: 'Check your phone for the verification code',
                                      color: AppColors.lightGrey,
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ],
                                ),

                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 12.h,),

                        Container(
                          height: 100.h,
                          width: double.infinity.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(8.r)),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomText(
                                text: 'Enter OTP*',
                                color: AppColors.blackColor,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w600,
                              ),
                              SizedBox(height: 8.h),
                              Center(
                                child: OutlinedButton(

                                    onPressed: () {},
                                  style: OutlinedButton.styleFrom(
                                    minimumSize:  Size(318.w, 50.h),
                                    side:  BorderSide(color: AppColors.lightGreyD1, width: 1),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8.r),
                                    ),
                                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                                  ),
                                    child: CustomText(text: '00 00 00',color: AppColors.lightGrey,)
                                ),
                              )

                            ],
                          ),
                        ),

                        SizedBox(height: 12.h,),
                        CustomText(
                          text: 'Resend OTP',
                          color: AppColors.primaryColor,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                        ),

                      ],
                    ),
                  ),
                ),
              ),

            ],
          ),
        )
      ],),
    ))
    );
  }
}
