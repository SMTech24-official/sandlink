import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sandlink/core/app_colors/app_colors.dart';
import 'package:sandlink/core/app_routes/app_route_names.dart';
import 'package:sandlink/core/helpers/validations/form_validations.dart';
import 'package:sandlink/core/widgets/custom_button.dart';
import 'package:sandlink/core/widgets/custom_text_field.dart';
import 'package:sandlink/core/wrappers/custom_text.dart';
import 'package:sandlink/features/common/auth/controller/forgot_pass_controller.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ForgotPassController());
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: Column(
              children: [
                CustomText(
                  text: 'Forgot Password',
                  fontSize: 26.spMin,
                  fontWeight: FontWeight.w600,
                ),
                5.verticalSpace,
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: CustomText(
                    text:
                        'Enter your email, we will send a verification code to your email',
                    fontSize: 16.spMin,
                    fontWeight: FontWeight.w400,
                    color: AppColors.lightGrey,
                    textAlign: TextAlign.center,
                  ),
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
                    ],
                  ),
                ),
                20.verticalSpace,
                CustomButton(
                  onPressed: () =>
                      Get.toNamed(AppRouteNames.instance.forgotPasswordVerify),
                  text: 'Send OTP',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
