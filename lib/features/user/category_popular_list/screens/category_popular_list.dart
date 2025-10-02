import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sandlink/core/app_colors/app_colors.dart';
import 'package:sandlink/core/wrappers/custom_text.dart';
import 'package:sandlink/features/user/home/controllers/user_home_controller.dart';

import '../../../../core/widgets/custom_app_bar.dart';
import '../controllers/category_popular_list_controller.dart';

class CategoryPopularScreen extends StatelessWidget {
  CategoryPopularScreen({super.key, required this.appbarTitle});

  final String appbarTitle;

  final controller = Get.put(CategoryPopularListController());
  final homecontroller = Get.put(UserHomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: appbarTitle,
        onLeadingPressed: () => Get.back(),
      ),

      body: SafeArea(
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisExtent: 200.h,
            crossAxisSpacing: 4,
            mainAxisSpacing: 4,
          ),
          itemCount: homecontroller.mostPopularProductList.length,
          itemBuilder: (_, index) {
            final itemdata = homecontroller.mostPopularProductList[index];

            return Padding(
              padding: EdgeInsets.all(8.0.r),
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
                          color: Colors.amber,
                          borderRadius: BorderRadius.all(Radius.circular(8.r)),
                          image: DecorationImage(
                            image: NetworkImage(itemdata.image ?? ''),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      SizedBox(height: 5.h),
                      CustomText(text: itemdata.name ?? '', maxLines: 1),
                      SizedBox(height: 5.h),

                      Padding(
                        padding: EdgeInsets.only(left: 10.w),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.star,
                                    color: Colors.amber,
                                    size: 12,
                                  ),
                                  SizedBox(width: 3.h),
                                  CustomText(
                                    text: "${itemdata.count?.reviews ?? 0}",
                                    fontWeight: FontWeight.w400,
                                    color: AppColors.lightGrey,
                                  ),
                                ],
                              ),
                            ),

                            Expanded(
                              child: Row(
                                children: [
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
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
