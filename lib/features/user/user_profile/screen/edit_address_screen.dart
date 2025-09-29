import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../core/app_colors/app_colors.dart';
import '../../../../core/widgets/custom_app_bar.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../../core/widgets/custom_text_field.dart';
import '../../../../core/wrappers/custom_text.dart';
import '../controller/edit_address_controller.dart';

class EditAddressScreen extends StatelessWidget {
  EditAddressScreen({super.key});

  final controller = Get.put(EditAddressController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: CustomAppBar(
        title: 'Edit Address',
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
                _addAddressinfo(controller: controller),
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

Widget _addAddressinfo({required EditAddressController controller}) {
  return Form(
    child: Column(
      children: [
        CustomInputField(
          textController: controller.editAddressLocationNameController,
          borderSide: BorderSide(color: AppColors.lightGreyD1),
          headerTitle: 'Location Name',
          headerFontWeight: FontWeight.w500,
          headerTextColor: AppColors.blackColor,
          fontSize: 14.sp,
          headerfontSize: 16.sp,
          hintTextFontWeight: FontWeight.w400,
          hintTextColor: AppColors.lightGrey,
          hintText: 'Home',
          keyboardType: TextInputType.text,
        ),
        SizedBox(height: 16.h),
        CustomInputField(
          maxLines: 4,
          textController: controller.editAddressController,
          borderSide: BorderSide(color: AppColors.lightGreyD1),
          headerTitle: 'Address',
          headerFontWeight: FontWeight.w500,
          headerTextColor: AppColors.blackColor,
          fontSize: 14.sp,
          headerfontSize: 16.sp,
          hintTextFontWeight: FontWeight.w400,
          hintTextColor: AppColors.lightGrey,
          hintText: '456 Business Avenue, City, State',
          keyboardType: TextInputType.emailAddress,
        ),
        SizedBox(height: 16.h),
      ],
    ),
  );
}

Widget _addAddressButton() {
  return CustomButton(
    onPressed: () {},
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomText(
          text: "Save Changes",
          color: AppColors.whiteColor,
          fontWeight: FontWeight.w500,
          fontSize: 18.sp,
        ),
      ],
    ),
  );
}
