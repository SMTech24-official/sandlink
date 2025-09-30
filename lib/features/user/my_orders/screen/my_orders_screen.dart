import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sandlink/core/app_colors/app_colors.dart';
import 'package:sandlink/core/widgets/custom_app_bar.dart';
import 'package:sandlink/core/widgets/custom_button.dart';
import 'package:sandlink/core/wrappers/custom_text.dart';
import 'package:sandlink/features/user/my_orders/screen/track_order_screen.dart';

import 'user_item_reviews.dart';
import '../controllers/my_orders_controllers.dart';

class MyOrdersScreen extends StatelessWidget {
  MyOrdersScreen({super.key});

  final controller = Get.put(MyOrdersControllers());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'My Orders',
        centerTitle: true,
        onLeadingPressed: () => Get.back(),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.h),
        child: ListView.separated(
          separatorBuilder: (_, index) => SizedBox(height: 8.h),
          itemCount: controller.myorderList.length,
          itemBuilder: (_, index) {
            final orderData = controller.myorderList[index];
            return Card(
              elevation: 1,
              color: Colors.transparent,
              child: Container(
                height: 217.h,
                width: double.infinity.w,
                decoration: BoxDecoration(
                  color: AppColors.whiteColor,
                  borderRadius: BorderRadius.all(Radius.circular(8.r)),
                ),
                child: Padding(
                  padding: EdgeInsets.all(12.h),
                  child: Column(
                    children: [
                      // order id //
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomText(
                                text: orderData.orderId,
                                color: AppColors.blackColor,
                                fontWeight: FontWeight.w500,
                                fontSize: 16.sp,
                              ),
                              CustomText(
                                text: orderData.placeDate,
                                color: AppColors.lightGrey,
                                fontWeight: FontWeight.w400,
                                fontSize: 12.sp,
                              ),
                            ],
                          ),
                          Container(
                            height: 30.h,
                            width: 83.w,
                            decoration: BoxDecoration(
                              color: orderData.deliveryStatus == 0
                                  ? AppColors.orangeColor.withValues(alpha: 0.2)
                                  : orderData.deliveryStatus == 1
                                  ? AppColors.greenColor.withValues(alpha: 0.2)
                                  : AppColors.blueColor.withValues(alpha: 0.2),

                              borderRadius: BorderRadius.all(
                                Radius.circular(30.r),
                              ),
                            ),
                            child: Center(
                              child: CustomText(
                                text: orderData.deliveryStatus == 0
                                    ? "Process"
                                    : orderData.deliveryStatus == 1
                                    ? "Delivered"
                                    : "On the way",
                                color: orderData.deliveryStatus == 0
                                    ? AppColors.orangeColor
                                    : orderData.deliveryStatus == 1
                                    ? AppColors.greenColor
                                    : AppColors.blueColor,
                                fontWeight: FontWeight.w500,
                                fontSize: 12.sp,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 12.h),
                      // Image and Title //
                      Row(
                        children: [
                          Container(
                            height: 70.h,
                            width: 70.w,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.circular(12.r),
                              ),
                              color: Colors.amber,
                              image: DecorationImage(
                                image: NetworkImage(orderData.imageUrl),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          SizedBox(width: 12.w),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomText(
                                text: orderData.title,
                                color: AppColors.blackColor,
                                fontWeight: FontWeight.w500,
                                fontSize: 14.sp,
                              ),
                              SizedBox(height: 6.h),

                              Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  CustomText(
                                    text: '${orderData.quantity}/',
                                    color: AppColors.blackColor,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14.sp,
                                  ),
                                  SizedBox(width: 2.w),
                                  CustomText(
                                    text: 'Ton',
                                    color: AppColors.lightGrey,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 12.sp,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 12.h),
                      Divider(
                        height: 2,
                        thickness: 1,
                        indent: 5,
                        endIndent: 5,
                        color: AppColors.GeryColorE4,
                      ),
                      SizedBox(height: 12.h),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomText(
                            text: 'Total: ${orderData.totalAmount}',
                            color: AppColors.blackColor,
                            fontWeight: FontWeight.w500,
                            fontSize: 14.sp,
                          ),
                          CustomButton(
                            height: 8.h,
                            width: 115.w,
                            onPressed: () {
                              if (orderData.deliveryStatus == 0) {
                              } else if (orderData.deliveryStatus == 1) {
                                Get.to(() => UserItemReviewsScreen());
                              } else {
                                Get.to(() => TrackOrderScreen());
                              }
                            },
                            text: orderData.deliveryStatus == 0
                                ? "Cancel Order"
                                : orderData.deliveryStatus == 1
                                ? "Give Review"
                                : "Track Order",
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                            backgroundColor: orderData.deliveryStatus == 0
                                ? AppColors.redColor
                                : orderData.deliveryStatus == 1
                                ? AppColors.greenColor
                                : AppColors.blackColor,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
