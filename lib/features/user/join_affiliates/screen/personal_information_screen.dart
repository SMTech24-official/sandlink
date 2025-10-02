import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sandlink/core/app_colors/app_colors.dart';
import 'package:sandlink/core/widgets/custom_text_field.dart';
import '../controllers/personal_information_controller.dart';
import '../controllers/steps_controllers.dart';

class PersonalInformationScreen extends StatelessWidget {
  PersonalInformationScreen({super.key});

  final controller = Get.put(PersonalInformationController());
  final stepsController = Get.put(StepsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                SizedBox(height: 20.h),
                SizedBox(
                  width: double.infinity.w,
                  child: Form(
                    key: controller.basickey,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Column(
                        children: [
                          CustomInputField(
                            headerTitle: "Full Name",
                            headerfontSize: 16.sp,
                            hintTextFontWeight: FontWeight.w500,
                            headerTextColor: AppColors.blackColor,
                            textController: controller.nameController,
                            hintText: 'Enter your full name',
                            keyboardType: TextInputType.text,
                          ),
                          SizedBox(height: 12.h),
                          CustomInputField(
                            headerTitle: "Phone Number",
                            headerfontSize: 16.sp,
                            hintTextFontWeight: FontWeight.w500,
                            headerTextColor: AppColors.blackColor,
                            textController: controller.phoneController,
                            hintText: '+880 XXX XXXXX',
                            keyboardType: TextInputType.number,
                          ),
                          SizedBox(height: 12.h),
                          CustomInputField(
                            headerTitle: "Email Address",
                            headerfontSize: 16.sp,
                            hintTextFontWeight: FontWeight.w500,
                            headerTextColor: AppColors.blackColor,
                            textController: controller.emailController,
                            isReadOnly: true,
                            hintText: 'your.email@example.com',
                            keyboardType: TextInputType.emailAddress,
                          ),
                          SizedBox(height: 12.h),
                          CustomInputField(
                            headerTitle: "Company Name",
                            headerfontSize: 16.sp,
                            hintTextFontWeight: FontWeight.w500,
                            headerTextColor: AppColors.blackColor,
                            textController: controller.shopNameController,
                            hintText: 'Enter your company name',
                            keyboardType: TextInputType.text,
                          ),
                          SizedBox(height: 12.h),
                          CustomInputField(
                            headerTitle: "Address",
                            headerfontSize: 16.sp,
                            hintTextFontWeight: FontWeight.w500,
                            headerTextColor: AppColors.blackColor,
                            textController: controller.addressController,
                            hintText: 'Enter your address',
                            onChanged: (value) {
                              controller.addressText.value = value;
                            },

                            keyboardType: TextInputType.text,
                          ),
                          // Address suggestions dropdown
                          Obx(() {
                            final suggestions = controller.addressSuggestions;
                            if (suggestions.isEmpty) {
                              return const SizedBox.shrink();
                            }
                            return Container(
                              margin: EdgeInsets.only(top: 8.h),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(8.r),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withValues(alpha: 0.05),
                                    blurRadius: 8,
                                    offset: const Offset(0, 2),
                                  ),
                                ],
                                border: Border.all(
                                  color: AppColors.lightGreyD1,
                                ),
                              ),
                              constraints: BoxConstraints(maxHeight: 220.h),
                              child: ListView.separated(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: suggestions.length,
                                separatorBuilder: (_, __) => Divider(
                                  height: 1,
                                  color: AppColors.lightGreyD1,
                                ),
                                itemBuilder: (_, idx) {
                                  final s = suggestions[idx];
                                  return ListTile(
                                    dense: true,
                                    contentPadding: EdgeInsets.symmetric(
                                      horizontal: 12.w,
                                      vertical: 6.h,
                                    ),
                                    leading: const Icon(
                                      Icons.location_on_outlined,
                                    ),
                                    title: Text(
                                      s.title,
                                      style: TextStyle(
                                        fontSize: 14.sp,
                                        color: AppColors.blackColor,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    subtitle: s.subtitle.isNotEmpty
                                        ? Text(
                                            s.subtitle,
                                            style: TextStyle(
                                              fontSize: 12.sp,
                                              color: AppColors.lightGrey,
                                            ),
                                          )
                                        : null,
                                    onTap: () => controller.selectSuggestion(s),
                                  );
                                },
                              ),
                            );
                          }),
                          SizedBox(height: 12.h),
                        ],
                      ),
                    ),
                  ),
                ),

                Container(
                  height: 200.h,
                  width: double.infinity.w,

                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(8.r)),
                  ),
                  child: Obx(() {
                    return GoogleMap(
                      initialCameraPosition: CameraPosition(
                        target: controller.currentLatLng,
                        zoom: 14,
                      ),
                      markers: {
                        Marker(
                          markerId: MarkerId("searchedPlace"),
                          position: controller.currentLatLng,
                          infoWindow: InfoWindow(
                            title: controller.addressController.text,
                          ),
                        ),
                      },
                      onMapCreated: (GoogleMapController cont) {
                        controller.googleMapController = cont;
                      },
                    );
                  }),
                ),
                SizedBox(height: 20.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
