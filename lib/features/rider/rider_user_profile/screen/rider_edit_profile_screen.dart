import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sandlink/core/widgets/custom_button.dart';
import 'package:sandlink/core/wrappers/custom_text.dart';
import '../../../../core/app_colors/app_colors.dart';
import '../../../../core/config/constants/assets_paths/icons_assets_paths.dart';
import '../../../../core/widgets/custom_app_bar.dart';
import '../../../../core/widgets/custom_text_field.dart';
import '../controller/rider_edit_profile_controller.dart';

class RiderEditProfileScreen extends StatelessWidget {
  RiderEditProfileScreen({super.key});

  final conttroller = Get.put(RiderEditUserProfileController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: CustomAppBar(
        title: 'Edit Profile',
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
                _userChangeProfile(),
                SizedBox(height: 32.h),
                _changeUserinfo(controller: conttroller),
                Spacer(),
                _saveButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget _userChangeProfile() {
  return Column(
    children: [
      SizedBox(height: 16.h),
      CircleAvatar(
        backgroundImage: AssetImage(IconsAssetsPaths.instance.userImage),
        radius: 56.r,
      ),
      SizedBox(height: 16.h),
      TextButton(
        onPressed: () {},
        child: CustomText(
          text: 'Change Profile Photo',
          color: AppColors.blueColor,
          fontSize: 20.sp,
          fontWeight: FontWeight.w500,
        ),
      ),
    ],
  );
}

Widget _changeUserinfo({required RiderEditUserProfileController controller}) {
  return Form(
    child: Column(
      children: [
        CustomInputField(
          textController: controller.fullNameController,
          borderSide: BorderSide(color: AppColors.lightGreyD1),
          headerTitle: 'Full Name',
          headerFontWeight: FontWeight.w500,
          headerTextColor: AppColors.blackColor,
          fontSize: 14.sp,
          headerfontSize: 16.sp,
          hintTextFontWeight: FontWeight.w400,
          hintTextColor: AppColors.lightGrey,
          hintText: 'Prince Waorgu',
          keyboardType: TextInputType.text,
        ),
        SizedBox(height: 16.h),
        CustomInputField(
          textController: controller.emailController,
          borderSide: BorderSide(color: AppColors.lightGreyD1),
          headerTitle: 'Email Address',
          headerFontWeight: FontWeight.w500,
          headerTextColor: AppColors.blackColor,
          fontSize: 14.sp,
          headerfontSize: 16.sp,
          hintTextFontWeight: FontWeight.w400,
          hintTextColor: AppColors.lightGrey,
          isReadOnly: true,
          hintText: 'princewargu@gmail.com',
          keyboardType: TextInputType.emailAddress,
        ),
        SizedBox(height: 16.h),
        CustomInputField(
          textController: controller.numberController,
          borderSide: BorderSide(color: AppColors.lightGreyD1),
          headerTitle: 'Phone Number',
          headerFontWeight: FontWeight.w500,
          headerTextColor: AppColors.blackColor,
          fontSize: 14.sp,
          headerfontSize: 16.sp,
          hintTextFontWeight: FontWeight.w400,
          hintTextColor: AppColors.lightGrey,
          hintText: '+12345678',
          keyboardType: TextInputType.number,
        ),
        SizedBox(height: 16.h),
      ],
    ),
  );
}

Widget _saveButton() {
  return CustomButton(onPressed: () {}, text: 'Save');
}
