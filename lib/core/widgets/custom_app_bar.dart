import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../app_colors/app_colors.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    this.centerTitle,
    this.title,
    this.actions,
    this.onLeadingPressed, this.child,
  });

  final bool? centerTitle;
  final String? title;
  final Widget? child;
  final List<Widget>? actions;
  final VoidCallback? onLeadingPressed;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: centerTitle ?? true,
      leading: IconButton(
        onPressed: onLeadingPressed ?? () => Get.back(),
        icon: Icon(Icons.arrow_back),
      ),
      title: child?? Text(
        title ?? '',
        style: TextStyle(
          fontSize: 18.sp,
          fontWeight: FontWeight.w500,
          color: AppColors.darkGreyColor,
        ),
      ),
      actions: actions,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(Get.height * 0.06);
}
