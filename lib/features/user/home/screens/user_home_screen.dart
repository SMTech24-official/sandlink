import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:sandlink/core/app_colors/app_colors.dart';
import 'package:sandlink/core/app_routes/app_route_names.dart';
import 'package:sandlink/core/config/constants/assets_paths/icons_assets_paths.dart';
import 'package:sandlink/core/config/constants/assets_paths/svg_assets_paths.dart';
import 'package:sandlink/core/wrappers/custom_text.dart';
import 'package:sandlink/features/user/category/screen/category_screen.dart';
import 'package:sandlink/features/user/category_popular_list/controllers/category_popular_details_controller.dart';
import 'package:sandlink/features/user/home/controllers/user_home_controller.dart';
import 'package:sandlink/features/user/join_affiliates/screen/terms_conditions_screen.dart';
import 'package:sandlink/features/user/user_profile/controller/user_profile_controller.dart';
import '../../category_popular_list/screens/category_popular_details.dart';
import '../../category_popular_list/screens/category_popular_list.dart';

class UserHomeScreen extends StatelessWidget {
  UserHomeScreen({super.key});
  final detailscontroller = Get.put(CategoryPopularDetailsController());

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UserHomeController());
    return Scaffold(
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
              GestureDetector(
                onTap: controller.getCategories,
                child: CustomText(
                  text: 'Our Products',
                  fontSize: 20.spMin,
                  fontWeight: FontWeight.w600,
                ),
              ),
              12.verticalSpace,
              _productsWidget(controller: controller),
              24.verticalSpace,

              /// 🔹 Most Popular
              12.verticalSpace,
              Obx(() {
                // Check if list is empty
                if (controller.mostPopularProductList.isEmpty) {
                  return Center(child: Text(" "));
                } else {
                  return Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomText(
                            text: 'Most Popular',
                            fontSize: 20.spMin,
                            fontWeight: FontWeight.w600,
                          ),
                          GestureDetector(
                            onTap: () => Get.to(
                              () => CategoryPopularScreen(
                                appbarTitle: 'Most Popular',
                              ),
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
                      SizedBox(height: 15.h),
                      _popularProducts(controller: controller),
                    ],
                  );
                }
              }),
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
        Container(
          height: 180.h,
          width: double.infinity.w,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10.r)),
            image: DecorationImage(
              image: AssetImage(IconsAssetsPaths.instance.banner),
            ),
          ),

          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 25.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                  text: 'Join Our Affiliate',
                  fontWeight: FontWeight.w500,
                  color: AppColors.whiteColor,
                  fontSize: 16.sp,
                ),
                SizedBox(height: 8.h),
                CustomText(
                  text: 'Network & Grow Faster',
                  fontWeight: FontWeight.w400,
                  color: AppColors.whiteColor,
                  fontSize: 14.sp,
                ),
                SizedBox(height: 16.h),
                Container(
                  height: 40.h,
                  width: 90.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10.r)),
                    color: AppColors.whiteColor,
                  ),
                  child: Center(
                    child: GestureDetector(
                      onTap: () {
                        Get.to(TermsConditionsScreen());
                      },
                      child: CustomText(
                        text: 'Join Now',
                        fontSize: 16.sp,
                        color: AppColors.primaryColor,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        //   Container(
        //   width: double.infinity,
        //   decoration: BoxDecoration(
        //     borderRadius: BorderRadius.all(Radius.circular(8.r)),
        //   ),
        //   child: ClipPath(
        //     clipper: TrapezoidClipper(),
        //     child: Container(
        //       height: 140.h,
        //       width: double.infinity,
        //       color: AppColors.primaryColor,
        //       padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 16.h),
        //       child: Column(
        //         crossAxisAlignment: CrossAxisAlignment.start,
        //         mainAxisAlignment: MainAxisAlignment.center,
        //         children: [
        //           CustomText(
        //             text: 'Join Our Affiliate',
        //             fontSize: 18.sp,
        //             color: AppColors.whiteColor,
        //             fontWeight: FontWeight.w500,
        //           ),
        //           CustomText(
        //             text: 'Network & Grow Faster',
        //             fontSize: 14.sp,
        //             color: AppColors.whiteColor,
        //             fontWeight: FontWeight.w400,
        //           ),
        //         ],
        //       ),
        //     ),
        //   ),
        // ),

        // Expanded(
        //   flex: 1,
        //   child: ClipPath(
        //     clipper: TrapezoidClipper(),
        //     child: Container(
        //       height: 140.h,
        //       width: 180.w,
        //      color: AppColors.redColor,
        //       child: Padding(
        //         padding:  EdgeInsets.symmetric(horizontal:12.w,vertical: 16.h),
        //         child: Column(
        //           crossAxisAlignment: CrossAxisAlignment.start,
        //           children: [
        //             CustomText(
        //               text: 'Join Our Affiliate',
        //               fontSize: 18.sp,
        //               color: AppColors.whiteColor,
        //               fontWeight: FontWeight.w500,
        //             ),
        //
        //             CustomText(
        //               text: 'Network & Grow Faster',
        //               fontSize: 14.sp,
        //               color: AppColors.whiteColor,
        //               fontWeight: FontWeight.w400,
        //             ),
        //           ],
        //         ),
        //       ),
        //     ),
        //   ),
        // ),

        // ClipRRect(
        //   borderRadius: BorderRadius.circular(12.r),
        //   child: SizedBox(
        //     height: Get.width * 0.45,
        //     width: double.infinity,
        //     child: CarouselSlider.builder(
        //       itemCount: controller.images.length,
        //       itemBuilder: (context, index, realIndex) {
        //         return Image.network(
        //           controller.images[index],
        //           fit: BoxFit.cover,
        //           width: double.infinity,
        //         );
        //       },
        //       options: CarouselOptions(
        //         autoPlay: true,
        //         autoPlayInterval: const Duration(seconds: 3),
        //         viewportFraction: 1.0,
        //         enableInfiniteScroll: true,
        //         onPageChanged: (index, reason) {
        //           controller.currentPage.value = index;
        //         },
        //       ),
        //     ),
        //   ),
        // ),
        // 8.verticalSpace,
        // Obx(
        //       () =>
        //       Row(
        //         mainAxisAlignment: MainAxisAlignment.center,
        //         children: List.generate(controller.images.length, (index) {
        //           return AnimatedContainer(
        //             duration: const Duration(milliseconds: 300),
        //             margin: EdgeInsets.symmetric(horizontal: 4.w),
        //             height: 8.h,
        //             width: controller.currentPage.value == index ? 24.w : 8.w,
        //             decoration: BoxDecoration(
        //               color: controller.currentPage.value == index
        //                   ? AppColors.primaryColor
        //                   : AppColors.primaryColor.withValues(alpha: 0.3),
        //               borderRadius: BorderRadius.circular(4.r),
        //             ),
        //           );
        //         }),
        //       ),
        // ),
      ],
    );
  }

  /// 🔹 Products category row
  Widget _productsWidget({required UserHomeController controller}) {
    return SizedBox(
      height: Get.width * 0.27,
      child: Obx(
        () => ListView.separated(
          scrollDirection: Axis.horizontal,
          itemCount: controller.categoriesList.length,
          separatorBuilder: (_, __) => 15.horizontalSpace,
          itemBuilder: (context, index) {
            final items = controller.categoriesList[index];
            return GestureDetector(
              onTap: () {
                Get.to(() => CategoryScreen(appbarTitle: 'Boulders'));
              },

              child: SizedBox(
                width: 80.w,
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 30.r,
                      backgroundImage: CachedNetworkImageProvider(
                        "${items.image}",
                      ),
                    ),
                    8.verticalSpace,
                    Expanded(
                      child: CustomText(
                        text: "${items.name}",
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
      ),
    );
  }

  /// 🔹 Popular products list
  Widget _popularProducts({required UserHomeController controller}) {
    return SizedBox(
      height: 250.h,
      child: Obx(() {
        return ListView.separated(
          scrollDirection: Axis.horizontal,
          itemCount: controller.mostPopularProductList.length,
          separatorBuilder: (_, __) => 20.horizontalSpace,
          itemBuilder: (context, index) {
            final items = controller.mostPopularProductList[index];
            return GestureDetector(
              onTap: () async {
                final productId = items.id;
                if (productId != null) {
                  await detailscontroller.getrProductdetails(productId);
                  Get.to(() => CategoryPopularDetailsScreen());
                } else {
                  if (kDebugMode) {
                    print("Product ID is null");
                  }
                }
              },
              child: Container(
                width: 226.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.r),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 6,
                      offset: const Offset(0, 0),
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
                        "${items.image}",
                        height: 160.h,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                    10.verticalSpace,

                    /// Title
                    CustomText(
                      text: items.name ?? "",
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
                            Icon(Icons.star, color: Colors.amber, size: 12),
                            SizedBox(width: 3.h),
                            CustomText(
                              text: "${items.count?.reviews ?? 0}",
                              fontWeight: FontWeight.w400,
                              color: AppColors.lightGrey,
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            CustomText(
                              text: '₦${items.price}',
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
        );
      }),
    );
  }

  /// 🔹 Top app bar
  Widget _topAppBarWidget({required UserHomeController controller}) {
    final profileController = Get.find<UserProfileController>();

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            CircleAvatar(
              radius: 25.r,
              backgroundImage: CachedNetworkImageProvider(
                "${profileController.getUserProfile}",
              ),
            ),
            16.horizontalSpace,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                  text: 'Hi, ${profileController.getUserName}',
                  fontSize: 18.spMin,
                  fontWeight: FontWeight.w600,
                ),
                4.verticalSpace,
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {},
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

                    CustomText(
                      text: controller.userlocation.toString() == ''
                          ? 'Address not found'
                          : controller.userlocation.toString(),
                    ),
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

// class TrapezoidClipper extends CustomClipper<Path> {
//   @override
//   Path getClip(Size size) {
//     double topWidth = 75.w;
//     double bottomWidth = 30.w;
//     double height = size.height;
//
//     Path path = Path();
//     path.moveTo((size.width - topWidth) / -2, 0); // top-left
//     path.lineTo((size.width + topWidth) / 2, 0); // top-right
//     path.lineTo((size.width + bottomWidth) / 3, height); // bottom-right
//     path.lineTo((size.width - bottomWidth) / -2, height); // bottom-left
//     path.close();
//     return path;
//   }
//
//   @override
//   bool shouldReclip(CustomClipper<Path> oldClipper) => false;
// }
//
// class BackTrapezoidClipper extends CustomClipper<Path> {
//   @override
//   Path getClip(Size size) {
//     double topWidth = 75.w;
//     double bottomWidth = 30.w;
//     double height = size.height;
//
//     Path path = Path();
//     path.moveTo((size.width - topWidth) / 2, 0); // top-left
//     path.lineTo((size.width + topWidth) / -2, 0); // top-right
//     path.lineTo((size.width + bottomWidth) / -3, height); // bottom-right
//     path.lineTo((size.width - bottomWidth) / 2, height); // bottom-left
//     path.close();
//     return path;
//   }
//
//   @override
//   bool shouldReclip(CustomClipper<Path> oldClipper) => false;
// }
