import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sandlink/core/widgets/custom_button.dart';
import 'package:sandlink/core/wrappers/custom_text.dart';
import '../../../../core/app_colors/app_colors.dart';
import '../../../../core/widgets/custom_app_bar.dart';
import '../../../../core/widgets/custom_text_field.dart';
import '../controller/edit_profile_controller.dart';

class EditProfileScreen extends StatelessWidget {
  EditProfileScreen({super.key});

  final conttroller = Get.put(EditUserProfileController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Profile',
        onLeadingPressed: () => Get.back(),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Center(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  _userChangeProfile(controller: conttroller),
                  SizedBox(height: 32.h),
                  _changeUserinfo(controller: conttroller),
                ],
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
          child: _saveButton(controller: conttroller),
        ),
      ),
    );
  }
}

Widget _userChangeProfile({required EditUserProfileController controller}) {
  return Column(
    children: [
      SizedBox(height: 16.h),
      Obx(
        () => CircleAvatar(
          radius: 60,
          backgroundImage: controller.profileImage.value != null
              ? FileImage(controller.profileImage.value!)
              : null,
          child: controller.profileImage.value == null
              ? Icon(Icons.person, size: 60)
              : null,
        ),
      ),
      SizedBox(height: 16.h),
      TextButton(
        onPressed: () {
          if (kDebugMode) {
            print('click');
          }
          controller.pickImageFromGallery();
        },
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

Widget _changeUserinfo({required EditUserProfileController controller}) {
  controller.fullNameController.text = controller.userInfoController.getUserName
      .toString();
  controller.numberController.text = controller.userInfoController.getUserphone
      .toString();
  controller.emailController.text = controller.userInfoController.getUserEmail
      .toString();

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
          isReadOnly: true,
          headerfontSize: 16.sp,
          hintTextFontWeight: FontWeight.w400,
          hintTextColor: AppColors.lightGrey,
          hintText: '',
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

Widget _saveButton({required EditUserProfileController controller}) {
  return CustomButton(
    onPressed: () {
      controller.updateProfile();
    },
    text: 'Save',
  );
}
