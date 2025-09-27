import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';
import 'package:sandlink/core/app_colors/app_colors.dart';
import 'package:sandlink/core/widgets/custom_button.dart';
import 'package:sandlink/core/wrappers/custom_text.dart';
import 'package:sandlink/features/common/auth/controller/register_verify_controller.dart';

class RegisterVerifyScreen extends StatelessWidget {
  const RegisterVerifyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(RegisterVerifyController());
    // controller.startResendTimer();
    final formKey = GlobalKey<FormState>();
    final defaultPinTheme = PinTheme(
      width: 60.w,
      height: 60.h,
      textStyle: TextStyle(
        fontSize: 22.spMin,
        fontWeight: FontWeight.w600,
        color: Colors.black,
      ),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.grey.shade200,
      ),
    );
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: Column(
              children: [
                CustomText(
                  text: 'Verification Code',
                  fontSize: 26.spMin,
                  fontWeight: FontWeight.w600,
                ),
                5.verticalSpace,
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: CustomText(
                    text:
                        'Enter the verification code that we have sent to your email',
                    fontSize: 16.spMin,
                    fontWeight: FontWeight.w400,
                    color: AppColors.lightGrey,
                    textAlign: TextAlign.center,
                  ),
                ),
                20.verticalSpace,
                Form(
                  key: formKey,
                  child: Pinput(
                    autofocus: true,
                    keyboardType: TextInputType.number,
                    controller: controller.otpController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter OTP";
                      } else if (value.length < 4) {
                        return "OTP must be 4 digits";
                      }
                      return null;
                    },
                    length: 4,
                    defaultPinTheme: defaultPinTheme.copyWith(
                      textStyle: TextStyle(
                        fontSize: 24.spMin,
                        color: AppColors.primaryColor,
                        fontWeight: FontWeight.w600,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30),
                        border: Border.all(color: Color(0xFFE3E3E9), width: 2),
                      ),
                    ),
                    focusedPinTheme: defaultPinTheme.copyWith(
                      textStyle: TextStyle(
                        fontSize: 24.spMin,
                        color: AppColors.darkGreyColor,
                        fontWeight: FontWeight.w600,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30),
                        border: Border.all(
                          color: AppColors.primaryColor,
                          width: 2,
                        ),
                      ),
                    ),
                    submittedPinTheme: defaultPinTheme.copyWith(
                      textStyle: TextStyle(
                        fontSize: 24.spMin,
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.primaryColor.withValues(alpha: 0.1),
                        borderRadius: BorderRadius.circular(30),
                        border: Border.all(
                          color: AppColors.primaryColor,
                          width: 2,
                        ),
                      ),
                    ),

                    showCursor: true,
                    onCompleted: (pin) {
                      debugPrint("Entered OTP: $pin");
                    },
                  ),
                ),
                20.verticalSpace,
                Obx(
                  () => Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomText(
                        text: "Didn’t receive code? ",
                        fontSize: 16.spMin,
                        fontWeight: FontWeight.w400,
                        color: AppColors.darkGreyColor,
                      ),
                      TextButton(
                        onPressed: controller.isResendAvailable.value
                            ? () {
                                controller.resendOtpCode();
                              }
                            : null,
                        child: Text(
                          controller.isResendAvailable.value
                              ? "Resend Code"
                              : "Resend in ${controller.formattedTime} s",
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w600,
                            color: controller.isResendAvailable.value
                                ? AppColors.primaryColor
                                : Colors.grey,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                20.verticalSpace,
                CustomButton(
                  onPressed: () {
                    controller.otpVerify(context);

                    // showDialog(
                    //   context: context,
                    //   builder: (context) {
                    //     return AlertDialog(
                    //       content: CustomDialog(
                    //         imagePath: SvgAssetsPaths.instance.successBack,
                    //         title: "Account verified Successfully",
                    //         subtitle: "You can explore the app now",
                    //         buttonFontSize: 16.spMin,
                    //         primaryButtonText:
                    //             // ignore: unrelated_type_equality_checks
                    //             chooseRole.selectedRole == 'rider'
                    //             ? "Verify Information"
                    //             : "Back to Login",
                    //         onPrimaryTap: () {
                    //           // ignore: unrelated_type_equality_checks
                    //           if (chooseRole.selectedRole == 'rider') {
                    //             Get.to(() => RiderStepsScreen());
                    //           } else {
                    //             Get.offAllNamed(AppRouteNames.instance.login);
                    //           }
                    //         },
                    //       ),
                    //     );
                    //   },
                    // );
                  },

                  text: 'Continue',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
