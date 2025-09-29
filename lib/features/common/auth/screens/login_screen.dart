import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sandlink/core/app_colors/app_colors.dart';
import 'package:sandlink/core/app_routes/app_route_names.dart';
import 'package:sandlink/core/helpers/validations/form_validations.dart';
import 'package:sandlink/core/widgets/custom_button.dart';
import 'package:sandlink/core/widgets/custom_richtext.dart';
import 'package:sandlink/core/widgets/custom_text_field.dart';
import 'package:sandlink/core/wrappers/custom_text.dart';
import 'package:sandlink/features/common/auth/controller/login_controller.dart';

import '../../splash/controller/choose_role_controller.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final roleController = Get.put(ChooseRoleController());

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Center(
              child: Column(
                children: [
                  CustomText(
                    text: 'Welcome Back',
                    fontSize: 26.spMin,
                    fontWeight: FontWeight.w600,
                  ),
                  5.verticalSpace,
                  CustomText(
                    text: 'Please enter your details',
                    fontSize: 16.spMin,
                    fontWeight: FontWeight.w400,
                    color: AppColors.lightGrey,
                    textAlign: TextAlign.center,
                  ),
                  20.verticalSpace,
                  Form(
                    child: Column(
                      children: [
                        CustomInputField(
                          headerTitle: 'Email',
                          textController: controller.emailController,
                          hintText: 'Enter your email',
                          prefixIcon: Icons.email_outlined,
                          keyboardType: TextInputType.emailAddress,
                          formValidator: (value) =>
                              Validation.validateEmail(value),
                        ),
                        20.verticalSpace,
                        Obx(
                          () => CustomInputField(
                            headerTitle: 'Password',
                            textController: controller.passController,
                            hintText: 'Enter your password',
                            isObsecure: !controller.isPassVisible.value,
                            prefixIcon: Icons.lock_outline_rounded,
                            formValidator: (value) =>
                                Validation.validatePassword(value),
                            suffixWidget: controller.isPassVisible.value
                                ? GestureDetector(
                                    onTap: controller.togglePasswordVisibility,
                                    child: Icon(
                                      Icons.visibility_outlined,
                                      color: AppColors.lightGrey,
                                    ),
                                  )
                                : GestureDetector(
                                    onTap: controller.togglePasswordVisibility,
                                    child: Icon(
                                      Icons.visibility_off_outlined,
                                      color: AppColors.lightGrey,
                                    ),
                                  ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  10.verticalSpace,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Obx(
                            () => Checkbox(
                              activeColor: AppColors.primaryColor,
                              value: controller.isChecked.value,
                              onChanged: (value) {
                                controller.isChecked.value =
                                    !controller.isChecked.value;
                              },
                            ),
                          ),
                          CustomText(
                            text: 'Remember Me',
                            fontSize: 16.spMin,
                            fontWeight: FontWeight.w400,
                            color: AppColors.darkGreyColor,
                          ),
                        ],
                      ),
                      TextButton(
                        onPressed: () {
                          Get.toNamed(AppRouteNames.instance.forgotPassword);
                          controller.emailController.clear();
                          controller.passController.clear();
                        },
                        child: CustomText(
                          text: 'Forgot Password',
                          fontSize: 16.spMin,
                          fontWeight: FontWeight.w500,
                          color: AppColors.redColor,
                        ),
                      ),
                    ],
                  ),
                  10.verticalSpace,
                  CustomButton(
                    onPressed: () {
                      if (controller.isChecked.value) {
                        controller.userlogin();
                      } else {
                        Get.snackbar('Remember Me', 'Places Check');
                      }
                    },

                    text: 'Login',
                  ),
                  15.verticalSpace,
                  CustomRichtext(
                    primaryText: 'Don\'t have an account? ',
                    secondaryText: 'Register',
                    primeFontSize: 14.spMin,
                    secFontSize: 14.spMin,
                    primeFontWeight: FontWeight.w400,
                    secFontWeight: FontWeight.w600,
                    primeTextColor: AppColors.lightGrey,
                    secTextColor: AppColors.primaryColor,
                    onSecPressed: () =>
                        Get.toNamed(AppRouteNames.instance.register),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
