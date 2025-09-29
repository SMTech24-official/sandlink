import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sandlink/core/app_colors/app_colors.dart';
import 'package:sandlink/core/widgets/custom_app_bar.dart';
import 'package:sandlink/core/widgets/custom_button.dart';
import 'package:sandlink/core/wrappers/custom_text.dart';
import 'package:timeline_tile/timeline_tile.dart';

import '../controllers/track_order_controllers.dart';
import 'live_map_screen.dart';

class TrackOrderScreen extends StatelessWidget {
  TrackOrderScreen({super.key});

  final controller = Get.put(TrackOrderController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: CustomAppBar(
        title: 'Track Order',
        centerTitle: true,
        onLeadingPressed: () => Get.back(),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Column(
          children: [
            SizedBox(
              height: Get.height / 1.30,
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: controller.steps.length,
                itemBuilder: (context, index) {
                  bool isCompleted = index <= controller.deliveryStatus.value;

                  Color statusColor = isCompleted
                      ? AppColors.blackColor
                      : AppColors.lightGrey;
                  Color circleColors = isCompleted
                      ? AppColors.orangeColor
                      : AppColors.lightGrey;

                  return TimelineTile(
                    alignment: TimelineAlign.start,
                    isFirst: index == 0,
                    isLast: index == controller.steps.length - 1,

                    indicatorStyle: IndicatorStyle(
                      padding: EdgeInsets.symmetric(vertical: 6.r),

                      width: 35.w,
                      height: 20.h,
                      color: statusColor,
                      indicator: Container(
                        decoration: BoxDecoration(
                          color: circleColors,
                          shape: BoxShape.circle,
                        ),
                        child: Center(
                          child: Icon(
                            controller.deliveryStatus.value >= index
                                ? Icons.check
                                : Icons.circle,
                            color: Colors.white,
                            size: 16.h,
                          ),
                        ),
                      ),
                    ),
                    beforeLineStyle: LineStyle(
                      color: index <= controller.deliveryStatus.value
                          ? AppColors.orangeColor
                          : AppColors.lightGrey,
                      thickness: 3.w,
                    ),

                    afterLineStyle: LineStyle(
                      color: index < controller.deliveryStatus.value
                          ? AppColors.orangeColor
                          : AppColors.lightGrey,
                      thickness: 3.w,
                    ),
                    endChild: Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: 10.h,
                        horizontal: 10.w,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          SizedBox(height: 20.h),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CustomText(
                                text: controller.steps[index].title,
                                color: AppColors.blackColor,
                                fontWeight: FontWeight.w500,
                                fontSize: 18.sp,
                              ),
                              CustomText(
                                text: '08:10 AM',
                                color: AppColors.GeryColorC9,
                                fontWeight: FontWeight.w500,
                                fontSize: 12.sp,
                              ),
                            ],
                          ),
                          CustomText(
                            text: controller.steps[index].subtitle,
                            color: AppColors.lightGrey,
                            fontWeight: FontWeight.w400,
                            fontSize: 14.sp,
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            Spacer(),
            _mapButton(),
            SizedBox(height: 40.h),
          ],
        ),
      ),
    );
  }
}

Widget _mapButton() {
  return SizedBox(
    height: 52.h,
    width: double.infinity.w,
    child: CustomButton(
      onPressed: () => Get.to(() => LiveMapScreen()),
      text: 'Check Location Map',
    ),
  );
}
