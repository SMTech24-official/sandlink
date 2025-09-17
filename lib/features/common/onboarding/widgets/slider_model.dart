import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sandlink/core/wrappers/custom_text.dart';

import '../../../../../core/app_colors/app_colors.dart';

class SliderModel extends StatelessWidget {
  const SliderModel({
    super.key,
    required this.image,
    required this.title,
    required this.description,
  });

  final String image;
  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.sizeOf(context).width;
    return Column(
      children: [
        Container(
          width: double.maxFinite,
          height: screenWidth * 1.1,
          decoration: BoxDecoration(
            color: AppColors.primaryColor,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(16.r),
              bottomRight: Radius.circular(16.r),
            ),
            image: DecorationImage(fit: BoxFit.cover, image: AssetImage(image)),
          ),
        ),
        60.verticalSpace,
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 12),
          child: CustomText(
            text: title,
            fontSize: 24,
            fontWeight: FontWeight.w600,
            color: AppColors.darkGreyColor,
            textAlign: TextAlign.center,
          ),
        ),
        10.verticalSpace,
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.w),
          child: CustomText(
            text: description,
            fontSize: 16,
            fontWeight: FontWeight.w400,
            color: AppColors.lightGrey,
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}

class TopRoundedClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height - 80);
    path.quadraticBezierTo(
      size.width / 2,
      size.height,
      size.width,
      size.height - 80,
    );
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}
