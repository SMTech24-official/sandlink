import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sandlink/core/widgets/custom_app_bar.dart';
import 'package:sandlink/core/widgets/custom_button.dart';
import 'package:sandlink/core/wrappers/custom_text.dart';
import 'package:sandlink/features/user/my_orders/screen/user_item_reviews.dart';

import '../../../../core/app_colors/app_colors.dart';
import '../../../../core/config/constants/assets_paths/icons_assets_paths.dart';
import '../../cart/screens/cart_screen.dart';
import '../controllers/category_popular_details_controller.dart';

// ignore: must_be_immutable
class CategoryPopularDetailsScreen extends StatelessWidget {
  CategoryPopularDetailsScreen({super.key});

  final controller = Get.put(CategoryPopularDetailsController());

  String discriptionText =
      """Premium quality construction sand perfect for concrete mixing, masonry work, and general construction projects. Our Builder's Choice Sand is carefully screened and washed to ensure consistent quality...""";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Details',
        centerTitle: true,
        onLeadingPressed: () => Get.back(),
      ),

      body: SafeArea(
        child: Stack(
          children: [
            // Main content
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Column(
                children: [
                  _bannerSlider(controller: controller),
                  SizedBox(height: 5.h),
                  Container(
                    height: 370.h,
                    width: double.infinity.w,
                    color: AppColors.backgroundColor,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,

                        children: [
                          CustomText(
                            text: '''Builder's Choice Sand''',
                            color: AppColors.darkGreyColor,
                            fontWeight: FontWeight.w500,
                            fontSize: 20.sp,
                          ),
                          SizedBox(height: 8.h),

                          Row(
                            children: [
                              CustomText(
                                text: 'Price: ₦200/',
                                color: AppColors.darkGreyColor,
                                fontWeight: FontWeight.w500,
                                fontSize: 16.sp,
                              ),
                              CustomText(
                                text: 'Ton',
                                color: AppColors.lightGrey,
                                fontWeight: FontWeight.w500,
                                fontSize: 10.sp,
                              ),
                              Spacer(),
                              Container(
                                height: 25.h,
                                width: 70.w,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(4.r),
                                  ),
                                  color: AppColors.lightGreen,
                                ),

                                child: Center(
                                  child: CustomText(
                                    text: 'In Stock',
                                    color: AppColors.greenColor,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14.sp,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 8.h),
                          Row(
                            children: [
                              CircleAvatar(
                                radius: 10.r,
                                backgroundImage: AssetImage(
                                  IconsAssetsPaths.instance.buildmart_image,
                                ),
                              ),
                              SizedBox(width: 5.w),
                              CustomText(
                                text: 'BuildMart',
                                color: AppColors.darkGreyColor,
                                fontWeight: FontWeight.w500,
                                fontSize: 16.sp,
                              ),
                              Spacer(),
                              Icon(Icons.star, size: 16, color: Colors.amber),
                              SizedBox(width: 5.w),
                              GestureDetector(
                                onTap: () =>
                                    Get.to(() => UserItemReviewsScreen()),
                                child: CustomText(
                                  text: '5.0 (205 Reviews)',
                                  color: AppColors.lightGrey,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 16.sp,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 8.h),

                          Obx(
                            () => Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomText(
                                  text: 'Description',
                                  color: AppColors.blackColor,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 20.sp,
                                ),
                                SizedBox(height: 8.h),
                                CustomText(
                                  text: discriptionText,
                                  maxLines: controller.isExpanded.value
                                      ? null
                                      : 3,
                                  overflow: controller.isExpanded.value
                                      ? TextOverflow.visible
                                      : TextOverflow.ellipsis,
                                  color: AppColors.lightGrey,
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w400,
                                ),
                                // Read more / less
                                Align(
                                  alignment: Alignment.centerRight,
                                  child: InkWell(
                                    onTap: controller.toggle,
                                    child: Text(
                                      controller.isExpanded.value
                                          ? "Read Less"
                                          : "Read More",
                                      style: const TextStyle(
                                        color: Colors.blue,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),

                          SizedBox(height: 8.h),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomText(
                                text: 'Specifications',
                                color: AppColors.darkGreyColor,
                                fontWeight: FontWeight.w500,
                                fontSize: 16.sp,
                              ),
                              SizedBox(height: 8.h),

                              CustomText(
                                text: 'Grain Size: 0.1mm - 2mm',
                                color: AppColors.lightGrey,
                                fontWeight: FontWeight.w400,
                                fontSize: 16.sp,
                              ),
                              CustomText(
                                text: 'Moisture Content: <5%',
                                color: AppColors.lightGrey,
                                fontWeight: FontWeight.w400,
                                fontSize: 16.sp,
                              ),
                              CustomText(
                                text: 'Clay Content: <3%',
                                color: AppColors.lightGrey,
                                fontWeight: FontWeight.w400,
                                fontSize: 16.sp,
                              ),
                              CustomText(
                                text: 'Organic Matter: <0.5%',
                                color: AppColors.lightGrey,
                                fontWeight: FontWeight.w400,
                                fontSize: 16.sp,
                              ),
                            ],
                          ),

                          SizedBox(height: 8.h),
                          Row(
                            children: [
                              CustomText(
                                text: 'Reviews',
                                color: AppColors.darkGreyColor,
                                fontWeight: FontWeight.w500,
                                fontSize: 20.sp,
                              ),
                              Spacer(),
                              GestureDetector(
                                onTap: () {},
                                child: Row(
                                  children: [
                                    CustomText(
                                      text: 'See all',
                                      color: AppColors.lightGrey,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 14.sp,
                                    ),
                                    SizedBox(width: 5.w),
                                    Icon(
                                      Icons.arrow_forward_ios_outlined,
                                      size: 12,
                                      color: AppColors.lightGrey,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 300.h,
                            width: double.infinity.w,
                            child: _reviewsSection(controller: controller),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),

            _CustomButtonContainer(controller: controller),
          ],
        ),
      ),
    );
  }
}

Widget _bannerSlider({required CategoryPopularDetailsController controller}) {
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
        () => Row(
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

Widget _reviewsSection({required CategoryPopularDetailsController controller}) {
  return ListView.separated(
    separatorBuilder: (_, index) => SizedBox(height: 8.h),
    itemCount: controller.reviewsList.length,
    itemBuilder: (_, index) {
      final rivewsData = controller.reviewsList[index];
      return Container(
        width: 343.w,
        decoration: BoxDecoration(
          color: AppColors.whiteColor,
          borderRadius: BorderRadius.all(Radius.circular(8.r)),
        ),
        child: Padding(
          padding: EdgeInsets.all(8.0.r),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomText(
                    text: rivewsData.name,
                    color: AppColors.blackColor,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                  ),
                  CustomText(
                    text: rivewsData.days,
                    color: AppColors.lightGrey,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ],
              ),
              SizedBox(height: 8.h),
              RatingBar.builder(
                initialRating: rivewsData.rating.toDouble(),
                minRating: 1,
                direction: Axis.horizontal,
                allowHalfRating: false,
                itemCount: 5,
                itemSize: 12,
                itemPadding: EdgeInsets.symmetric(horizontal: 1.0),
                itemBuilder: (context, _) =>
                    Icon(Icons.star, color: Colors.amber),
                onRatingUpdate: (rating) {
                  print(rating);
                },
              ),
              SizedBox(height: 8.h),

              CustomText(
                text: rivewsData.title,
                color: AppColors.lightGrey,
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
              ),
            ],
          ),
        ),
      );
    },
    // list
  );
}

Widget _CustomButtonContainer({
  required CategoryPopularDetailsController controller,
}) {
  return Positioned(
    bottom: 0,
    left: 0,
    right: 0,
    child: Container(
      height: 140.h,
      color: AppColors.whiteColor,
      alignment: Alignment.center,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12.r, vertical: 12.r),
        child: Column(
          children: [
            Row(
              children: [
                CustomText(
                  text: 'Quantity (tons)',
                  color: AppColors.blackColor,
                  fontWeight: FontWeight.w500,
                  fontSize: 16.sp,
                ),
                Spacer(),
                Container(
                  height: 35.h,
                  width: 100.w,
                  decoration: BoxDecoration(
                    color: AppColors.lightGreen3,
                    borderRadius: BorderRadius.all(Radius.circular(20.r)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8, right: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () => controller.decrement(),

                          child: Container(
                            height: 24.h,
                            width: 24.w,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: AppColors.whiteColor,
                              borderRadius: BorderRadius.all(
                                Radius.circular(60.r),
                              ),
                            ),
                            child: Column(
                              children: [
                                Icon(
                                  Icons.minimize_outlined,
                                  color: AppColors.blackColor,
                                  size: 15.h,
                                ),
                                SizedBox(height: 8.h),
                              ],
                            ),
                          ),
                        ),

                        Obx(
                          () => CustomText(
                            text: controller.quantity.value.toString().padLeft(
                              2,
                              '0',
                            ),
                            color: AppColors.blackColor,
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        GestureDetector(
                          onTap: () => controller.increment(),
                          child: Container(
                            height: 24.h,
                            width: 24.w,
                            decoration: BoxDecoration(
                              color: AppColors.blackColor,
                              borderRadius: BorderRadius.all(
                                Radius.circular(60.r),
                              ),
                            ),
                            child: Center(
                              child: Icon(
                                Icons.add,
                                color: AppColors.whiteColor,
                                size: 15.h,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 24.h),

            CustomButton(
              onPressed: () {
                Get.to(() => CartScreen());
              },

              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    IconsAssetsPaths.instance.cart_image,
                    height: 24.h,
                  ),
                  SizedBox(width: 5.w),
                  CustomText(
                    text: 'Add to Cart - ₦200',
                    color: AppColors.whiteColor,
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
