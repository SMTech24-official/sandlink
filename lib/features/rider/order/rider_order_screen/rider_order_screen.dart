import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sandlink/core/app_colors/app_colors.dart';
import 'package:sandlink/core/widgets/custom_app_bar.dart';
import 'package:sandlink/features/rider/order/controller/rider_order_controllers.dart';

import '../../../../core/config/constants/assets_paths/icons_assets_paths.dart';
import '../../../../core/wrappers/custom_text.dart';
import 'order_details_screen.dart';

class RiderOrderScreen extends StatelessWidget {
  RiderOrderScreen({super.key});

  final controller = Get.put(RiderOrderController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Orders',
        centerTitle: true,
        onLeadingPressed: () => Get.back(),
      ),
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: SizedBox(
                height: 40.h,
                width: double.infinity.w,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: Container(
                    width: double.infinity.w,
                    decoration: BoxDecoration(
                      border: BoxBorder.all(
                        color: AppColors.lightGreyD1,
                        width: 1.w,
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(8.r)),
                    ),
                    child: TabBar(
                      controller: controller.tabController,
                      indicatorSize: TabBarIndicatorSize.tab,
                      padding: EdgeInsets.symmetric(
                        vertical: 5.w,
                        horizontal: 5.w,
                      ),
                      indicator: BoxDecoration(
                        color: AppColors.primaryColor,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      indicatorColor: Colors.transparent,
                      labelColor: Colors.white,
                      dividerColor: Colors.transparent,
                      unselectedLabelColor: AppColors.lightGreyD1,
                      labelStyle: TextStyle(
                        color: AppColors.whiteColor,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                      ),
                      tabs: const [
                        Tab(text: "Active"),
                        Tab(text: "Completed"),
                        Tab(text: "Canceled"),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 12,
              child: TabBarView(
                controller: controller.tabController,
                children: [
                  // Active Orders
                  Obx(() {
                    final activeOrders = controller.orderList
                        .where((o) => o.status == "active")
                        .toList();

                    return ListView.separated(
                      separatorBuilder: (_, index) => SizedBox(height: 8.h),
                      itemCount: activeOrders.length,
                      itemBuilder: (context, index) {
                        final order = activeOrders[index];
                        return GestureDetector(
                          onTap: () => Get.to(
                            () => OrderDetailsScreen(
                              itemName: order.productName,
                              itrmQuantity: order.quantity,
                              imageurl: order.imageUrl,
                              itemOrder: order.orderID,
                              itemprice: order.price,
                              pickupLocation: order.pickupLocation,
                              pickupduration: order.pickupDistance,
                              deliveryLocation: order.deliveryLocation,
                              deliveryduration: order.deliveryDistance,
                            ),
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: 16.w,
                              vertical: 10.h,
                            ),
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
                                            IconsAssetsPaths
                                                .instance
                                                .orderimage,
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
                                                  text: order.quantity,
                                                  fontSize: 16.sp,
                                                  fontWeight: FontWeight.w500,
                                                  color: AppColors.blackColor,
                                                ),
                                                SizedBox(width: 5.w),
                                                CustomText(
                                                  text: order.productName,
                                                  fontSize: 16.sp,
                                                  fontWeight: FontWeight.w500,
                                                  color: AppColors.blackColor,
                                                ),
                                              ],
                                            ),
                                            CustomText(
                                              text: order.orderID,
                                              fontSize: 14.sp,
                                              fontWeight: FontWeight.w400,
                                              color: AppColors.lightGrey,
                                            ),
                                          ],
                                        ),
                                        Spacer(),
                                        Icon(
                                          Icons.access_time,
                                          color: AppColors.orangeColor,
                                          size: 22,
                                        ),
                                        SizedBox(width: 5.w),
                                        CustomText(
                                          text: "Active",
                                          color: AppColors.orangeColor,
                                          fontWeight: FontWeight.w400,
                                          fontSize: 12.sp,
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
                                          text: order.pickupLocation,
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w400,
                                          color: AppColors.blackColor,
                                        ),
                                        Spacer(),
                                        CustomText(
                                          text: "( ${order.pickupDistance} km)",
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
                                          text: order.deliveryLocation,
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w400,
                                          color: AppColors.blackColor,
                                        ),
                                        Spacer(),
                                        CustomText(
                                          text:
                                              "( ${order.deliveryDistance} km)",
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.w400,
                                          color: AppColors.blackColor,
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 12.h),
                                    Align(
                                      alignment: Alignment.bottomRight,
                                      child: Container(
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
                                            text: order.price,
                                            fontSize: 14.sp,
                                            fontWeight: FontWeight.w500,
                                            color: AppColors.primaryColor,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  }),

                  // 🔹 Completed Orders
                  Obx(() {
                    final activeOrders = controller.orderList
                        .where((o) => o.status == "completed")
                        .toList();

                    return ListView.separated(
                      separatorBuilder: (_, index) => SizedBox(height: 8.h),
                      itemCount: activeOrders.length,
                      itemBuilder: (context, index) {
                        final order = activeOrders[index];
                        return Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 16.w,
                            vertical: 10.h,
                          ),
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
                                                text: order.quantity,
                                                fontSize: 16.sp,
                                                fontWeight: FontWeight.w500,
                                                color: AppColors.blackColor,
                                              ),
                                              SizedBox(width: 5.w),
                                              CustomText(
                                                text: order.productName,
                                                fontSize: 16.sp,
                                                fontWeight: FontWeight.w500,
                                                color: AppColors.blackColor,
                                              ),
                                            ],
                                          ),
                                          CustomText(
                                            text: order.orderID,
                                            fontSize: 14.sp,
                                            fontWeight: FontWeight.w400,
                                            color: AppColors.lightGrey,
                                          ),
                                        ],
                                      ),
                                      Spacer(),
                                      Icon(
                                        Icons.access_time,
                                        color: AppColors.greenColor,
                                        size: 22,
                                      ),
                                      SizedBox(width: 5.w),
                                      CustomText(
                                        text: "Completed",
                                        color: AppColors.greenColor,
                                        fontWeight: FontWeight.w400,
                                        fontSize: 12.sp,
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
                                        text: order.pickupLocation,
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w400,
                                        color: AppColors.blackColor,
                                      ),
                                      Spacer(),
                                      CustomText(
                                        text: "( ${order.pickupDistance} km)",
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
                                        text: order.deliveryLocation,
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w400,
                                        color: AppColors.blackColor,
                                      ),
                                      Spacer(),
                                      CustomText(
                                        text: "( ${order.deliveryDistance} km)",
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.w400,
                                        color: AppColors.blackColor,
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 12.h),
                                  Align(
                                    alignment: Alignment.bottomRight,
                                    child: Container(
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
                                          text: order.price,
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w500,
                                          color: AppColors.primaryColor,
                                        ),
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

                  // 🔹 Canceled Orders
                  Obx(() {
                    final activeOrders = controller.orderList
                        .where((o) => o.status == "canceled")
                        .toList();

                    return ListView.separated(
                      separatorBuilder: (_, index) => SizedBox(height: 8.h),
                      itemCount: activeOrders.length,
                      itemBuilder: (context, index) {
                        final order = activeOrders[index];
                        return Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 16.w,
                            vertical: 10.h,
                          ),
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
                                                text: order.quantity,
                                                fontSize: 16.sp,
                                                fontWeight: FontWeight.w500,
                                                color: AppColors.blackColor,
                                              ),
                                              SizedBox(width: 5.w),
                                              CustomText(
                                                text: order.productName,
                                                fontSize: 16.sp,
                                                fontWeight: FontWeight.w500,
                                                color: AppColors.blackColor,
                                              ),
                                            ],
                                          ),
                                          CustomText(
                                            text: order.orderID,
                                            fontSize: 14.sp,
                                            fontWeight: FontWeight.w400,
                                            color: AppColors.lightGrey,
                                          ),
                                        ],
                                      ),
                                      Spacer(),
                                      Icon(
                                        Icons.access_time,
                                        color: AppColors.redColor,
                                        size: 22,
                                      ),
                                      SizedBox(width: 5.w),
                                      CustomText(
                                        text: "Canceled",
                                        color: AppColors.redColor,
                                        fontWeight: FontWeight.w400,
                                        fontSize: 12.sp,
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
                                        text: order.pickupLocation,
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w400,
                                        color: AppColors.blackColor,
                                      ),
                                      Spacer(),
                                      CustomText(
                                        text: "( ${order.pickupDistance} km)",
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
                                        text: order.deliveryLocation,
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w400,
                                        color: AppColors.blackColor,
                                      ),
                                      Spacer(),
                                      CustomText(
                                        text: "( ${order.deliveryDistance} km)",
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.w400,
                                        color: AppColors.blackColor,
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 12.h),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      CustomText(
                                        text: 'Customer cancelled',
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w500,
                                        color: AppColors.redColor,
                                      ),
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
                                            text: order.price,
                                            fontSize: 14.sp,
                                            fontWeight: FontWeight.w500,
                                            color: AppColors.primaryColor,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  }),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
