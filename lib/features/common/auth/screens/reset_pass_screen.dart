import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sandlink/core/app_colors/app_colors.dart';
import 'package:sandlink/core/app_routes/app_route_names.dart';
import 'package:sandlink/core/config/constants/assets_paths/svg_assets_paths.dart';
import 'package:sandlink/core/helpers/validations/form_validations.dart';
import 'package:sandlink/core/widgets/custom_button.dart';
import 'package:sandlink/core/widgets/custom_dialog.dart';
import 'package:sandlink/core/widgets/custom_text_field.dart';
import 'package:sandlink/core/wrappers/custom_text.dart';
import 'package:sandlink/features/common/auth/controller/reset_pass_controller.dart';

class ResetPassScreen extends StatelessWidget {
  const ResetPassScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ResetPassController());
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: Form(
              key:controller.passkey ,

              child: Column(
                children: [
                  CustomText(
                    text: 'Create New Password',
                    fontSize: 26.spMin,
                    fontWeight: FontWeight.w600,
                  ),
                  5.verticalSpace,
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: CustomText(
                      text:
                          'Your password must be different from previous used password',
                      fontSize: 16.spMin,
                      fontWeight: FontWeight.w400,
                      color: AppColors.lightGrey,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  20.verticalSpace,
                  Obx(
                    () => CustomInputField(
                      headerTitle: 'Password',
                      textController: controller.newPassController,
                      hintText: "Enter your password",
                      isObsecure: !controller.isNewPassVisible.value,
                      prefixIcon: Icons.lock_outline_rounded,
                      formValidator: (value) =>
                          Validation.validatePassword(value!),
                      suffixWidget: controller.isNewPassVisible.value
                          ? GestureDetector(
                              onTap: controller.toggleNewPasswordVisibility,
                              child: Icon(
                                Icons.visibility_outlined,
                                color: AppColors.lightGrey,
                              ),
                            )
                          : GestureDetector(
                              onTap: controller.toggleNewPasswordVisibility,
                              child: Icon(
                                Icons.visibility_off_outlined,
                                color: AppColors.lightGrey,
                              ),
                            ),
                    ),
                  ),
                  20.verticalSpace,
                  Obx(
                    () => CustomInputField(
                      headerTitle: 'Confirm Password',
                      textController: controller.confirmPassController,
                      hintText: "Enter confirm password",
                      isObsecure: !controller.isConfirmPassVisible.value,
                      prefixIcon: Icons.lock_outline_rounded,
                     formValidator: (value) {
                  if (value == null || value.isEmpty) {
                  return "Please confirm your password";
                  }
                  if (value != controller.newPassController.text) {
                  return "Passwords do not match";
                  }
                  return null;
                  },
                      suffixWidget: controller.isConfirmPassVisible.value
                          ? GestureDetector(
                              onTap: controller.toggleConfirmPasswordVisibility,
                              child: Icon(
                                Icons.visibility_outlined,
                                color: AppColors.lightGrey,
                              ),
                            )
                          : GestureDetector(
                              onTap: controller.toggleConfirmPasswordVisibility,
                              child: Icon(
                                Icons.visibility_off_outlined,
                                color: AppColors.lightGrey,
                              ),
                            ),
                    ),
                  ),
                  20.verticalSpace,
                  CustomButton(
                    onPressed:() {
                      if(controller.passkey.currentState!.validate()){

                   controller.createNewForgotPassword();
                 // Get.dialog(
                 //          AlertDialog(
                 //            backgroundColor: Colors.white,
                 //            content: CustomDialog(
                 //              title: "Password Changed",
                 //              subtitle:
                 //                  "Password changed successfully, you can login again with new password.",
                 //              imagePath: SvgAssetsPaths.instance.successBack,
                 //              primaryButtonText: "Back to Login",
                 //              buttonFontSize: 16.spMin,
                 //              onPrimaryTap: () =>
                 //                  Get.offAllNamed(AppRouteNames.instance.login),
                 //            ),
                 //          ),
                 //        );
                      }
                    },

                    text: 'Reset Password',
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
