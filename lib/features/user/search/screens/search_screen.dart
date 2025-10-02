import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sandlink/core/app_colors/app_colors.dart';
import 'package:sandlink/core/widgets/custom_app_bar.dart';
import 'package:sandlink/core/widgets/custom_text_field.dart';
import 'package:get/get.dart';
import 'package:sandlink/core/wrappers/custom_text.dart';
import 'package:sandlink/features/user/search/controller/search_controller.dart';


class SearchScreen extends StatelessWidget {
  SearchScreen({super.key});

  final controller = Get.put(SearchingController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Search'),
      body: Padding(
        padding: EdgeInsets.all(20.w),
        child: Column(
          children: [
            CustomInputField(
              hintText: 'Search here...',
              prefixIcon: Icons.search_outlined,
              onChanged: (value) {
                controller.search.value = value;
              },
            ),
            SizedBox(height: 10.h),
            Expanded(
              child: Obx(() {
                final products = controller.filteredProducts;
                
                if (products.isEmpty) {
                  return Center(
                    child: Text(
                      controller.search.isEmpty 
                          ? "No products available" 
                          : "No products found for '${controller.search.value}'",
                    ),
                  );
                }
                
                return GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisExtent: 200.h,
                    crossAxisSpacing: 4,
                    mainAxisSpacing: 4,
                  ),
                  itemCount: products.length,
                  itemBuilder: (_, index) {
                    final product = products[index];
                    return Padding(
                      padding: EdgeInsets.all(8.0.r),
                      child: Card(
                        elevation: 1,
                        child: Container(
                          decoration: BoxDecoration(
                            color: AppColors.whiteColor,
                            borderRadius: BorderRadius.circular(8.r),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                height: 120.h,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8.r),
                                  image: DecorationImage(
                                    image: NetworkImage(product.image),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              SizedBox(height: 5.h),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 8.w),
                                child: CustomText(
                                  text: product.name,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              SizedBox(height: 5.h),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 10.w),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Icon(Icons.star,color: Color(0xffFFC107),size: 20),
                                    SizedBox(width: 6.w),
                                    CustomText(text: '5.0',),
                                    Spacer(),
                                    CustomText(
                                      text: '₦${product.price}/',
                                      fontSize: 14.spMin,
                                      fontWeight: FontWeight.w600,
                                    ),
                                    CustomText(
                                      text: 'Ton',
                                      fontSize: 12.spMin,
                                      color: AppColors.lightGrey,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}