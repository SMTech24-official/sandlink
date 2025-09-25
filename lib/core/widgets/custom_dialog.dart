import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sandlink/core/wrappers/custom_text.dart';

import '../app_colors/app_colors.dart';
import 'custom_button.dart';

class CustomDialog extends StatelessWidget {
  const CustomDialog({
    super.key,
    this.title,
    this.subtitle,
    this.titleFontSize,
    this.subtitleFontSize,
    this.height,
    required this.imagePath,
    this.primaryButtonText,
    this.secondaryButtonText,
    required this.onPrimaryTap,
    this.onSecondaryTap,
    this.buttonFontSize,
  });

  final double? height;
  final String? title;
  final String? subtitle;
  final double? titleFontSize;
  final double? subtitleFontSize;
  final double? buttonFontSize;
  final String imagePath;
  final String? primaryButtonText;
  final String? secondaryButtonText;
  final void Function() onPrimaryTap;
  final void Function()? onSecondaryTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        SvgPicture.asset(imagePath, width: 120.w, height: 120.h),
        SizedBox(height: 30),
        CustomText(
          text: title ?? '',
          fontSize: titleFontSize ?? 24.spMin,
          fontWeight: FontWeight.w600,
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 16),
        CustomText(
          text: subtitle ?? '',
          textAlign: TextAlign.center,
          fontSize: subtitleFontSize ?? 16.spMin,
          fontWeight: FontWeight.w400,
          color: AppColors.lightGrey,
        ),
        SizedBox(height: 25),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: CustomButton(
                text: primaryButtonText ?? 'Continue',
                fontSize: buttonFontSize ?? 14.spMin,
                onPressed: onPrimaryTap,
              ),
            ),
            10.horizontalSpace,
            secondaryButtonText != null
                ? Expanded(
                    child: CustomButton(
                      text: secondaryButtonText ?? 'Next',
                      fontSize: 14.spMin,
                      onPressed: onSecondaryTap ?? () {},
                    ),
                  )
                : SizedBox.shrink(),
          ],
        ),
      ],
    );
  }
}
