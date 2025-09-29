import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sandlink/core/app_routes/app_route_names.dart';
import 'package:sandlink/core/config/constants/assets_paths/icons_assets_paths.dart';
import 'package:sandlink/core/widgets/custom_button.dart';
import 'package:sandlink/features/common/onboarding/controllers/user_onboarding_controller.dart';
import 'package:sandlink/features/common/onboarding/widgets/slider_model.dart';

import '../../../../../core/app_colors/app_colors.dart';

class UserOnboardingScreen extends StatelessWidget {
  const UserOnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UserOnboardingController());
    List<Map<String, dynamic>> sliderData = [
      {
        'image': IconsAssetsPaths.instance.onboarding1,
        'title': 'Welcome to SANDLINK',
        'subtitle':
            'Your one-stop shop for granite chips, sand, gravel, and more!',
      },
      {
        'image': IconsAssetsPaths.instance.onboarding2,
        'title': 'Browse our wide selection',
        'subtitle':
            'Explore high-quality materials for all your construction needs, delivered straight to your site.',
      },
      {
        'image': IconsAssetsPaths.instance.onboarding3,
        'title': 'Real-Time Delivery Tracking',
        'subtitle':
            'Stay updated with live tracking and know exactly when your materials will arrive at your site.',
      },
    ];
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              scrollDirection: Axis.horizontal,
              controller: controller.pageController,
              itemCount: sliderData.length,
              itemBuilder: (context, index) {
                return SliderModel(
                  image: sliderData[index]['image'],
                  title: sliderData[index]['title'],
                  description: sliderData[index]['subtitle'],
                );
              },
              onPageChanged: controller.updatePageIndex,
            ),
          ),
          20.verticalSpace,
          Obx(
            () => Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                sliderData.length,
                (index) => buildDot(index, controller),
              ),
            ),
          ),
          10.verticalSpace,
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: Obx(
              () => CustomButton(
                text: controller.currentIndex.value == sliderData.length - 1
                    ? "Let's Get Started"
                    : "Next",
                onPressed: () {
                  if (controller.currentIndex.value == sliderData.length - 1) {
                  Get.offAllNamed(AppRouteNames.instance.login);
                  }
                  controller.pageController.nextPage(
                    duration: Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                  );
                },
              ),
            ),
          ),
          20.verticalSpace,
        ],
      ),
    );
  }

  AnimatedContainer buildDot(int index, UserOnboardingController controller) {
    return AnimatedContainer(
      height: 8,
      width: controller.currentIndex.value == index ? 30 : 8,
      margin: EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: controller.currentIndex.value == index
            ? AppColors.primaryColor
            : Color(0x4D7172CC),
      ),
      duration: const Duration(milliseconds: 150),
    );
  }
}
