// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get.dart';
// import 'package:sandlink/core/app_colors/app_colors.dart';
// import 'package:sandlink/core/widgets/custom_button.dart';
// import 'package:sandlink/core/wrappers/custom_text.dart';
// import 'package:sandlink/features/user/join_affiliates/controllers/personal_information_controller.dart';
// import 'package:sandlink/features/user/join_affiliates/screen/document_verification_screen.dart';
// import 'package:sandlink/features/user/join_affiliates/screen/payment_nformation_screen.dart';
// import 'package:sandlink/features/user/join_affiliates/screen/personal_information_screen.dart';
// import 'package:sandlink/features/user/join_affiliates/screen/phone_verification_screen.dart';
// import 'package:sandlink/features/user/join_affiliates/screen/review_your_information_screen.dart';
// import '../../../../core/widgets/custom_app_bar.dart';
// import '../controllers/steps_controllers.dart';

// // ignore: must_be_immutable
// class StepsScreen extends StatelessWidget {
//   final controller = Get.put(StepsController());
//   final PersonalInformationController personalInformationController = Get.put(
//     PersonalInformationController(),
//   );
//   int? nextIndex;
//   late String? appbarTitle;

//   StepsScreen({super.key});
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: CustomAppBar(
//         centerTitle: true,
//         onLeadingPressed: () => Get.back(),
//         child: Obx(
//           () => Text(
//             controller.title.value,
//             style: TextStyle(
//               fontSize: 18.sp,
//               fontWeight: FontWeight.w500,
//               color: AppColors.darkGreyColor,
//             ),
//           ),
//         ),
//       ),
//       body: SafeArea(
//         child: Column(
//           children: [
//             SizedBox(
//               height: 50.h,
//               width: double.infinity,

//               child: Padding(
//                 padding: EdgeInsets.symmetric(horizontal: 16.w),
//                 child: SizedBox(
//                   height: 50.h,
//                   width: double.infinity.w,

//                   child: Obx(
//                     () => Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: List.generate(
//                         controller.stepIcons.length * 2 - 1,
//                         (index) {
//                           int stepIndex = index ~/ 2;
//                           nextIndex = stepIndex;
//                           bool isCompleted =
//                               controller.currentStep.value > stepIndex;
//                           bool isCurrent =
//                               controller.currentStep.value == stepIndex;

//                           if (index.isOdd) {
//                             return Icon(
//                               Icons.arrow_forward,
//                               color: isCurrent
//                                   ? AppColors.primaryColor
//                                   : isCompleted
//                                   ? AppColors.greenColor
//                                   : AppColors.lightGreyD1,
//                               size: 22,
//                             );
//                           }

//                           return Container(
//                             decoration: BoxDecoration(
//                               shape: BoxShape.circle,
//                               border: Border.all(
//                                 color: isCurrent
//                                     ? AppColors.primaryColor
//                                     : isCompleted
//                                     ? AppColors.greenColor
//                                     : AppColors.lightGreyD1,
//                                 width: 1,
//                               ),
//                             ),
//                             child: CircleAvatar(
//                               radius: 20.r,
//                               foregroundColor: isCompleted || isCurrent
//                                   ? AppColors.primaryColor
//                                   : AppColors.lightGreyD1,
//                               backgroundColor: isCompleted || isCurrent
//                                   ? AppColors.blueColorF7
//                                   : AppColors.lightGreyD1,
//                               child: Icon(
//                                 size: 22,
//                                 isCurrent
//                                     ? controller.stepIcons[stepIndex]
//                                     : isCompleted
//                                     ? Icons.check
//                                     : controller.stepIcons[stepIndex],
//                                 color: isCurrent
//                                     ? AppColors.primaryColor
//                                     : isCompleted
//                                     ? AppColors.greenColor
//                                     : AppColors.lightGrey,
//                               ),
//                             ),
//                           );
//                         },
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//             ),

//             Expanded(
//               child: SizedBox(
//                 width: double.infinity.w,
//                 child: Obx(() {
//                   switch (controller.currentStep.value) {
//                     case 0:
//                       // controller.title.value = 'Basic Information';
//                       return PersonalInformationScreen();
//                     case 1:
//                       //  controller.title.value = 'Phone Verification';
//                       return PhoneVerificationScreens();

//                     case 2:
//                       return DocumentVerificationScreen();
//                     case 3:
//                       return PaymentNformationScreen();
//                     case 4:
//                       return ReviewYourInformationScreen();
//                     default:
//                       return const SizedBox.shrink();
//                   }
//                 }),
//               ),
//             ),

//             Padding(
//               padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 6.0.h),
//               child: SizedBox(
//                 height: 56.h,
//                 width: double.infinity,
//                 child: Obx(() {
//                   int step = controller.currentStep.value;

//                   if (step == 0) {
//                     return CustomButton(
//                       onPressed: () async {
//                         // await personalInformationController.phoneOtpSend();

//                         controller.nextStep();
//                       },
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           CustomText(
//                             text: 'Next',
//                             color: AppColors.whiteColor,
//                             fontSize: 18.sp,
//                           ),
//                           SizedBox(width: 5.w),
//                           Icon(
//                             Icons.arrow_forward,
//                             color: AppColors.whiteColor,
//                             size: 20,
//                           ),
//                         ],
//                       ),
//                     );
//                   } else if (step == 4) {
//                     return Expanded(
//                       flex: 1,
//                       child: CustomButton(
//                         onPressed: () {},
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             CustomText(
//                               text: 'Submit',
//                               color: AppColors.whiteColor,
//                               fontSize: 18.sp,
//                             ),
//                           ],
//                         ),
//                       ),
//                     );
//                   } else {
//                     return Row(
//                       children: [
//                         Expanded(
//                           flex: 1,
//                           child: CustomButton(
//                             onPressed: controller.cancelStep,
//                             backgroundColor: AppColors.lightGreyD1,
//                             child: Row(
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               children: [
//                                 Icon(
//                                   Icons.arrow_back,
//                                   color: AppColors.blackColor,
//                                   size: 20,
//                                 ),
//                                 SizedBox(width: 5.w),
//                                 CustomText(
//                                   text: 'Previous',
//                                   color: AppColors.blackColor,
//                                   fontSize: 18.sp,
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ),
//                         SizedBox(width: 10.w),
//                         Expanded(
//                           flex: 1,
//                           child: CustomButton(
//                             onPressed: controller.nextStep,
//                             child: Row(
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               children: [
//                                 CustomText(
//                                   text: 'Next',
//                                   color: AppColors.whiteColor,
//                                   fontSize: 18.sp,
//                                 ),
//                                 SizedBox(width: 5.w),
//                                 Icon(
//                                   Icons.arrow_forward,
//                                   color: AppColors.whiteColor,
//                                   size: 20,
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ),
//                       ],
//                     );
//                   }
//                 }),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sandlink/core/app_colors/app_colors.dart';
import 'package:sandlink/core/widgets/custom_button.dart';
import 'package:sandlink/core/wrappers/custom_text.dart';
import 'package:sandlink/features/user/join_affiliates/controllers/personal_information_controller.dart';
import 'package:sandlink/features/user/join_affiliates/controllers/phone_verification_controllers.dart';
import 'package:sandlink/features/user/join_affiliates/screen/document_verification_screen.dart';
import 'package:sandlink/features/user/join_affiliates/screen/payment_nformation_screen.dart';
import 'package:sandlink/features/user/join_affiliates/screen/personal_information_screen.dart';
import 'package:sandlink/features/user/join_affiliates/screen/phone_verification_screen.dart';
import 'package:sandlink/features/user/join_affiliates/screen/review_your_information_screen.dart';
import '../../../../core/widgets/custom_app_bar.dart';
import '../controllers/steps_controllers.dart';

// ignore: must_be_immutable
class StepsScreen extends StatelessWidget {
  final controller = Get.put(StepsController());
  final PersonalInformationController personalInformationController = Get.put(
    PersonalInformationController(),
  );
  final PhoneVerificationController phoneVerificationController = Get.put(
    PhoneVerificationController(),
  );
  int? nextIndex;
  late String? appbarTitle;

  StepsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        centerTitle: true,
        onLeadingPressed: () => Get.back(),
        child: Obx(
          () => Text(
            controller.title.value,
            style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.w500,
              color: AppColors.darkGreyColor,
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: 50.h,
              width: double.infinity,

              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: SizedBox(
                  height: 50.h,
                  width: double.infinity.w,

                  child: Obx(
                    () => Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: List.generate(
                        controller.stepIcons.length * 2 - 1,
                        (index) {
                          int stepIndex = index ~/ 2;
                          nextIndex = stepIndex;
                          bool isCompleted =
                              controller.currentStep.value > stepIndex;
                          bool isCurrent =
                              controller.currentStep.value == stepIndex;

                          if (index.isOdd) {
                            return Icon(
                              Icons.arrow_forward,
                              color: isCurrent
                                  ? AppColors.primaryColor
                                  : isCompleted
                                  ? AppColors.greenColor
                                  : AppColors.lightGreyD1,
                              size: 22,
                            );
                          }

                          return Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: isCurrent
                                    ? AppColors.primaryColor
                                    : isCompleted
                                    ? AppColors.greenColor
                                    : AppColors.lightGreyD1,
                                width: 1,
                              ),
                            ),
                            child: CircleAvatar(
                              radius: 20.r,
                              foregroundColor: isCompleted || isCurrent
                                  ? AppColors.primaryColor
                                  : AppColors.lightGreyD1,
                              backgroundColor: isCompleted || isCurrent
                                  ? AppColors.blueColorF7
                                  : AppColors.lightGreyD1,
                              child: Icon(
                                size: 22,
                                isCurrent
                                    ? controller.stepIcons[stepIndex]
                                    : isCompleted
                                    ? Icons.check
                                    : controller.stepIcons[stepIndex],
                                color: isCurrent
                                    ? AppColors.primaryColor
                                    : isCompleted
                                    ? AppColors.greenColor
                                    : AppColors.lightGrey,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ),
              ),
            ),

            Expanded(
              child: SizedBox(
                width: double.infinity.w,
                child: Obx(() {
                  switch (controller.currentStep.value) {
                    case 0:
                      // controller.title.value = 'Basic Information';
                      return PersonalInformationScreen();
                    case 1:
                      //  controller.title.value = 'Phone Verification';
                      return PhoneVerificationScreens();

                    case 2:
                      return DocumentVerificationScreen();
                    case 3:
                      return PaymentNformationScreen();
                    case 4:
                      return ReviewYourInformationScreen();
                    default:
                      return const SizedBox.shrink();
                  }
                }),
              ),
            ),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 6.0.h),
              child: SizedBox(
                height: 56.h,
                width: double.infinity,
                child: Obx(() {
                  int step = controller.currentStep.value;

                  if (step == 0) {
                    return CustomButton(
                      onPressed: () async {
                        await personalInformationController.phoneOtpSend();
                        controller.nextStep();
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CustomText(
                            text: 'Next',
                            color: AppColors.whiteColor,
                            fontSize: 18.sp,
                          ),
                          SizedBox(width: 5.w),
                          Icon(
                            Icons.arrow_forward,
                            color: AppColors.whiteColor,
                            size: 20,
                          ),
                        ],
                      ),
                    );
                  } else if (step == 1) {
                    // Phone Verification Step
                    return Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: CustomButton(
                            onPressed: controller.cancelStep,
                            backgroundColor: AppColors.lightGreyD1,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.arrow_back,
                                  color: AppColors.blackColor,
                                  size: 20,
                                ),
                                SizedBox(width: 5.w),
                                CustomText(
                                  text: 'Previous',
                                  color: AppColors.blackColor,
                                  fontSize: 18.sp,
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(width: 10.w),
                        Expanded(
                          flex: 1,
                          child: CustomButton(
                            onPressed: () async {
                              // Validate OTP is entered
                              if (phoneVerificationController
                                      .otpController
                                      .text
                                      .length ==
                                  4) {
                                await phoneVerificationController
                                    .verifyPhoneOtp();
                                // Only proceed to next step if verification is successful
                                // You might want to check the response in verifyPhoneOtp and return a boolean
                                controller.nextStep();
                              } else {
                                Get.snackbar(
                                  'Error',
                                  'Please enter a valid 4-digit OTP',
                                  snackPosition: SnackPosition.BOTTOM,
                                  backgroundColor: AppColors.redColor,
                                  colorText: AppColors.whiteColor,
                                );
                              }
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                CustomText(
                                  text: 'Verify & Next',
                                  color: AppColors.whiteColor,
                                  fontSize: 18.sp,
                                ),
                                SizedBox(width: 5.w),
                                Icon(
                                  Icons.arrow_forward,
                                  color: AppColors.whiteColor,
                                  size: 20,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    );
                  } else if (step == 4) {
                    return Expanded(
                      flex: 1,
                      child: CustomButton(
                        onPressed: () {},
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CustomText(
                              text: 'Submit',
                              color: AppColors.whiteColor,
                              fontSize: 18.sp,
                            ),
                          ],
                        ),
                      ),
                    );
                  } else {
                    return Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: CustomButton(
                            onPressed: controller.cancelStep,
                            backgroundColor: AppColors.lightGreyD1,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.arrow_back,
                                  color: AppColors.blackColor,
                                  size: 20,
                                ),
                                SizedBox(width: 5.w),
                                CustomText(
                                  text: 'Previous',
                                  color: AppColors.blackColor,
                                  fontSize: 18.sp,
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(width: 10.w),
                        Expanded(
                          flex: 1,
                          child: CustomButton(
                            onPressed: controller.nextStep,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                CustomText(
                                  text: 'Next',
                                  color: AppColors.whiteColor,
                                  fontSize: 18.sp,
                                ),
                                SizedBox(width: 5.w),
                                Icon(
                                  Icons.arrow_forward,
                                  color: AppColors.whiteColor,
                                  size: 20,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    );
                  }
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
