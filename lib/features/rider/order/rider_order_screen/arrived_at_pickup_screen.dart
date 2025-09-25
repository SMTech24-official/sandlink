import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:sandlink/core/widgets/custom_app_bar.dart';
import 'package:sandlink/core/widgets/custom_button.dart';

import '../../../../core/app_colors/app_colors.dart';
import '../../../../core/config/constants/assets_paths/icons_assets_paths.dart';
import '../../../../core/wrappers/custom_text.dart';
import 'arrived_at_delivery_screen.dart';

class ArrivedAtPickupScreen extends StatelessWidget {
  ArrivedAtPickupScreen({
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
            Expanded(
              flex: 1,
              child: _arrivedButton(
                itemName: itemName,
                itrmQuantity: itrmQuantity,
                itemOrder: itemOrder,
                itemprice: itemprice,
              ),
            ),
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
              backgroundColor: AppColors.lightGreyD1,
              child: CustomText(text: '1'),
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
    child: Container(
      width: double.infinity.w,

      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.all(Radius.circular(8.r)),
      ),
      child: Image.asset(IconsAssetsPaths.instance.map),
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

Widget _arrivedButton({
  required String itemName,
  required String itrmQuantity,
  required String itemOrder,
  required String itemprice,
}) {
  return CustomButton(
    onPressed: () => Get.to(
      () => ArrivedAtDeliveryScreen(
        itemName: itemName,
        itrmQuantity: itrmQuantity,
        itemOrder: itemOrder,
        itemprice: itemName,
      ),
    ),
    text: 'Arrived at Pickup',
  );
}
