import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sandlink/core/widgets/custom_app_bar.dart';
import 'package:sandlink/core/widgets/custom_button.dart';
import 'package:sandlink/core/widgets/custom_text_field.dart';
import 'package:sandlink/features/rider/order/rider_order_screen/rider_live_map_screen.dart';
import '../../../../core/app_colors/app_colors.dart';
import '../../../../core/config/constants/assets_paths/icons_assets_paths.dart';
import '../../../../core/wrappers/custom_text.dart';
import '../controller/arrived_at_delivery_controller.dart';

class ArrivedAtDeliveryScreen extends StatelessWidget {
  const ArrivedAtDeliveryScreen({
    super.key,
    required this.itemName,
    required this.itrmQuantity,
    required this.itemOrder,
    required this.itemprice,
  });

  final String itemName;
  final String itrmQuantity;
  final String itemOrder;
  final String itemprice;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(RiderArrivesController());

    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: CustomAppBar(
        title: 'Order Details',
        centerTitle: true,
        onLeadingPressed: () => Get.back(),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 12,
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    child: Card(
                      elevation: 1,
                      child: Container(
                        width: double.infinity.w,
                        decoration: BoxDecoration(
                          color: AppColors.whiteColor,
                          borderRadius: BorderRadius.all(Radius.circular(8.r)),
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 12.w,
                            vertical: 12.h,
                          ),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Container(
                                    height: 50.h,
                                    width: 50.w,
                                    decoration: BoxDecoration(
                                      color: AppColors.blueColorF7,
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(8.r),
                                      ),
                                    ),

                                    child: Image.asset(
                                      IconsAssetsPaths.instance.orderimage,
                                      fit: BoxFit.fill,
                                      height: 44.h,
                                      width: 44.w,
                                    ),
                                  ),
                                  SizedBox(width: 8.w),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          CustomText(
                                            text: itrmQuantity.toString(),
                                            fontSize: 16.sp,
                                            fontWeight: FontWeight.w500,
                                            color: AppColors.blackColor,
                                          ),
                                          SizedBox(width: 5.w),
                                          CustomText(
                                            text: itemName.toString(),
                                            fontSize: 16.sp,
                                            fontWeight: FontWeight.w500,
                                            color: AppColors.blackColor,
                                          ),
                                        ],
                                      ),
                                      CustomText(
                                        text: itemOrder.toString(),
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w400,
                                        color: AppColors.lightGrey,
                                      ),
                                    ],
                                  ),
                                  Spacer(),
                                  Container(
                                    height: 25.h,
                                    width: 80.w,
                                    decoration: BoxDecoration(
                                      color: AppColors.blueColorF7,
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(4.r),
                                      ),
                                    ),
                                    child: Center(
                                      child: CustomText(
                                        text: itemprice.toString(),
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w500,
                                        color: AppColors.primaryColor,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 12.h),
                              Row(
                                children: [
                                  Icon(
                                    Icons.access_time,
                                    size: 20,
                                    color: AppColors.lightGrey,
                                  ),
                                  SizedBox(width: 5.w),
                                  CustomText(
                                    maxLines: 2,
                                    text: 'Estimated time: 2h 30m',
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w400,
                                    color: AppColors.lightGrey,
                                  ),
                                ],
                              ),
                              SizedBox(height: 6.h),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 16.h),
                  _pickupDistination(),
                  SizedBox(height: 16.h),
                  _pickupNvigationLocation(),
                  SizedBox(height: 16.h),
                  _mapLocation(),
                  SizedBox(height: 16.h),
                  _pickupLocation(),
                  SizedBox(height: 16.h),
                ],
              ),
            ),
            Expanded(flex: 1, child: _arrivedButton(controller: controller)),
          ],
        ),
      ),
    );
  }
}

Widget _pickupDistination() {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 16.sp),
    child: Row(
      children: [
        Column(
          children: [
            CircleAvatar(
              radius: 20.r,
              backgroundColor: AppColors.greenColor.withValues(alpha: 0.7),
              child: CustomText(
                text: '1',
                color: AppColors.whiteColor,
                fontWeight: FontWeight.w500,
              ),
            ),
            CustomText(
              text: 'Pickup',
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
              color: AppColors.lightGrey,
            ),
          ],
        ),

        // Line between the circles
        Expanded(
          child: Padding(
            padding: EdgeInsets.only(left: 10.r, right: 10.r, bottom: 20.h),
            child: Container(height: 2, color: AppColors.lightGreyD1),
          ),
        ),

        Column(
          children: [
            CircleAvatar(
              radius: 20.r,
              backgroundColor: AppColors.lightGreyD1,
              child: CustomText(text: '2'),
            ),
            CustomText(
              text: 'Pickup',
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
              color: AppColors.lightGrey,
            ),
          ],
        ),
      ],
    ),
  );
}

