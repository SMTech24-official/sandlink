import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sandlink/core/app_colors/app_colors.dart';
import 'package:sandlink/core/widgets/custom_app_bar.dart';
import 'package:sandlink/core/widgets/custom_button.dart';
import 'package:sandlink/core/wrappers/custom_text.dart';
import 'package:sandlink/features/user/join_affiliates/screen/pricing_plan_screen.dart';

import '../../../../core/config/constants/assets_paths/icons_assets_paths.dart';
import '../controllers/tearms_condition_controllers.dart';

class TermsConditionsScreen extends StatelessWidget {
  TermsConditionsScreen({super.key});

  final controller = Get.put(TermsConditionControllers());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Terms & Conditions',
        centerTitle: true,
        onLeadingPressed: () => Get.back(),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            children: [
              // ✅ Scrollable Terms text
              Expanded(child: SingleChildScrollView(child: _termsText())),

              // ✅ Fixed Checkbox + Button at bottom
              _checkBoxButton(controller: controller),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _termsText() {
  return Column(
    children: [
      Container(
        width: double.infinity.w,
        decoration: BoxDecoration(
          color: AppColors.primaryColor,
          borderRadius: BorderRadius.all(Radius.circular(8.r)),
        ),
        child: Padding(
          padding: EdgeInsets.all(16.0.h),
          child: Column(
            children: [
              Row(
                children: [
                  Image.asset(
                    IconsAssetsPaths.instance.file_icon,
                    height: 24.h,
                    width: 24.w,
                  ),
                  SizedBox(width: 6.w),
                  CustomText(
                    text: "Program Overview",
                    color: AppColors.whiteColor,
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ],
              ),
              SizedBox(height: 12.h),
              CustomText(
                text:
                    'Our Affiliate Program allows individuals and businesses to earn commissions by promoting and referring customers to our platform. These Terms govern your participation and outline your rights and responsibilities as an affiliate partner.',
                color: AppColors.whiteColor,
                fontSize: 16.sp,
                fontWeight: FontWeight.w400,
              ),
              SizedBox(height: 12.h),
            ],
          ),
        ),
      ),
      SizedBox(height: 20.h),
      _eligibilityRequirements(),
      SizedBox(height: 40.h),
      _prohibitedActivities(),
      SizedBox(height: 20.h),
    ],
  );
}

Widget _eligibilityRequirements() {
  return Padding(
    padding: EdgeInsets.symmetric(vertical: 12.h),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(
          text: 'Eligibility Requirements',
          fontWeight: FontWeight.w500,
          color: AppColors.blackColor,
          fontSize: 20.sp,
        ),
        SizedBox(height: 12.h),

        Row(
          children: [
            CustomText(text: '●', fontSize: 12.sp, color: AppColors.blueColor),
            SizedBox(width: 8.w),
            CustomText(
              text: 'Must be at least 18 years of age or older.',
              fontWeight: FontWeight.w400,
              color: AppColors.blackColor,
              fontSize: 16.sp,
            ),
          ],
        ),
        SizedBox(height: 12.h),

        Row(
          children: [
            CustomText(text: '●', fontSize: 12.sp, color: AppColors.blueColor),
            SizedBox(width: 8.w),
            CustomText(
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              text: 'Must have a valid and active account\non our platform.',
              fontWeight: FontWeight.w400,
              color: AppColors.blackColor,
              fontSize: 16.sp,
            ),
          ],
        ),
        SizedBox(height: 12.h),

        Row(
          children: [
            CustomText(text: '●', fontSize: 12.sp, color: AppColors.blueColor),
            SizedBox(width: 8.w),
            CustomText(
              maxLines: 3,
              text:
                  'Accurate personal and banking/\npayment details required for payouts.',
              fontWeight: FontWeight.w400,
              color: AppColors.blackColor,
              fontSize: 16.sp,
            ),
          ],
        ),
      ],
    ),
  );
}

Widget _prohibitedActivities() {
  return Padding(
    padding: EdgeInsets.symmetric(vertical: 12.h),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(
          text: 'Eligibility Requirements',
          fontWeight: FontWeight.w500,
          color: AppColors.blackColor,
          fontSize: 20.sp,
        ),
        SizedBox(height: 12.h),

        Row(
          children: [
            CustomText(text: '●', fontSize: 12.sp, color: AppColors.redColor),
            SizedBox(width: 8.w),
            CustomText(
              text: 'Must be at least 18 years of age or older.',
              fontWeight: FontWeight.w400,
              color: AppColors.blackColor,
              fontSize: 16.sp,
            ),
          ],
        ),
        SizedBox(height: 12.h),

        Row(
          children: [
            CustomText(text: '●', fontSize: 12.sp, color: AppColors.redColor),
            SizedBox(width: 8.w),
            CustomText(
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              text: 'Must have a valid and active account\non our platform.',
              fontWeight: FontWeight.w400,
              color: AppColors.blackColor,
              fontSize: 16.sp,
            ),
          ],
        ),
        SizedBox(height: 12.h),

        Row(
          children: [
            CustomText(text: '●', fontSize: 12.sp, color: AppColors.redColor),
            SizedBox(width: 8.w),
            CustomText(
              maxLines: 3,
              text:
                  'Accurate personal and banking/\npayment details required for payouts.',
              fontWeight: FontWeight.w400,
              color: AppColors.blackColor,
              fontSize: 16.sp,
            ),
          ],
        ),
      ],
    ),
  );
}

Widget _checkBoxButton({required TermsConditionControllers controller}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Row(
        children: [
          Obx(
            () => Checkbox(
              value: controller.isChecked.value,
              onChanged: (value) {
                controller.isChecked.value = value!;
              },
              activeColor: AppColors.primaryColor,

              checkColor: Colors.white,
            ),
          ),

          CustomText(
            text: 'Agree to the Terms of service and Privacy\npolicy.',
            color: AppColors.blackColor,
            fontSize: 14.sp,
            fontWeight: FontWeight.w400,
          ),
        ],
      ),
      SizedBox(height: 24.h),

      CustomButton(
        text: 'Continue',
        fontSize: 18.sp,
        onPressed: () {
          if (controller.isChecked.value) {
            Get.to(() => PricingPlanScreen());
          } else {
            Get.snackbar(
              'Unchecked',
              'Please check the box before continuing',
              snackPosition: SnackPosition.BOTTOM,
              backgroundColor: AppColors.primaryColor,
              colorText: Colors.white,
            );
          }
        },
      ),
    ],
  );
}
