import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sandlink/core/config/constants/assets_paths/icons_assets_paths.dart';
import 'package:sandlink/core/widgets/custom_button.dart';
import 'package:sandlink/features/rider/notification/screen/notification_screen.dart';
import '../../../../core/app_colors/app_colors.dart';
import '../../../../core/wrappers/custom_text.dart';
import '../controller/rider_home_controller.dart';
import '../../order/rider_order_screen/order_details_screen.dart';

class RiderHomeScreen extends StatelessWidget {
  RiderHomeScreen({super.key});

  final controller = Get.put(RiderHomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F8F8),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _topAppBarWidget(),
              SizedBox(height: 24.h),
              _offlineCard(controller: controller),
              SizedBox(height: 24.h),
              Expanded(
                child: Obx(() {
                  if (!controller.isSwitched.value) {
                    return Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 36,
                        vertical: 150.h,
                      ),
                      child: Container(
                        height: 120.h,
                        width: double.infinity.w,
                        decoration: BoxDecoration(
                          color: AppColors.whiteColor,
                          borderRadius: BorderRadius.all(Radius.circular(8.r)),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CustomText(
                              text: '''You're offline''',
                              fontWeight: FontWeight.w500,
                              color: AppColors.blackColor,
                              fontSize: 20.sp,
                            ),
                            SizedBox(height: 6.h),
                            CustomText(
                              text: 'Switch online to see available jobs',
                              fontWeight: FontWeight.w500,
                              color: AppColors.lightGrey,
                              fontSize: 14.sp,
                            ),
                          ],
                        ),
                      ),
                    );
                  }
                  return ListView.separated(
                    separatorBuilder: (_, index) => SizedBox(height: 12.h),
                    itemCount: controller.availabelOrderList.length,
                    itemBuilder: (_, index) {
                      final itemData = controller.availabelOrderList[index];
                      return Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.w),
                        child: Container(
                          width: double.infinity.w,
                          decoration: BoxDecoration(
                            color: AppColors.whiteColor,
                            borderRadius: BorderRadius.all(
                              Radius.circular(8.r),
                            ),
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
                                              text: itemData.quantity,
                                              fontSize: 16.sp,
                                              fontWeight: FontWeight.w500,
                                              color: AppColors.blackColor,
                                            ),
                                            SizedBox(width: 5.w),
                                            CustomText(
                                              text: itemData.productName,
                                              fontSize: 16.sp,
                                              fontWeight: FontWeight.w500,
                                              color: AppColors.blackColor,
                                            ),
                                          ],
                                        ),
                                        CustomText(
                                          text: itemData.orderID,
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
                                          text: itemData.price,
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
                                      Icons.location_on_outlined,
                                      size: 20,
                                      color: AppColors.greenColor,
                                    ),
                                    SizedBox(width: 5.w),
                                    CustomText(
                                      maxLines: 2,
                                      text: itemData.pickupLocation,
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w400,
                                      color: AppColors.blackColor,
                                    ),
                                    Spacer(),
                                    CustomText(
                                      text: "( ${itemData.pickupDistance} km)",
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w400,
                                      color: AppColors.blackColor,
                                    ),
                                  ],
                                ),
                                SizedBox(height: 6.h),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.location_on_outlined,
                                      size: 20,
                                      color: AppColors.redColor,
                                    ),
                                    SizedBox(width: 5.w),
                                    CustomText(
                                      maxLines: 2,
                                      text: itemData.deliveryLocation,
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w400,
                                      color: AppColors.blackColor,
                                    ),
                                    Spacer(),
                                    CustomText(
                                      text:
                                          "( ${itemData.deliveryDistance} km)",
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w400,
                                      color: AppColors.blackColor,
                                    ),
                                  ],
                                ),
                                SizedBox(height: 16.h),
                                Align(
                                  alignment: Alignment.bottomRight,
                                  child: SizedBox(
                                    height: 45.h,
                                    width: 120.w,
                                    child: CustomButton(
                                      onPressed: () {
                                        Get.to(
                                          () => OrderDetailsScreen(
                                            itemName: itemData.productName,
                                            itrmQuantity: itemData.quantity,
                                            itemprice: itemData.price,
                                            itemOrder: itemData.orderID,
                                            imageurl: itemData.imageUrl,
                                            pickupLocation:
                                                itemData.pickupLocation,
                                            pickupduration:
                                                itemData.pickupDistance,
                                            deliveryLocation:
                                                itemData.deliveryLocation,
                                            deliveryduration:
                                                itemData.deliveryDistance,
                                          ),
                                        );
                                      },
                                      text: 'View Details',
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  );
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// 🔹 Top app bar
Widget _topAppBarWidget() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Row(
        children: [
          CircleAvatar(
            radius: 25.r,
            backgroundImage: const CachedNetworkImageProvider(
              "https://www.figma.com/file/jNz7l61vmikt0kYyCBqz6X/image/06807ac8c348095e2e65bed0030cefb4c025cac4",
            ),
          ),
          16.horizontalSpace,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(
                text: 'Hi, Alex Smith 👋',
                fontSize: 18.spMin,
                fontWeight: FontWeight.w600,
              ),
              4.verticalSpace,
              Row(
                children: [
                  // SvgPicture.asset(
                  //   SvgAssetsPaths.instance.location,
                  //   width: 16.w,
                  //   height: 16.h,
                  //   colorFilter: ColorFilter.mode(
                  //     AppColors.lightGrey,
                  //     BlendMode.srcIn,
                  //   ),
                  // ),
                  // 6.horizontalSpace,
                  CustomText(
                    text: 'Ready to drive?',
                    fontSize: 14.spMin,
                    color: AppColors.lightGrey,
                  ),
                ],
              ),
            ],
          ),
        ],
      ),

      /// Search button
      InkWell(
        onTap: () => Get.to(() => RiderNotificationScreen()),
        child: Container(
          padding: EdgeInsets.all(10.r),
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                offset: const Offset(0, 4),
                color: Colors.black12,
                blurRadius: 4,
              ),
            ],
          ),
          child: Stack(
            children: [
              Icon(Icons.notifications_none_outlined, size: 30.r),
              Positioned(
                top: 0,
                right: 0,
                child: Container(
                  padding: const EdgeInsets.all(5),
                  decoration: const BoxDecoration(
                    color: Colors.red,
                    shape: BoxShape.circle,
                  ),
                  child: CustomText(
                    text: '3',
                    fontSize: 10.sp,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ],
  );
}

Widget _offlineCard({required RiderHomeController controller}) {
  return Container(
    // height: 50,
    width: double.infinity.w,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.all(Radius.circular(8.r)),
      color: AppColors.whiteColor,
    ),
    child: Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 15.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(
                text: '''You're Online''',
                fontSize: 20.sp,
                color: AppColors.blackColor,
                fontWeight: FontWeight.w500,
              ),
              SizedBox(height: 6.h),
              CustomText(
                text: 'Ready to accept orders',
                fontSize: 14.sp,
                color: AppColors.lightGrey,
                fontWeight: FontWeight.w400,
              ),
            ],
          ),
          Obx(
            () => Switch(
              value: controller.isSwitched.value,

              activeThumbColor: AppColors.whiteColor,
              activeTrackColor: Colors.green,
              inactiveThumbColor: AppColors.whiteColor,
              inactiveTrackColor: AppColors.lightGreyD1,
              onChanged: (value) {
                controller.toggleSwitch(value);
              },
            ),
          ),
        ],
      ),
    ),
  );
}