Widget _pickupNvigationLocation() {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 16.w),
    child: Container(
      width: double.infinity.w,

      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.all(Radius.circular(8.r)),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomText(
              text: 'Navigate to Pickup Location',
              fontWeight: FontWeight.w500,
              fontSize: 16,
              color: AppColors.blackColor,
            ),
            SizedBox(height: 4.h),
            CustomText(
              text: 'Heading to Lagos Quarry',
              fontWeight: FontWeight.w500,
              fontSize: 14,
              color: AppColors.lightGrey,
            ),
          ],
        ),
      ),
    ),
  );
}

Widget _mapLocation() {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 16.w),
    child: GestureDetector(
      onTap: () => Get.to(() => RiderLiveMapScreen()),
      child: Container(
        width: double.infinity.w,

        decoration: BoxDecoration(
          color: AppColors.whiteColor,
          borderRadius: BorderRadius.all(Radius.circular(8.r)),
        ),
        child: Image.asset(IconsAssetsPaths.instance.map),
      ),
    ),
  );
}

Widget _pickupLocation() {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 16.w),
    child: Container(
      width: double.infinity.w,

      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.all(Radius.circular(8.r)),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomText(
              text: 'PICKUP LOCATION',
              fontWeight: FontWeight.w500,
              fontSize: 12,
              color: AppColors.lightGrey,
            ),
            SizedBox(height: 4.h),

            CustomText(
              text: 'Lagos Quarry',
              fontWeight: FontWeight.w500,
              fontSize: 16,
              color: AppColors.blackColor,
            ),
            SizedBox(height: 4.h),
            CustomText(
              text: '123 Quarry Road, Ikeja, Lagos',
              fontWeight: FontWeight.w500,
              fontSize: 14,
              color: AppColors.lightGrey,
            ),
          ],
        ),
      ),
    ),
  );
}

Widget _arrivedButton({required RiderArrivesController controller}) {
  return CustomButton(
    onPressed: () {
      _customShowDialog(controller: controller);
    },
    text: 'Arrived at Delivery',
  );
}

Future<void> _customShowDialog({required RiderArrivesController controller}) {
  return Get.dialog(
    Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CustomText(
              text: 'Confirm Delivery',
              fontWeight: FontWeight.w600,
              fontSize: 18.sp,
              color: AppColors.primaryColor,
            ),
            SizedBox(height: 12.h),
            CustomText(
              maxLines: 4,
              textAlign: TextAlign.center,
              text:
                  '''Lorem ipsum dolor sit amet, consectetur\nadipiscing elit, sed do eiusmod tempor''',
              fontWeight: FontWeight.w500,
              fontSize: 14.sp,
              color: AppColors.lightGrey,
            ),
            SizedBox(height: 20.h),
            Form(
              key: controller.otp_key,
              child: CustomInputField(
                textController: controller.deliveryOtp,
                keyboardType: TextInputType.number,
                headerTitle: 'Enter Customer OTP',
                headerfontSize: 16.sp,
                hintTextFontWeight: FontWeight.w500,
                hintText: '0 0 0 0 0 0',
                formValidator: (value) {
                  if (value == null || value.isEmpty) {
                    return "OTP cannot be empty";
                  }
                  return null;
                },
              ),
            ),

            SizedBox(height: 20.h),
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: CustomButton(
                    onPressed: () => Get.back(),
                    text: 'Cancel',
                    textColor: AppColors.lightGrey,
                    backgroundColor: AppColors.lightGreyD1,
                    borderSide: BorderSide(
                      color: AppColors.lightGrey,
                      width: 1.w,
                    ),
                    fontSize: 14.sp,
                  ),
                ),
                SizedBox(width: 15.w),
                Expanded(
                  flex: 1,
                  child: CustomButton(
                    onPressed: () {
                      if (controller.otp_key.currentState!.validate()) {
                        // ✅ OTP valid
                        Get.snackbar(
                          "Success",
                          "OTP Verified",
                          snackPosition: SnackPosition.BOTTOM,
                          backgroundColor: Colors.green,
                          colorText: Colors.white,
                        );
                      } else {
                        // ❌ OTP empty or invalid
                        Get.snackbar(
                          "Error",
                          "Empty OTP Code",
                          snackPosition: SnackPosition.BOTTOM,
                          backgroundColor: Colors.red,
                          colorText: Colors.white,
                        );
                      }
                    },
                    text: 'Confirm Delivery',
                    fontSize: 14.sp,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    ),
    barrierDismissible: false,
  );
}
