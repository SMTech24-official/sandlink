import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../app_colors/app_colors.dart';

class CustomRichtext extends StatelessWidget {
  const CustomRichtext({
    super.key,
    required this.primaryText,
    this.secondaryText,
    this.primeTextColor,
    this.secTextColor,
    this.primeFontWeight,
    this.secFontWeight,
    this.primeFontSize,
    this.secFontSize,
    this.onPrimePressed,
    this.onSecPressed,
    this.textDecoration,
    this.textAlign,
    this.maxLines,
  });

  final String primaryText;
  final String? secondaryText;
  final Color? primeTextColor;
  final Color? secTextColor;
  final FontWeight? primeFontWeight;
  final FontWeight? secFontWeight;
  final double? primeFontSize;
  final double? secFontSize;
  final void Function()? onPrimePressed;
  final void Function()? onSecPressed;
  final TextDecoration? textDecoration;
  final TextAlign? textAlign;
  final int? maxLines;

  @override
  Widget build(BuildContext context) {
    return RichText(
      overflow: TextOverflow.ellipsis,
      textAlign: textAlign ?? TextAlign.start,
      maxLines: maxLines ?? 2,
      text: TextSpan(
        children: [
          TextSpan(
            text: primaryText,
            style: TextStyle(
              color: primeTextColor ?? AppColors.primaryColor,
              fontWeight: primeFontWeight ?? FontWeight.w400,
              fontSize: (primeFontSize ?? 14).sp,
            ),
            recognizer: TapGestureRecognizer()..onTap = onSecPressed,
          ),
          TextSpan(
            text: secondaryText,
            style: TextStyle(
              fontWeight: secFontWeight ?? FontWeight.w600,
              fontSize: (secFontSize ?? 14).sp,
              color: secTextColor ?? AppColors.lightGrey,
              decoration: textDecoration ?? TextDecoration.none,
            ),
            recognizer: TapGestureRecognizer()..onTap = onSecPressed,
          ),
        ],
      ),
    );
  }
}
