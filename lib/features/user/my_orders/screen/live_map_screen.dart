import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sandlink/core/widgets/custom_app_bar.dart';
import 'package:timeline_tile/timeline_tile.dart';
import '../../../../core/app_colors/app_colors.dart';
import '../../../../core/wrappers/custom_text.dart';
import '../controllers/live_map_controllers.dart';

class LiveMapScreen extends StatelessWidget {
  LiveMapScreen({super.key});

  final controller = Get.put(LiveMapControllers());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Live Map',
        centerTitle: true,
        onLeadingPressed: () => Get.back(),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: Obx(() => GoogleMap(
                initialCameraPosition: CameraPosition(
                  target: controller.pickupPoint,
                  zoom: 14,
                ),
                markers: controller.markers.value,
                polylines: controller.polylines.value,
                mapType: MapType.normal,
                myLocationEnabled: true,
                zoomControlsEnabled: false,
              )),
            ),

            SizedBox(height: 20.h),
            Expanded(flex: 2, child: _liveMapTimeLine(controller: controller)),
          ],
        ),
      ),
    );
  }
}

Widget _liveMapTimeLine({required LiveMapControllers controller}) {
  return SizedBox(
    height: Get.height / 1.3,
    width: double.infinity.w,
    child: ListView.builder(
      itemCount: controller.steps.length,
      itemBuilder: (context, index) {
        bool isCompleted = index <= controller.deliveryStatus.value;

        Color statusColor = isCompleted
            ? AppColors.blackColor
            : AppColors.lightGreyD1;

        return TimelineTile(
          alignment: TimelineAlign.start,
          isFirst: index == 0,
          isLast: index == controller.steps.length - 1,

          indicatorStyle: IndicatorStyle(
            padding: EdgeInsets.symmetric(vertical: 5.h),
            width: 35.w,
            height: 35.h,
            color: statusColor,
            indicator: Container(
              decoration: BoxDecoration(
                color: controller.colors[index],
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Image.asset(controller.steps[index].imageUrl),
              ),
            ),
          ),
          beforeLineStyle: LineStyle(
            color: index <= controller.deliveryStatus.value
                ? AppColors.orangeColor
                : AppColors.lightGreyD1,
            thickness: 3.w,
          ),

          afterLineStyle: LineStyle(
            color: index < controller.deliveryStatus.value
                ? AppColors.orangeColor
                : AppColors.lightGreyD1,
            thickness: 3.w,
          ),
          endChild: Padding(
            padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 10.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,

                  children: [
                    CustomText(
                      text: controller.steps[index].title,
                      color: AppColors.GeryColorC9,
                      fontWeight: FontWeight.w400,
                      fontSize: 16.sp,
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
                  color: AppColors.blackColor,
                  fontWeight: FontWeight.w500,
                  fontSize: 16.sp,
                ),
              ],
            ),
          ),
        );
      },
    ),
  );
}
