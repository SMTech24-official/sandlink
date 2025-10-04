import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sandlink/core/app_colors/app_colors.dart';
import 'package:sandlink/core/widgets/custom_app_bar.dart';
import 'package:sandlink/core/wrappers/custom_text.dart';
import 'package:timeago/timeago.dart' as timeago;
import '../controllers/notification_controller.dart';

class NotificationScreen extends StatelessWidget {
  NotificationScreen({super.key});

  final controller = Get.put(NotificationController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Notification',
        centerTitle: true,
        onLeadingPressed: () => Get.back(),
      ),
      body: Obx(() {
        if (controller.notifation.isEmpty) {
          return const Center(child: Text("No notifications yet"));
        }

        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          child: ListView.separated(
            separatorBuilder: (_, index) => SizedBox(height: 8.h),
            itemCount: controller.notifation.length,
            itemBuilder: (_, index) {
              final notification = controller.notifation[index];
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
                          radius: 25.r,
                          backgroundColor: AppColors.orangeColor,
                          child: Icon(
                            Icons.notifications,
                            color: AppColors.whiteColor,
                          ),
                        ),

                        SizedBox(width: 8.w),

                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Title + time
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: CustomText(
                                      text: notification.title ?? "No Title",
                                      color: AppColors.blackColor,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 14.sp,
                                    ),
                                  ),
                                  CustomText(
                                    text: notification.createdAt != null
                                        ? timeago.format(
                                            notification.createdAt!,
                                          )
                                        : "",
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
                                text: notification.message ?? "",
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
        );
      }),
    );
  }
}
