import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sandlink/core/app_colors/app_colors.dart';
import 'package:sandlink/core/widgets/custom_app_bar.dart';
import 'package:sandlink/core/wrappers/custom_text.dart';
import 'package:sandlink/features/user/category/controller/category_controller.dart';
import 'package:sandlink/features/user/category_popular_list/controllers/product_details_controller.dart';
import 'package:sandlink/features/user/category_popular_list/screens/product_details_screen.dart';

class CategoryScreen extends StatelessWidget {
  CategoryScreen({super.key, required this.appbarTitle, required this.id}) {
    Get.put(CategoryController()).fatchcategoryProducts(id);
  }

  final detailscontroller = Get.put(ProductDetailsController());
  final controller = Get.put(CategoryController());
  final String appbarTitle;
  final String id;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: appbarTitle,
        onLeadingPressed: () => Get.back(),
      ),
      body: SafeArea(
        child: Obx(() {
          if (controller.getAllProduct.isEmpty) {
            return const Center(child: Text("No Products Found"));
          }

          return GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisExtent: 200.h,
              crossAxisSpacing: 4,
              mainAxisSpacing: 4,
            ),
            itemCount: controller.getAllProduct.length,
            itemBuilder: (_, index) {
              final itemdata = controller.getAllProduct[index];

              return Padding(
                padding: EdgeInsets.all(8.0.r),
                child: GestureDetector(
                  onTap: () async {
                    final productId = itemdata.id;
                    await detailscontroller.getProductdetails(productId);
                    Get.to(() => ProductDetailsScreen());
                  },
                  child: Card(
                    elevation: 1,
                    color: Colors.white10,
                    child: Container(
                      width: double.infinity.w,
                      decoration: BoxDecoration(
                        color: AppColors.whiteColor,
                        borderRadius: BorderRadius.all(Radius.circular(8.r)),
                      ),
                      child: Column(
                        children: [
                          Container(
                            height: 120.h,
                            width: 148.w,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.circular(8.r),
                              ),
                              image: DecorationImage(
                                image: NetworkImage(itemdata.image),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          SizedBox(height: 5.h),
                          CustomText(text: itemdata.name, maxLines: 1),
                          SizedBox(height: 5.h),
                          Padding(
                            padding: EdgeInsets.only(left: 10.w, right: 10.w),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Icon(
                                      Icons.star,
                                      color: Colors.amber,
                                      size: 12,
                                    ),
                                    SizedBox(width: 3.h),
                                    CustomText(
                                      text:
                                          '${itemdata.averageRating} (${itemdata.totalReviews})',
                                      fontWeight: FontWeight.w400,
                                      color: AppColors.lightGrey,
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    CustomText(
                                      text: '₦${itemdata.price}',
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
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          );
        }),
      ),
    );
  }
}
