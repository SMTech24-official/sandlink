import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:sandlink/features/rider/rider_user_profile/controller/rider_user_profile_controller.dart';
import 'package:sandlink/features/rider/rider_user_profile/screen/rider_document.dart';
import 'package:sandlink/features/rider/rider_user_profile/screen/rider_edit_profile_screen.dart';
import 'package:sandlink/features/rider/rider_user_profile/screen/rider_payment_methods.dart';
import '../../../../core/app_colors/app_colors.dart';
import '../../../../core/config/constants/assets_paths/icons_assets_paths.dart';
import '../../../../core/config/constants/assets_paths/svg_assets_paths.dart';
import '../../../../core/widgets/custom_app_bar.dart';
import '../../../../core/widgets/custom_bottom_sheet.dart';
import '../../../../core/wrappers/custom_text.dart';

class RiderUserProfileScreen extends StatelessWidget {
  RiderUserProfileScreen({super.key});

  final controller = Get.put(RiderUserProfileController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: CustomAppBar(
        title: 'Profile',
        onLeadingPressed: () => Get.back(),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(flex: 2, child: _userProfile(controller: controller)),

                Expanded(
                  flex: 1,
                  child: _profileMenuList(controller: controller),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget _userProfile({required RiderUserProfileController controller}) {
  return Column(
    children: [
      CircleAvatar(
        backgroundColor: Colors.amber,
        backgroundImage: AssetImage(IconsAssetsPaths.instance.userImage),
        radius: 56.r,
      ),
      SizedBox(height: 8.h),
      CustomText(
        text: 'Alex Smith',
        color: AppColors.blackColor,
        fontSize: 24.sp,
        fontWeight: FontWeight.w500,
      ),
      CustomText(
        text: 'alexsmith@gmail.com',
        color: AppColors.lightGrey,
        fontSize: 16.sp,
        fontWeight: FontWeight.w400,
      ),
      SizedBox(height: 8.h),
      _offlineCard(controller: controller),
      SizedBox(height: 8.h),
      _truckDetails(controller: controller),
    ],
  );
}

Widget _offlineCard({required RiderUserProfileController controller}) {
  return Container(
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

Widget _truckDetails({required RiderUserProfileController controller}) {
  return Container(
    width: double.infinity.w,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.all(Radius.circular(8.r)),
      color: AppColors.whiteColor,
    ),
    child: Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      child: Column(
        children: [
          Row(
            children: [
              SvgPicture.asset(SvgAssetsPaths.instance.truck),
              SizedBox(width: 8.w),
              CustomText(
                text: 'Truck Details',
                fontSize: 20.sp,
                color: AppColors.blackColor,
                fontWeight: FontWeight.w500,
              ),
            ],
          ),
          SizedBox(height: 5.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    text: 'Type',
                    fontSize: 14.sp,
                    color: AppColors.lightGrey,
                    fontWeight: FontWeight.w400,
                  ),
                  CustomText(
                    text: '20-ton Tipper',
                    fontSize: 16.sp,
                    color: AppColors.primaryColor,
                    fontWeight: FontWeight.w500,
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    text: 'Plate Number',
                    fontSize: 14.sp,
                    color: AppColors.lightGrey,
                    fontWeight: FontWeight.w400,
                  ),
                  CustomText(
                    text: 'ABC-123XY',
                    fontSize: 16.sp,
                    color: AppColors.primaryColor,
                    fontWeight: FontWeight.w500,
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    ),
  );
}

Widget _profileMenuList({required RiderUserProfileController controller}) {
  return SizedBox(
    height: Get.height / 2.0,
    width: double.infinity.w,

    child: ListView.separated(
      separatorBuilder: (_, index) => SizedBox(height: 5.h),
      itemCount: controller.profilemenuList.length,
      itemBuilder: (_, index) {
        final itemdata = controller.profilemenuList[index];
        return GestureDetector(
          onTap: () {
            if (index == 0) {
              Get.to(() => RiderEditProfileScreen());
            } else if (index == 1) {
              Get.to(() => RiderDocumentScreen());
            } else if (index == 2) {
              Get.to(() => RiderPaymentMethodsScreen());
            } else if (index == 3) {
              showCustomBottomSheet(
                title: 'Delete Account',
                subtitle: 'Are you sure you want to\n   delete your account?',
                buttonTitle1: 'Cancel',
                buttonTitle2: 'Yes, Delete',
                onTap1: () => Get.back(),
                onTap2: () {},
              );
            } else if (index == 4) {
              showCustomBottomSheet(
                title: 'Logout',
                subtitle: 'Are you sure you want to log out?',
                buttonTitle1: 'Cancel',
                buttonTitle2: 'Yes, Logout',
                onTap1: () => Get.back(),
                onTap2: () {},
              );
            }
          },
          child: Container(
            height: 50.h,
            width: double.infinity.w,
            color: AppColors.whiteColor,
            child: Row(
              children: [
                Container(
                  height: 44.h,
                  width: 44.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(8.r)),
                    color: itemdata.bgColor,
                  ),
                  child: Image.asset(itemdata.leadingImage),
                ),
                SizedBox(width: 8.w),
                CustomText(
                  text: itemdata.title,
                  color: AppColors.blackColor,
                  fontWeight: FontWeight.w500,
                  fontSize: 16.sp,
                ),

                Spacer(),
                Image.asset(itemdata.trailingImage),
              ],
            ),
          ),
        );
      },
    ),
  );
}
