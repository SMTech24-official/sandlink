import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:sandlink/core/widgets/custom_button.dart';
import '../../../../core/app_colors/app_colors.dart';
import '../../../../core/config/constants/assets_paths/icons_assets_paths.dart';
import '../../../../core/config/constants/assets_paths/svg_assets_paths.dart';
import '../../../../core/widgets/custom_app_bar.dart';
import '../../../../core/wrappers/custom_text.dart';
import '../controller/save_address_controller.dart';
import 'add_address_screen.dart';
import 'edit_address_screen.dart';

class SaveAddressScreen extends StatelessWidget {
  SaveAddressScreen({super.key});

  final controller = Get.put(SaveAddressController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: CustomAppBar(
        title: 'Saved Address',
        onLeadingPressed: () => Get.back(),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: Get.height / 1.25,
                  width: double.infinity.w,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: _saveAddress(),
                  ),
                ),
                Spacer(),
                _addAddressButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget _saveAddress() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      SizedBox(height: 16.h),
      Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: AppColors.whiteColor,
          border: BoxBorder.all(color: Color(0xff0A2833)),
          borderRadius: BorderRadius.all(Radius.circular(8.r)),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 6.h),
          child: Row(
            children: [
              SvgPicture.asset(SvgAssetsPaths.instance.location),
              SizedBox(width: 8.w),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    text: 'Home',
                    color: AppColors.blackColor,
                    fontWeight: FontWeight.w500,
                    fontSize: 16.sp,
                  ),
                  CustomText(
                    text: '123 Main Street, City, State',
                    color: AppColors.lightGrey,
                    fontWeight: FontWeight.w400,
                    fontSize: 14.sp,
                  ),
                ],
              ),

              Spacer(),
              GestureDetector(
                onTap: () {
                  Get.to(() => EditAddressScreen());
                },
                child: Image.asset(
                  IconsAssetsPaths.instance.edit_icon,
                  height: 20.h,
                  width: 20.w,
                  color: AppColors.blackColor,
                ),
              ),
              SizedBox(width: 12.w),
              GestureDetector(
                onTap: () {},
                child: Image.asset(
                  IconsAssetsPaths.instance.delete_icon,
                  height: 20.h,
                  width: 20.w,
                  color: AppColors.redColor,
                ),
              ),
            ],
          ),
        ),
      ),
      SizedBox(height: 24.h),
      Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: AppColors.whiteColor,
          border: BoxBorder.all(color: Color(0xff0A2833)),
          borderRadius: BorderRadius.all(Radius.circular(8.r)),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 6.h),
          child: Row(
            children: [
              SvgPicture.asset(SvgAssetsPaths.instance.location),
              SizedBox(width: 8.w),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    text: 'Office',
                    color: AppColors.blackColor,
                    fontWeight: FontWeight.w500,
                    fontSize: 16.sp,
                  ),
                  CustomText(
                    text: '456 Business Avenue, City, State',
                    color: AppColors.lightGrey,
                    fontWeight: FontWeight.w400,
                    fontSize: 14.sp,
                  ),
                ],
              ),

              Spacer(),
              GestureDetector(
                onTap: () {},
                child: Image.asset(
                  IconsAssetsPaths.instance.edit_icon,
                  height: 20.h,
                  width: 20.w,
                  color: AppColors.blackColor,
                ),
              ),
              SizedBox(width: 12.w),
              GestureDetector(
                onTap: () {},
                child: Image.asset(
                  IconsAssetsPaths.instance.delete_icon,
                  height: 20.h,
                  width: 20.w,
                  color: AppColors.redColor,
                ),
              ),
            ],
          ),
        ),
      ),
    ],
  );
}

Widget _addAddressButton() {
  return CustomButton(
    onPressed: () => Get.to(() => AddAddressScreen()),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(Icons.add, size: 24.h, color: AppColors.whiteColor),
        SizedBox(width: 5.h),
        CustomText(
          text: "Add Address",
          color: AppColors.whiteColor,
          fontWeight: FontWeight.w500,
          fontSize: 18.sp,
        ),
      ],
    ),
  );
}
