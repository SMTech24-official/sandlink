import 'dart:io';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sandlink/features/user/join_affiliates/controllers/document_upload_controller.dart';

import '../../../../core/app_colors/app_colors.dart';
import '../../../../core/config/constants/assets_paths/icons_assets_paths.dart';
import '../../../../core/wrappers/custom_text.dart';

class DocumentVerificationScreen extends StatelessWidget {
  const DocumentVerificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(DocumentVerificationController());

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
                            _nidCard(controller),
                            SizedBox(height: 35.h),
                            _licence(controller),
                            SizedBox(height: 35.h),
                            _tin(controller),
                            SizedBox(height: 35.h),
                            _address(controller),
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

  Widget _nidCard(DocumentVerificationController controller) {
    return Column(
      children: [
        Obx(
          () => DocumentUploadContainer(
            image: controller.nidFrontImage.value,
            title: 'National ID / Passport(Front) *',
            subtitle: 'Clear photo of front side',
            onTap: () => controller.pickImage('nidFront'),
          ),
        ),
        SizedBox(height: 35.h),
        Obx(
          () => DocumentUploadContainer(
            image: controller.nidBackImage.value,
            title: 'National ID / Passport(Back) *',
            subtitle: 'Clear photo of back side',
            onTap: () => controller.pickImage('nidBack'),
          ),
        ),
      ],
    );
  }

  Widget _licence(DocumentVerificationController controller) {
    return Obx(
      () => DocumentUploadContainer(
        image: controller.licenceImage.value,
        title: 'Trade Licence',
        subtitle: 'Upload your Trade Licence Photo',
        onTap: () => controller.pickImage('licence'),
      ),
    );
  }

  Widget _tin(DocumentVerificationController controller) {
    return Obx(
      () => DocumentUploadContainer(
        image: controller.tinImage.value,
        title: 'TIN Certificate',
        subtitle: 'Upload your TIN Certificate',
        onTap: () => controller.pickImage('tin'),
      ),
    );
  }

  Widget _address(DocumentVerificationController controller) {
    return Column(
      children: [
        Row(
          children: [
            Image.asset(
              IconsAssetsPaths.instance.locationsicon,
              color: AppColors.blackColor,
            ),
            SizedBox(width: 5.w),
            CustomText(
              text: 'Address Verification',
              color: AppColors.blackColor,
              fontSize: 18.sp,
              fontWeight: FontWeight.w600,
            ),
          ],
        ),
        SizedBox(height: 15.h),
        Obx(
          () => DocumentUploadContainer(
            image: controller.addressImage.value,
            title: 'Utility Bill / Bank Statement',
            subtitle:
                'Recent utility bill or bank statement showing your name and address',
            onTap: () => controller.pickImage('address'),
            height: 185.h,
          ),
        ),
      ],
    );
  }
}

class DocumentUploadContainer extends StatelessWidget {
  final File? image;
  final String title;
  final String subtitle;
  final VoidCallback onTap;
  final double? height;

  const DocumentUploadContainer({
    super.key,
    required this.image,
    required this.title,
    required this.subtitle,
    required this.onTap,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return DottedBorder(
      options: RoundedRectDottedBorderOptions(
        dashPattern: [10, 2],
        strokeWidth: 2,
        color: AppColors.lightGreyD1,
        padding: EdgeInsets.all(16),
        radius: Radius.circular(8.r),
      ),
      child: InkWell(
        onTap: onTap,
        child: SizedBox(
          height: height ?? 173.h,
          width: double.infinity.w,
          child: image != null
              ? Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8.r),
                      child: Image.file(
                        image!,
                        width: double.infinity,
                        height: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Positioned(
                      top: 8,
                      right: 8,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.6),
                          borderRadius: BorderRadius.circular(20.r),
                        ),
                        child: IconButton(
                          icon: Icon(
                            Icons.edit,
                            color: Colors.white,
                            size: 20.sp,
                          ),
                          onPressed: onTap,
                        ),
                      ),
                    ),
                  ],
                )
              : Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        IconsAssetsPaths.instance.uparrow,
                        height: 48.h,
                        width: 48.h,
                      ),
                      SizedBox(height: 12.h),
                      CustomText(
                        text: title,
                        color: AppColors.blackColor,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                      ),
                      SizedBox(height: 8.h),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.w),
                        child: CustomText(
                          textAlign: TextAlign.center,
                          text: subtitle,
                          color: AppColors.lightGrey,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(height: 8.h),
                      CustomText(
                        text: 'Click to upload',
                        color: AppColors.blueColor,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ],
                  ),
                ),
        ),
      ),
    );
  }
}
