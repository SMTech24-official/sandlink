import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sandlink/features/user/home/model/most_populer_product.dart';
import '../../../../core/app_colors/app_colors.dart';
import '../../../../core/config/constants/assets_paths/icons_assets_paths.dart';
import '../../../../core/widgets/custom_app_bar.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../../core/wrappers/custom_text.dart';
import '../../my_orders/screen/user_item_reviews.dart';
import '../controllers/category_popular_details_controller.dart';

class CategoryPopularDetailsScreen extends StatelessWidget {
  CategoryPopularDetailsScreen({super.key});
  final controller = Get.put(CategoryPopularDetailsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Details',
        centerTitle: true,
        onLeadingPressed: () => Get.back(),
      ),
      body: Obx(() {
        final product = controller.productdetails.value;

        if (product == null) {
          return const Center(child: CircularProgressIndicator());
        }

        return SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  _bannerSlider(controller: controller),
                  SizedBox(height: 5.h),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(
                        text: product.name ?? '',
                        color: AppColors.darkGreyColor,
                        fontWeight: FontWeight.w500,
                        fontSize: 20.sp,
                      ),
                      SizedBox(height: 8.h),
                      Row(
                        children: [
                          CustomText(
                            text: '₦ ${product.price}',
                            fontSize: 16.spMin,
                            fontWeight: FontWeight.w600,
                          ),
                          4.horizontalSpace,
                          CustomText(
                            text: 'Ton',
                            fontSize: 14.spMin,
                            color: AppColors.lightGrey,
                          ),
                          const Spacer(),
                          Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 5.h,
                              vertical: 5.r,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4.r),
                              color: AppColors.lightGreen,
                            ),
                            child: CustomText(
                              text: product.status ?? '',
                              color: AppColors.greenColor,
                              fontWeight: FontWeight.w400,
                              fontSize: 14.sp,
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
                              IconsAssetsPaths.instance.buildmartimage,
                            ),
                          ),
                          SizedBox(width: 5.w),
                          CustomText(
                            text: 'BuildMart',
                            color: AppColors.darkGreyColor,
                            fontWeight: FontWeight.w500,
                            fontSize: 16.sp,
                          ),
                          const Spacer(),
                          Icon(Icons.star, size: 16, color: Colors.amber),
                          SizedBox(width: 5.w),
                          GestureDetector(
                            onTap: () => Get.to(() => UserItemReviewsScreen()),
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

                      CustomText(
                        text: 'Description',
                        color: AppColors.blackColor,
                        fontWeight: FontWeight.w500,
                        fontSize: 20.sp,
                      ),
                      SizedBox(height: 8.h),
                      CustomText(
                        text: product.description ?? '',
                        color: AppColors.lightGrey,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w400,
                      ),
                      SizedBox(height: 8.h),

                      CustomText(
                        text: 'Specifications',
                        color: AppColors.darkGreyColor,
                        fontWeight: FontWeight.w500,
                        fontSize: 16.sp,
                      ),
                      SizedBox(height: 8.h),
                      CustomText(
                        text: product.specification ?? '',
                        color: AppColors.lightGrey,
                        fontWeight: FontWeight.w400,
                        fontSize: 16.sp,
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
                        ],
                      ),
                      SizedBox(
                        height: 300.h,
                        width: double.infinity,
                        child: _reviewsSection(controller: controller),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      }),
      bottomNavigationBar: _customButtonContainer(controller: controller),
    );
  }
}

Widget _bannerSlider({required CategoryPopularDetailsController controller}) {
  final product = controller.productdetails.value;
  if (product == null) return const SizedBox();

  // যদি product.image একটি String হয়
  final images = [product.image].whereType<String>().toList();

  return Column(
    children: [
      ClipRRect(
        borderRadius: BorderRadius.circular(12.r),
        child: SizedBox(
          height: Get.width * 0.45,
          width: double.infinity,
          child: CarouselSlider.builder(
            itemCount: images.length,
            itemBuilder: (context, index, realIndex) {
              return Image.network(
                images[index],
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
          children: List.generate(images.length, (index) {
            return AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              margin: EdgeInsets.symmetric(horizontal: 4.w),
              height: 8.h,
              width: controller.currentPage.value == index ? 24.w : 8.w,
              decoration: BoxDecoration(
                color: controller.currentPage.value == index
                    ? AppColors.primaryColor
                    : AppColors.primaryColor.withOpacity(0.3),
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
                  if (kDebugMode) {
                    print(rating);
                  }
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

Widget _customButtonContainer({
  required CategoryPopularDetailsController controller,
}) {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 12.h, vertical: 20.r),
    child: CustomButton(
      onPressed: () {
        final productid = controller.productdetails.value?.id.toString();
        controller.addtocard(productid.toString());
      },

      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(IconsAssetsPaths.instance.cartimage, height: 24.h),
          SizedBox(width: 5.w),
          CustomText(
            text: 'Add to Cart',
            color: AppColors.whiteColor,
            fontSize: 18.sp,
            fontWeight: FontWeight.w500,
          ),
        ],
      ),
    ),
  );
}
