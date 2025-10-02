import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sandlink/core/app_colors/app_colors.dart';

import '../../../../core/config/constants/assets_paths/icons_assets_paths.dart';
import '../../../../core/widgets/custom_text_field.dart';
import '../../../../core/wrappers/custom_text.dart';
import '../controllers/phone_verification_controllers.dart';

class PhoneVerificationScreens extends StatelessWidget {
  PhoneVerificationScreens({super.key});

  final controller = Get.put(PhoneVerificationController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 50.h),
                Container(
                  height: 418.h,
                  width: double.infinity.w,
                  decoration: BoxDecoration(
                    border: Border.all(color: AppColors.lightGreyD1),
                    borderRadius: BorderRadius.all(Radius.circular(8.r)),
                  ),
                  child: Column(
                    children: [
                      SizedBox(height: 16.h),
                      CustomText(
                        text: 'Phone Verification',
                        color: AppColors.blackColor,
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w600,
                      ),
                      SizedBox(height: 8.h),
                      CustomText(
                        text: 'Verify your phone number with OTP',
                        color: AppColors.lightGrey,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                      ),
                      SizedBox(height: 16.h),
                      Form(
                        key: controller.verifyKey,
                        child: SingleChildScrollView(
                          scrollDirection: Axis.vertical,
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 16.w),
                            child: Column(
                              children: [
                                CustomInputField(
                                  headerTitle: "Phone Number",
                                  headerfontSize: 14.sp,
                                  hintTextFontWeight: FontWeight.w500,
                                  headerTextColor: AppColors.blackColor,
                                  textController:
                                      controller.phoneNumberController,
                                  hintText: '(208) 555-0112',
                                  keyboardType: TextInputType.number,
                                ),
                                SizedBox(height: 12.h),

                                Container(
                                  height: 70.h,
                                  width: double.infinity.w,
                                  decoration: BoxDecoration(
                                    color: AppColors.greenlightColor,
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(8.r),
                                    ),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 16.w,
                                    ),
                                    child: Row(
                                      children: [
                                        Expanded(
                                          flex: 1,
                                          child: Column(
                                            children: [
                                              SizedBox(height: 16.h),
                                              Image.asset(
                                                IconsAssetsPaths
                                                    .instance
                                                    .rightcircleicon,
                                                height: 24,
                                              ),
                                            ],
                                          ),
                                        ),

                                        SizedBox(width: 8.w),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            CustomText(
                                              text: 'OTP Sent!',
                                              color: AppColors.greenColor,
                                              fontSize: 14.sp,
                                              fontWeight: FontWeight.w500,
                                            ),
                                            CustomText(
                                              text:
                                                  'Check your phone for the verification code',
                                              color: AppColors.lightGrey,
                                              fontSize: 12.sp,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(height: 12.h),

                                SizedBox(
                                  width: double.infinity.w,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      CustomText(
                                        text: 'Enter OTP*',
                                        color: AppColors.blackColor,
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.w600,
                                      ),
                                      SizedBox(height: 8.h),
                                      OtpInputField(
                                        controller: controller.otpController,
                                        length: 4,
                                      ),
                                    ],
                                  ),
                                ),

                                // SizedBox(height: 12.h),
                                // GestureDetector(
                                //   onTap: () {
                                //     // Handle resend OTP
                                //   },
                                //   child: CustomText(
                                //     text: 'Resend OTP',
                                //     color: AppColors.primaryColor,
                                //     fontSize: 14.sp,
                                //     fontWeight: FontWeight.w500,
                                //   ),
                                // ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// Custom OTP Input Widget
class OtpInputField extends StatefulWidget {
  final TextEditingController controller;
  final int length;

  const OtpInputField({super.key, required this.controller, this.length = 4});

  @override
  State<OtpInputField> createState() => _OtpInputFieldState();
}

class _OtpInputFieldState extends State<OtpInputField> {
  late List<TextEditingController> _controllers;
  late List<FocusNode> _focusNodes;

  @override
  void initState() {
    super.initState();
    _controllers = List.generate(
      widget.length,
      (index) => TextEditingController(),
    );
    _focusNodes = List.generate(widget.length, (index) => FocusNode());

    // Listen to changes and update main controller
    for (var i = 0; i < widget.length; i++) {
      _controllers[i].addListener(_updateMainController);
    }
  }

  void _updateMainController() {
    final otp = _controllers.map((c) => c.text).join();
    widget.controller.text = otp;
  }

  @override
  void dispose() {
    for (var controller in _controllers) {
      controller.dispose();
    }
    for (var node in _focusNodes) {
      node.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List.generate(widget.length, (index) => _buildOtpBox(index)),
    );
  }

  Widget _buildOtpBox(int index) {
    return Container(
      width: 60.w,
      height: 50.h,
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.lightGreyD1, width: 1),
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: TextField(
        controller: _controllers[index],
        focusNode: _focusNodes[index],
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        maxLength: 1,
        style: TextStyle(
          fontSize: 20.sp,
          fontWeight: FontWeight.w600,
          color: AppColors.blackColor,
        ),
        decoration: const InputDecoration(
          counterText: '',
          border: InputBorder.none,
        ),
        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
        onChanged: (value) {
          if (value.isNotEmpty) {
            // Move to next field
            if (index < widget.length - 1) {
              _focusNodes[index + 1].requestFocus();
            } else {
              // Last field, unfocus
              _focusNodes[index].unfocus();
            }
          } else {
            // Move to previous field on backspace
            if (index > 0) {
              _focusNodes[index - 1].requestFocus();
            }
          }
        },
      ),
    );
  }
}
