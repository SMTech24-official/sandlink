import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sandlink/core/app_colors/app_colors.dart';
import 'package:sandlink/core/widgets/custom_app_bar.dart';
import 'package:sandlink/core/wrappers/custom_text.dart';

import '../controllers/rider_notification_controller.dart';

class RiderNotificationScreen extends StatelessWidget {
  RiderNotificationScreen({super.key});

  final controller = Get.put(RiderNotificationController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: CustomAppBar(
        title: 'Notification',
        centerTitle: true,
        onLeadingPressed: () => Get.back(),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                SizedBox(
                  height: 30.h,
                  width: double.infinity.w,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomText(
                        text: 'Today',
                        color: AppColors.blackColor,
                        fontWeight: FontWeight.w500,
                        fontSize: 16.sp,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: Get.height / 1.21.h,
                  width: double.infinity.w,

                  child: ListView.separated(
                    separatorBuilder: (_, index) => SizedBox(height: 8.h),
                    itemCount: controller.messageList.length,
                    itemBuilder: (_, index) {
                      final messageData = controller.messageList[index];
                      return Card(
                        child: Container(
                          width: double.infinity.w,
                          color: AppColors.whiteColor,
                          child: Padding(
                            padding: EdgeInsets.symmetric(vertical: 10.h),

                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(width: 8.w),

                                CircleAvatar(
                                  radius: 30.r,
                                  backgroundColor: AppColors.orangeColor,
                                  child: Image.asset(
                                    messageData.imageUrl,
                                    scale: 0.6,
                                  ),
                                ),

                                SizedBox(width: 8.w),

                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      // Row for status + time
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Expanded(
                                            child: CustomText(
                                              text: messageData.orderStatus,
                                              color: AppColors.blackColor,
                                              fontWeight: FontWeight.w500,
                                              fontSize: 14.sp,
                                            ),
                                          ),
                                          CustomText(
                                            text: messageData.messageTime,
                                            color: AppColors.lightGrey,
                                            fontWeight: FontWeight.w400,
                                            fontSize: 12.sp,
                                          ),
                                        ],
                                      ),

                                      SizedBox(height: 8.h),

                                      // Message text
                                      CustomText(
                                        maxLines: 4,
                                        text: messageData.message,
                                        color: AppColors.blackColor,
                                        fontWeight: FontWeight.w400,
                                        fontSize: 12.sp,
                                      ),
                                    ],
                                  ),
                                ),

                                SizedBox(width: 10.w),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
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
