import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/app_colors/app_colors.dart';
import '../../../../../core/config/constants/assets_paths/icons_assets_paths.dart';
import '../../../../../core/wrappers/custom_text.dart';

class RiderDocumentVerificationScreen extends StatelessWidget {
  const RiderDocumentVerificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                SizedBox(height: 50.h),
                Container(
                  width: double.infinity.w,
                  decoration: BoxDecoration(
                    border: Border.all(color: AppColors.lightGreyD1),
                    borderRadius: BorderRadius.all(Radius.circular(8.r)),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    child: Column(
                      children: [
                        SizedBox(height: 16.h),
                        CustomText(
                          text: 'Document Verification',
                          color: AppColors.blackColor,
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w600,
                        ),
                        SizedBox(height: 8.h),
                        CustomText(
                          text: 'Upload your documents for verification',
                          color: AppColors.lightGrey,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                        ),
                        SizedBox(height: 20.h),
                        Column(
                          children: [
                            _nidCard(),
                            SizedBox(height: 35.h),
                            _licence(),
                            SizedBox(height: 35.h),
                            _tin(),
                            SizedBox(height: 35.h),
                            _address(),
                            SizedBox(height: 35.h),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 35.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget _nidCard() {
  return Column(
    children: [
      DottedBorder(
        options: RoundedRectDottedBorderOptions(
          dashPattern: [10, 2],
          strokeWidth: 2,
          color: AppColors.lightGreyD1,
          padding: EdgeInsets.all(16),
          radius: Radius.circular(8.r),
        ),
        child: SizedBox(
          height: 173.h,
          width: double.infinity.w,
          child: Center(
            child: Column(
              children: [
                Image.asset(
                  IconsAssetsPaths.instance.uparrow,
                  height: 48.h,
                  width: 48.h,
                ),
                SizedBox(height: 12.h),
                CustomText(
                  text: 'National ID / Passport(Front) *',
                  color: AppColors.blackColor,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                ),
                SizedBox(height: 8.h),
                CustomText(
                  text: 'Clear photo of front side',
                  color: AppColors.lightGrey,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                ),
                SizedBox(height: 8.h),

                TextButton(
                  onPressed: () {},
                  child: CustomText(
                    text: 'Click to upload',
                    color: AppColors.blueColor,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      SizedBox(height: 35.h),
      DottedBorder(
        options: RoundedRectDottedBorderOptions(
          dashPattern: [10, 2],
          strokeWidth: 2,
          color: AppColors.lightGreyD1,
          padding: EdgeInsets.all(16),
          radius: Radius.circular(8.r),
        ),
        child: SizedBox(
          height: 173.h,
          width: double.infinity.w,
          child: Center(
            child: Column(
              children: [
                Image.asset(
                  IconsAssetsPaths.instance.uparrow,
                  height: 48.h,
                  width: 48.h,
                ),
                SizedBox(height: 12.h),
                CustomText(
                  text: 'National ID / Passport(Back) *',
                  color: AppColors.blackColor,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                ),
                SizedBox(height: 8.h),
                CustomText(
                  text: 'Clear photo of front side',
                  color: AppColors.lightGrey,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                ),
                SizedBox(height: 8.h),

                TextButton(
                  onPressed: () {},
                  child: CustomText(
                    text: 'Click to upload',
                    color: AppColors.blueColor,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    ],
  );
}

Widget _licence() {
  return Column(
    children: [
      DottedBorder(
        options: RoundedRectDottedBorderOptions(
          dashPattern: [10, 2],
          strokeWidth: 2,
          color: AppColors.lightGreyD1,
          padding: EdgeInsets.all(16),
          radius: Radius.circular(8.r),
        ),
        child: SizedBox(
          height: 173.h,
          width: double.infinity.w,
          child: Center(
            child: Column(
              children: [
                Image.asset(
                  IconsAssetsPaths.instance.uparrow,
                  height: 48.h,
                  width: 48.h,
                ),
                SizedBox(height: 12.h),
                CustomText(
                  text: 'Trade Licence',
                  color: AppColors.blackColor,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                ),
                SizedBox(height: 8.h),
                CustomText(
                  text: 'Upload your Trade Licence Photo',
                  color: AppColors.lightGrey,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                ),
                SizedBox(height: 8.h),

                TextButton(
                  onPressed: () {},
                  child: CustomText(
                    text: 'Click to upload',
                    color: AppColors.blueColor,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    ],
  );
}

Widget _tin() {
  return Column(
    children: [
      DottedBorder(
        options: RoundedRectDottedBorderOptions(
          dashPattern: [10, 2],
          strokeWidth: 2,
          color: AppColors.lightGreyD1,
          padding: EdgeInsets.all(16),
          radius: Radius.circular(8.r),
        ),
        child: SizedBox(
          height: 173.h,
          width: double.infinity.w,
          child: Center(
            child: Column(
              children: [
                Image.asset(
                  IconsAssetsPaths.instance.uparrow,
                  height: 48.h,
                  width: 48.h,
                ),
                SizedBox(height: 12.h),
                CustomText(
                  text: 'TIN Certificate',
                  color: AppColors.blackColor,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                ),
                SizedBox(height: 8.h),
                CustomText(
                  text: 'Upload your TIN Certificate',
                  color: AppColors.lightGrey,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                ),
                SizedBox(height: 8.h),

                TextButton(
                  onPressed: () {},
                  child: CustomText(
                    text: 'Click to upload',
                    color: AppColors.blueColor,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    ],
  );
}

Widget _address() {
  return Column(
    children: [
      Row(
        children: [
          Image.asset(
            IconsAssetsPaths.instance.locations_icon,
            color: AppColors.blackColor,
          ),
          SizedBox(width: 5.w),

          CustomText(
            text: 'Address Verification',
            color: AppColors.blackColor,
            fontSize: 18.sp,
            fontWeight: FontWeight.w600,
          ),

          SizedBox(height: 35.h),
        ],
      ),
      SizedBox(height: 15.h),
      DottedBorder(
        options: RoundedRectDottedBorderOptions(
          dashPattern: [10, 2],
          strokeWidth: 2,
          color: AppColors.lightGreyD1,
          padding: EdgeInsets.all(16),
          radius: Radius.circular(8.r),
        ),
        child: SizedBox(
          height: 185.h,
          width: double.infinity.w,
          child: Center(
            child: Column(
              children: [
                Image.asset(
                  IconsAssetsPaths.instance.uparrow,
                  height: 48.h,
                  width: 48.h,
                ),
                SizedBox(height: 12.h),
                CustomText(
                  text: 'Utility Bill / Bank Statement',
                  color: AppColors.blackColor,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                ),
                SizedBox(height: 8.h),
                CustomText(
                  textAlign: TextAlign.center,
                  text:
                      'Recent utility bill or bank statement showing your name and address',
                  color: AppColors.lightGrey,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                ),
                SizedBox(height: 8.h),

                TextButton(
                  onPressed: () {},
                  child: CustomText(
                    text: 'Click to upload',
                    color: AppColors.blueColor,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    ],
  );
}
