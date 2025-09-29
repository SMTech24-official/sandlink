import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sandlink/core/app_colors/app_colors.dart';
import 'package:sandlink/core/widgets/custom_app_bar.dart';
import 'package:sandlink/core/widgets/custom_button.dart';
import 'package:sandlink/core/widgets/custom_text_field.dart';
import 'package:sandlink/core/wrappers/custom_text.dart';
import '../../../../core/config/constants/assets_paths/icons_assets_paths.dart';
import '../../../../core/widgets/custom_dropdown.dart';
import '../../../../core/widgets/custom_show_dialog.dart';
import '../../nav_bar/screens/user_nav_bar.dart';
import '../controllers/payment_controller.dart';

class PaymentScreen extends StatelessWidget {
  PaymentScreen({super.key});

  final controller = Get.put(PaymentController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Payment',
        centerTitle: true,
        onLeadingPressed: () => Get.back(),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Stack(
            children: [
              SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: SizedBox(
                  height: Get.height / 1.2.h,
                  width: double.infinity.w,

                  child: _customTextFormFiled(controller: controller),
                ),
              ),

              Align(alignment: Alignment.bottomCenter, child: _paymentButton()),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _customTextFormFiled({required PaymentController controller}) {
  return Form(
    key: controller.paymentKey,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomInputField(
          borderSide: BorderSide(color: AppColors.lightGreyD1),
          headerTitle: 'Card number',
          headerFontWeight: FontWeight.w500,
          headerTextColor: AppColors.blackColor,
          fontSize: 14.sp,
          headerfontSize: 16.sp,
          hintTextFontWeight: FontWeight.w400,
          hintTextColor: AppColors.lightGrey,
          hintText: '1234 123412341234',
          keyboardType: TextInputType.number,
        ),
        SizedBox(height: 16.h),
        CustomInputField(
          borderSide: BorderSide(color: AppColors.lightGreyD1),
          headerTitle: 'CVC',
          headerFontWeight: FontWeight.w500,
          headerTextColor: AppColors.blackColor,
          fontSize: 14.sp,
          headerfontSize: 16.sp,
          hintTextFontWeight: FontWeight.w400,
          hintTextColor: AppColors.lightGrey,
          hintText: 'CVC',
          keyboardType: TextInputType.text,
        ),
        SizedBox(height: 16.h),
        CustomInputField(
          borderSide: BorderSide(color: AppColors.lightGreyD1),
          headerTitle: 'Expiry',
          headerFontWeight: FontWeight.w500,
          headerTextColor: AppColors.blackColor,
          fontSize: 14.sp,
          headerfontSize: 16.sp,
          hintTextFontWeight: FontWeight.w400,
          hintTextColor: AppColors.lightGrey,
          hintText: 'MM / YY',
          keyboardType: TextInputType.number,
        ),
        SizedBox(height: 16.h),
        CustomText(
          text: 'Country',
          color: AppColors.blackColor,
          fontSize: 16.sp,
          fontWeight: FontWeight.w500,
        ),
        SizedBox(height: 10.h),
        CustomDropdown(
          selectedValue: controller.selectedValue.value,
          items: controller.items,
          onChanged: (String? p1) => controller.setSelected,
        ),
        SizedBox(height: 16.h),
        CustomInputField(
          borderSide: BorderSide(color: AppColors.lightGreyD1),
          headerTitle: 'Postal Code',
          headerFontWeight: FontWeight.w500,
          headerTextColor: AppColors.blackColor,
          fontSize: 14.sp,
          headerfontSize: 16.sp,
          hintTextFontWeight: FontWeight.w400,
          hintTextColor: AppColors.lightGrey,
          hintText: 'Postal Code',
          keyboardType: TextInputType.number,
        ),
      ],
    ),
  );
}

Widget _paymentButton() {
  return CustomButton(
    onPressed: () => showCustomDialog(
      imagePath: IconsAssetsPaths.instance.successimage,
      title: 'Successful',
      subtitle: 'Your Order is Confirmed!',

      colorbutton1: AppColors.whiteColor,
      colorbutton2: AppColors.lightGrey,

      primaryButtonText: 'View Order',
      primaryButton: () {},
      secondaryButtonText: 'Back to Home',

      secondaryButton: () => Get.offAll(() => UserNavBar()),
    ),

    text: 'Payment Now',
  );
}
