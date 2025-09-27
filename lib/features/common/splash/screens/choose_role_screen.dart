import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sandlink/core/app_colors/app_colors.dart';
import 'package:sandlink/core/app_routes/app_route_names.dart';
import 'package:sandlink/core/config/constants/assets_paths/icons_assets_paths.dart';
import 'package:sandlink/core/services/DBServices/local_db_services/storage_service.dart';
import 'package:sandlink/core/widgets/custom_button.dart';
import 'package:sandlink/core/wrappers/custom_text.dart';
import 'package:sandlink/features/common/splash/controller/choose_role_controller.dart';

// class ChooseRoleScreen extends StatelessWidget {
//   const ChooseRoleScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final controller = Get.put(ChooseRoleController());
//     return Scaffold(
//       backgroundColor: AppColors.whiteColor,
//       body: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 16.0),
//         child: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               const Spacer(),
//               Image.asset(IconsAssetsPaths.instance.appLogo, width: 140.w),
//               const Spacer(),
//               CustomText(
//                 text: 'Welcome to SANDLINK!',
//                 fontSize: 24.spMin,
//                 fontWeight: FontWeight.w600,
//               ),
//               5.verticalSpace,
//               CustomText(
//                 text: 'Choose Your Role to Begin',
//                 fontSize: 16.spMin,
//                 fontWeight: FontWeight.w400,
//                 color: AppColors.lightGrey,
//               ),
//               40.verticalSpace,
//               InkWell(
//                 onTap: () {
//                   controller.selectedRole.value = 0;
//                 },
//                 child: Obx(
//                   () => Container(
//                     padding: EdgeInsets.only(
//                       top: Get.width * 0.025,
//                       bottom: Get.width * 0.025,
//                       left: Get.width * 0.01,
//                     ),
//                     decoration: BoxDecoration(
//                       color: controller.selectedRole.value == 0
//                           ? AppColors.primaryColor
//                           : AppColors.whiteColor,
//                       border: Border.all(color: Color(0xFFF3F4F6), width: 1.5),
//                       borderRadius: BorderRadius.circular(12.r),
//                     ),
//                     child: ListTile(
//                       contentPadding: EdgeInsets.only(left: 10),
//                       leading: Icon(
//                         color: controller.selectedRole.value == 0
//                             ? Colors.white
//                             : AppColors.darkGreyColor,
//                         Icons.person,
//                         size: 35.r,
//                       ),
//                       title: CustomText(
//                         text: 'Continue as User',
//                         fontSize: 16.spMin,
//                         fontWeight: FontWeight.w500,
//                         color: controller.selectedRole.value == 0
//                             ? Colors.white
//                             : AppColors.darkGreyColor,
//                       ),
//                       trailing: Radio(
//                         value: 0,
//                         groupValue: controller.selectedRole.value,
//                         onChanged: (value) {
//                           controller.selectedRole.value = value!;
//                         },
//                         activeColor: Colors.white,
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//               20.verticalSpace,
//               InkWell(
//                 onTap: () {
//                   controller.selectedRole.value = 1;
//                 },
//                 child: Obx(
//                   () => Container(
//                     padding: EdgeInsets.only(
//                       top: Get.width * 0.025,
//                       bottom: Get.width * 0.025,
//                       left: Get.width * 0.01,
//                     ),
//                     decoration: BoxDecoration(
//                       color: controller.selectedRole.value == 1
//                           ? AppColors.primaryColor
//                           : AppColors.whiteColor,
//                       border: Border.all(color: Color(0xFFF3F4F6), width: 1.5),
//                       borderRadius: BorderRadius.circular(12.r),
//                     ),
//                     child: ListTile(
//                       contentPadding: EdgeInsets.only(left: 10),
//                       leading: Icon(
//                         color: controller.selectedRole.value == 1
//                             ? Colors.white
//                             : AppColors.darkGreyColor,
//                         Icons.person,
//                         size: 35.r,
//                       ),
//                       title: CustomText(
//                         text: 'Continue as Rider',
//                         fontSize: 16.spMin,
//                         fontWeight: FontWeight.w500,
//                         color: controller.selectedRole.value == 1
//                             ? Colors.white
//                             : AppColors.darkGreyColor,
//                       ),
//                       trailing: Radio(
//                         value: 1,
//                         groupValue: controller.selectedRole.value,
//                         onChanged: (value) {
//                           controller.selectedRole.value = value!;
//                         },
//                         activeColor: Colors.white,
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//               40.verticalSpace,
//               CustomButton(
//                 onPressed: () => controller.selectedRole.value == 0
//                     ? Get.toNamed(AppRouteNames.instance.userOnboarding)
//                     : Get.toNamed(AppRouteNames.instance.riderOnboarding),
//                 text: "Next",
//               ),
//               const Spacer(),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
class ChooseRoleScreen extends StatelessWidget {
  const ChooseRoleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ChooseRoleController());

    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(),
              Image.asset(IconsAssetsPaths.instance.appLogo, width: 140.w),
              const Spacer(),
              CustomText(
                text: 'Welcome to SANDLINK!',
                fontSize: 24.spMin,
                fontWeight: FontWeight.w600,
              ),
              5.verticalSpace,
              CustomText(
                text: 'Choose Your Role to Begin',
                fontSize: 16.spMin,
                fontWeight: FontWeight.w400,
                color: AppColors.lightGrey,
              ),
              40.verticalSpace,

              Obx(() {
                return Column(
                  children: [
                    InkWell(
                      onTap: () => controller.selectRole("CUSTOMER"),
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          vertical: Get.width * 0.025,
                          horizontal: Get.width * 0.01,
                        ),
                        decoration: BoxDecoration(
                          color: controller.selectedRole.value == "CUSTOMER"
                              ? AppColors.primaryColor
                              : AppColors.whiteColor,
                          border: Border.all(
                            color: const Color(0xFFF3F4F6),
                            width: 1.5,
                          ),
                          borderRadius: BorderRadius.circular(12.r),
                        ),
                        child: ListTile(
                          leading: Icon(
                            Icons.person_sharp,
                            size: 35.r,
                            color: controller.selectedRole.value == "CUSTOMER"
                                ? Colors.white
                                : AppColors.darkGreyColor,
                          ),
                          title: CustomText(
                            text: 'Continue as User',
                            fontSize: 16.spMin,
                            fontWeight: FontWeight.w500,
                            color: controller.selectedRole.value == "CUSTOMER"
                                ? Colors.white
                                : AppColors.darkGreyColor,
                          ),
                          trailing: Radio<String>(
                            value: "CUSTOMER",
                            groupValue: controller.selectedRole.value,
                            activeColor: Colors.white,
                            onChanged: (val) => controller.selectRole(val!),
                          ),
                        ),
                      ),
                    ),
                    20.verticalSpace,
                    InkWell(
                      onTap: () => controller.selectRole("RIDER"),
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          vertical: Get.width * 0.025,
                          horizontal: Get.width * 0.01,
                        ),
                        decoration: BoxDecoration(
                          color: controller.selectedRole.value == "RIDER"
                              ? AppColors.primaryColor
                              : AppColors.whiteColor,
                          border: Border.all(
                            color: const Color(0xFFF3F4F6),
                            width: 1.5,
                          ),
                          borderRadius: BorderRadius.circular(12.r),
                        ),
                        child: ListTile(
                          leading: Icon(
                            Icons.local_shipping_sharp,
                            size: 35.r,
                            color: controller.selectedRole.value == "RIDER"
                                ? Colors.white
                                : AppColors.darkGreyColor,
                          ),
                          title: CustomText(
                            text: 'Continue as Driver',
                            fontSize: 16.spMin,
                            fontWeight: FontWeight.w500,
                            color: controller.selectedRole.value == "RIDER"
                                ? Colors.white
                                : AppColors.darkGreyColor,
                          ),
                          trailing: Radio<String>(
                            value: "RIDER",
                            groupValue: controller.selectedRole.value,
                            activeColor: Colors.white,
                            onChanged: (val) => controller.selectRole(val!),
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              }),

              40.verticalSpace,

              /// 🔑 Wrap both options in a RadioGroup
              // Obx(() {
              //   return RadioGroup<int>(
              //     groupValue: controller.selectedRole.value,
              //     onChanged: (int? value) {
              //       if (value != null) {
              //         controller.selectedRole.value = value;
              //       }
              //     },
              //     child: Column(
              //       children: [
              //         InkWell(
              //           onTap: () => controller.selectRole("user"),
              //           child: Container(
              //             padding: EdgeInsets.symmetric(
              //               vertical: Get.width * 0.025,
              //               horizontal: Get.width * 0.01,
              //             ),
              //             decoration: BoxDecoration(
              //               color: controller.selecteRole.value == 'user'
              //                   ? AppColors.primaryColor
              //                   : AppColors.whiteColor,
              //               border: Border.all(
              //                 color: const Color(0xFFF3F4F6),
              //                 width: 1.5,
              //               ),
              //               borderRadius: BorderRadius.circular(12.r),
              //             ),
              //             child: ListTile(
              //               contentPadding: const EdgeInsets.only(left: 10),
              //               leading: Icon(
              //                 Icons.person,
              //                 size: 35.r,
              //                 color: controller.selecteRole.value == 'user'
              //                     ? Colors.white
              //                     : AppColors.darkGreyColor,
              //               ),
              //               title: CustomText(
              //                 text: 'Continue as User',
              //                 fontSize: 16.spMin,
              //                 fontWeight: FontWeight.w500,
              //                 color: controller.selecteRole.value == 'user'
              //                     ? Colors.white
              //                     : AppColors.darkGreyColor,
              //               ),
              //               trailing: const Radio<int>(
              //                 value: 0,
              //                 activeColor: Colors.white,
              //               ),
              //             ),
              //           ),
              //         ),
              //         20.verticalSpace,
              //         InkWell(
              //           onTap: () => controller.selectRole('rider'),
              //           child: Container(
              //             padding: EdgeInsets.symmetric(
              //               vertical: Get.width * 0.025,
              //               horizontal: Get.width * 0.01,
              //             ),
              //             decoration: BoxDecoration(
              //               color: controller.selecteRole.value =='rider'
              //                   ? AppColors.primaryColor
              //                   : AppColors.whiteColor,
              //               border: Border.all(
              //                 color: const Color(0xFFF3F4F6),
              //                 width: 1.5,
              //               ),
              //               borderRadius: BorderRadius.circular(12.r),
              //             ),
              //             child: ListTile(
              //               contentPadding: const EdgeInsets.only(left: 10),
              //               leading: Icon(
              //                 Icons.person,
              //                 size: 35.r,
              //                 color: controller.selecteRole.value == 'rider'
              //                     ? Colors.white
              //                     : AppColors.darkGreyColor,
              //               ),
              //               title: CustomText(
              //                 text: 'Continue as Rider',
              //                 fontSize: 16.spMin,
              //                 fontWeight: FontWeight.w500,
              //                 color: controller.selecteRole.value =='rider'
              //                     ? Colors.white
              //                     : AppColors.darkGreyColor,
              //               ),
              //               trailing: const Radio<int>(
              //                 value: 1,
              //                 activeColor: Colors.white,
              //               ),
              //             ),
              //           ),
              //         ),
              //       ],
              //     ),
              //   );
              // }),
              //
              // 40.verticalSpace,
              // CustomButton(
              //   onPressed: () => controller.selecteRole.value == 'user'
              //       ? Get.toNamed(AppRouteNames.instance.userOnboarding)
              //       : Get.toNamed(AppRouteNames.instance.riderOnboarding),
              //   text: "Next",
              // ),
              const Spacer(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 30.h),
        child: CustomButton(
          onPressed: () {
            final role = controller.selectedRole.value;
            if (kDebugMode) {
              print("Role.................................... $role");
            }

            if (role == "CUSTOMER") {
              StorageService().saveData('role', role);
              Get.toNamed(AppRouteNames.instance.userOnboarding);
            } else if (role == "RIDER") {
              StorageService().saveData('role', role);
              Get.toNamed(AppRouteNames.instance.riderOnboarding);
            } else {
              Get.snackbar(
                "Selection Required",
                "Please select a role to proceed.",
                backgroundColor: Colors.redAccent,
                colorText: Colors.white,
                snackPosition: SnackPosition.BOTTOM,
              );
            }
          },
          text: "Get Started",
        ),
      ),
    );
  }
}
