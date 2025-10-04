import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../core/app_colors/app_colors.dart';
import '../../../../core/config/constants/assets_paths/icons_assets_paths.dart';
import '../../../../core/widgets/custom_app_bar.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../../core/wrappers/custom_text.dart';
import '../controllers/product_details_controller.dart';

class ProductDetailsScreen extends StatelessWidget {
  ProductDetailsScreen({super.key});
  final controller = Get.put(ProductDetailsController());

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
                            text:
                                controller
                                    .productdetails
                                    .value
                                    ?.seller
                                    ?.shopName ??
                                'Seller',
                            color: AppColors.darkGreyColor,
                            fontWeight: FontWeight.w500,
                            fontSize: 16.sp,
                          ),
                          const Spacer(),
                          Icon(Icons.star, size: 16, color: Colors.amber),
                          SizedBox(width: 5.w),
                          SizedBox(width: 5.w),
                          CustomText(
                            text:
                                '${controller.productdetails.value?.averageRating ?? 0} (${controller.productdetails.value?.totalReviews ?? 0} Reviews)',
                            color: AppColors.lightGrey,
                            fontWeight: FontWeight.w400,
                            fontSize: 16.sp,
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

Widget _bannerSlider({required ProductDetailsController controller}) {
  final product = controller.productdetails.value;
  if (product == null) return const SizedBox();

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

Widget _reviewsSection({required ProductDetailsController controller}) {
  final reviews = controller.reviewsList;

  if (reviews.isEmpty) {
    return Center(
      child: CustomText(
        text: 'No Reviews Yet',
        color: AppColors.lightGrey,
        fontSize: 16.sp,
        fontWeight: FontWeight.w400,
      ),
    );
  }

  return ListView.separated(
    separatorBuilder: (_, index) => SizedBox(height: 8.h),
    itemCount: reviews.length,
    itemBuilder: (_, index) {
      final review = reviews[index];

      // calculate days ago
      String daysAgo = '';
      if (review.createdAt != null) {
        final difference = DateTime.now().difference(review.createdAt!);
        daysAgo = difference.inDays == 0
            ? 'Today'
            : '${difference.inDays} day${difference.inDays > 1 ? 's' : ''} ago';
      }

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
                    text: review.user?.name ?? 'Anonymous',
                    color: AppColors.blackColor,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                  ),
                  CustomText(
                    text: daysAgo,
                    color: AppColors.lightGrey,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ],
              ),
              SizedBox(height: 8.h),
              RatingBar.builder(
                initialRating: (review.rating ?? 0).toDouble(),
                minRating: 1,
                direction: Axis.horizontal,
                allowHalfRating: false,
                itemCount: 5,
                itemSize: 12,
                itemPadding: EdgeInsets.symmetric(horizontal: 1.0),
                itemBuilder: (context, _) =>
                    Icon(Icons.star, color: Colors.amber),
                onRatingUpdate: (rating) {},
              ),
              SizedBox(height: 8.h),
              CustomText(
                text: review.comment ?? '',
                color: AppColors.lightGrey,
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
              ),
            ],
          ),
        ),
      );
    },
  );
}

Widget _customButtonContainer({required ProductDetailsController controller}) {
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
