import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../app_colors/app_colors.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    this.text,
    required this.onPressed,
    this.backgroundColor,
    this.width,
    this.borderRadius,
    this.textColor,
    this.fontWeight,
    this.height,
    this.fontSize,
    this.borderSide,
    this.child,

  });

  final String? text;
  final void Function() onPressed;
  final Color? backgroundColor;
  final double? width;
  final double? height;
  final BorderRadius? borderRadius;
  final Color? textColor;
  final FontWeight? fontWeight;
  final double? fontSize;
  final BorderSide? borderSide;
  final Widget? child;



  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? MediaQuery.sizeOf(context).width * 0.9,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor ?? AppColors.primaryColor,
          padding: EdgeInsets.symmetric(vertical: (height ?? 12).h),
          shape: RoundedRectangleBorder(
            side: borderSide ?? BorderSide(color: Colors.transparent),
            borderRadius: borderRadius ?? BorderRadius.circular(10.r),
          ),
        ),
        child:
            child ??
            Text(
              text ?? 'No Title',
              style: TextStyle(
                color: textColor ?? Colors.white,
                fontSize: (fontSize ?? 18).spMin,
                fontWeight: fontWeight ?? FontWeight.w600,
              ),
            ),
      ),
    );
  }
}
