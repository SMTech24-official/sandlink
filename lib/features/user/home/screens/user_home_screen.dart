import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:sandlink/core/app_colors/app_colors.dart';
import 'package:sandlink/core/app_routes/app_route_names.dart';
import 'package:sandlink/core/config/constants/assets_paths/svg_assets_paths.dart';
import 'package:sandlink/core/services/DBServices/local_db_services/storage_service.dart';
import 'package:sandlink/core/wrappers/custom_text.dart';
import 'package:sandlink/features/user/home/controllers/user_home_controller.dart';
import '../../category_popular_list/screens/category_popular_details.dart';
import '../../category_popular_list/screens/category_popular_list.dart';

class UserHomeScreen extends StatelessWidget {
  const UserHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UserHomeController());
    return Scaffold(
      backgroundColor: const Color(0xFFF8F8F8),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 12.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _topAppBarWidget(controller: controller),
              20.verticalSpace,

              /// 🔹 Banner slider
              _bannerSlider(controller),
              20.verticalSpace,

              /// 🔹 Our Products
              CustomText(
                text: 'Our Products',
                fontSize: 20.spMin,
                fontWeight: FontWeight.w600,
              ),
              12.verticalSpace,
              _productsWidget(),
              24.verticalSpace,

              /// 🔹 Most Popular
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomText(
                    text: 'Most Popular',
                    fontSize: 20.spMin,
                    fontWeight: FontWeight.w600,
                  ),
                  GestureDetector(
                    onTap: () =>
                        Get.to(
                              () =>
                              CategoryPopularScreen(
                                  appbarTitle: 'Most Popular'),
                        ),
                    child: CustomText(
                      text: 'See All',
                      fontSize: 16.spMin,
                      fontWeight: FontWeight.w500,
                      color: AppColors.lightGrey,
                    ),
                  ),
                ],
              ),
              12.verticalSpace,
              _popularProducts(),
            ],
          ),
        ),
      ),
    );
  }

  /// 🔹 Banner widget
  Widget _bannerSlider(UserHomeController controller) {
    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(12.r),
          child: SizedBox(
            height: Get.width * 0.45,
            width: double.infinity,
            child: CarouselSlider.builder(
              itemCount: controller.images.length,
              itemBuilder: (context, index, realIndex) {
                return Image.network(
                  controller.images[index],
                  fit: BoxFit.cover,
                  width: double.infinity,
                );
              },
              options: CarouselOptions(
                autoPlay: true,
                autoPlayInterval: const Duration(seconds: 3),
                viewportFraction: 1.0,
                enableInfiniteScroll: true,
                onPageChanged: (index, reason) {
                  controller.currentPage.value = index;
                },
              ),
            ),
          ),
        ),
        8.verticalSpace,
        Obx(
              () =>
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(controller.images.length, (index) {
                  return AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    margin: EdgeInsets.symmetric(horizontal: 4.w),
                    height: 8.h,
                    width: controller.currentPage.value == index ? 24.w : 8.w,
                    decoration: BoxDecoration(
                      color: controller.currentPage.value == index
                          ? AppColors.primaryColor
                          : AppColors.primaryColor.withValues(alpha: 0.3),
                      borderRadius: BorderRadius.circular(4.r),
                    ),
                  );
                }),
              ),
        ),
      ],
    );
  }

  /// 🔹 Products category row
  Widget _productsWidget() {
    return SizedBox(
      height: Get.width * 0.27,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: 5,
        separatorBuilder: (_, __) => 15.horizontalSpace,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Get.to(() => CategoryPopularScreen(appbarTitle: 'Boulders'));
            },

            child: SizedBox(
              width: 80.w,
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 30.r,
                    backgroundImage: const CachedNetworkImageProvider(
                      "https://www.figma.com/file/jNz7l61vmikt0kYyCBqz6X/image/f08a40c5013d07e2b2fe4f7423a7220f5ba43e84",
                    ),
                  ),
                  8.verticalSpace,
                  Expanded(
                    child: CustomText(
                      text: 'Boulders',
                      fontSize: 14.spMin,
                      fontWeight: FontWeight.w500,
                      color: AppColors.lightGrey,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  /// 🔹 Popular products list
  Widget _popularProducts() {
    return SizedBox(
      height: 260.h,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: 5,
        separatorBuilder: (_, __) => 20.horizontalSpace,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () => Get.to(() => CategoryPopularDetailsScreen()),
            child: Container(
              width: 226.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.r),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 6,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              padding: EdgeInsets.all(12.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  /// Product image
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12.r),
                    child: Image.network(
                      "https://www.figma.com/file/jNz7l61vmikt0kYyCBqz6X/image/c7eb458c8334d622e53cf983844410ccf9686134",
                      height: 160.h,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                  10.verticalSpace,

                  /// Title
                  CustomText(
                    text: 'Builder’s Choice Sand',
                    fontSize: 16.spMin,
                    fontWeight: FontWeight.w600,
                  ),
                  8.verticalSpace,

                  /// Rating + Price
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.star_rounded,
                            color: const Color(0xFFFFC107),
                            size: 18.sp,
                          ),
                          4.horizontalSpace,
                          CustomText(
                            text: '5.0',
                            fontSize: 14.spMin,
                            color: AppColors.lightGrey,
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          CustomText(
                            text: '₦200',
                            fontSize: 14.spMin,
                            fontWeight: FontWeight.w600,
                          ),
                          4.horizontalSpace,
                          CustomText(
                            text: 'Ton',
                            fontSize: 12.spMin,
                            color: AppColors.lightGrey,
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  /// 🔹 Top app bar
  Widget _topAppBarWidget({required UserHomeController controller}) {
    var userName = StorageService().getData('name');

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
                  text: 'Hi, $userName',
                  fontSize: 18.spMin,
                  fontWeight: FontWeight.w600,
                ),
                4.verticalSpace,
                Row(
                  children: [
                    GestureDetector(
                      onTap: () => controller.getCurrentLocation(),
                      child: SvgPicture.asset(
                        SvgAssetsPaths.instance.location,
                        width: 16.w,
                        height: 16.h,
                        colorFilter: ColorFilter.mode(
                          AppColors.lightGrey,
                          BlendMode.srcIn,
                        ),
                      ),
                    ),
                    6.horizontalSpace,

                    Obx(() => CustomText(
                      text:controller.currentAddress.value == ''
                          ? 'Address not found'
                          : controller.currentAddress.value,

                    )),
                  ],
                ),
              ],
            ),
          ],
        ),

        /// Search button
        InkWell(
          onTap: () => Get.toNamed(AppRouteNames.instance.search),
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
            child: SvgPicture.asset(SvgAssetsPaths.instance.search),
          ),
        ),
      ],
    );
  }
}
