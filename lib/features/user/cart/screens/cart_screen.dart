import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sandlink/core/app_colors/app_colors.dart';
import 'package:sandlink/core/widgets/custom_app_bar.dart';
import 'package:sandlink/core/widgets/custom_button.dart';
import 'package:sandlink/core/wrappers/custom_text.dart';

import '../../checkout/screen/checkout_screen.dart';
import '../controllers/cart_controller.dart';

class CartScreen extends StatelessWidget {
  CartScreen({super.key});

  final controller = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: CustomAppBar(
        title: 'Cart',
        centerTitle: true,
        onLeadingPressed: () => Get.back(),
      ),

      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              child: ListView.separated(
                separatorBuilder: (_, index) => SizedBox(height: 8.h),
                itemCount: 10,
                itemBuilder: (_, index) {
                  return Padding(
                    padding: EdgeInsets.only(left: 16, right: 16).r,
                    child: Card(
                      color: Colors.transparent,
                      elevation: 1,
                      child: Container(
                        height: 121.h,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: AppColors.whiteColor,
                          borderRadius: BorderRadius.all(
                            Radius.circular(8.0.r),
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(8.0.r),
                          child: Row(
                            children: [
                              Expanded(
                                flex: 1,
                                child: Container(
                                  height: 105.h,
                                  width: 105.w,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: NetworkImage(
                                        'https://www.figma.com/file/jNz7l61vmikt0kYyCBqz6X/image/7fb4ff2ac9294f42624fecf54617a99c024f8170',
                                      ),
                                      fit: BoxFit.cover,
                                    ),
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(8.0.r),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(width: 16.w),
                              Expanded(
                                flex: 2,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    CustomText(
                                      text: 'Builder’s Choice Sand',
                                      color: AppColors.blackColor,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 14.sp,
                                    ),
                                    SizedBox(height: 8.h),

                                    CustomText(
                                      text: 'BuildMart',
                                      color: AppColors.blackColor,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 14.sp,
                                    ),
                                    SizedBox(height: 12.h),
                                    Row(
                                      children: [
                                        CustomText(
                                          text: '₦200/ ',
                                          color: AppColors.blackColor,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 16.sp,
                                        ),
                                        CustomText(
                                          text: 'Ton',
                                          color: AppColors.lightGrey,
                                          fontWeight: FontWeight.w400,
                                          fontSize: 14.sp,
                                        ),
                                        SizedBox(width: 10.w),
                                        Container(
                                          height: 35.h,
                                          width: 100.w,
                                          decoration: BoxDecoration(
                                            color: AppColors.lightGreen3,
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(20.r),
                                            ),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                              left: 8,
                                              right: 8,
                                            ),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                GestureDetector(
                                                  onTap: () =>
                                                      controller.decrement(),

                                                  child: Container(
                                                    height: 24.h,
                                                    width: 24.w,
                                                    alignment: Alignment.center,
                                                    decoration: BoxDecoration(
                                                      color:
                                                          AppColors.whiteColor,
                                                      borderRadius:
                                                          BorderRadius.all(
                                                            Radius.circular(
                                                              60.r,
                                                            ),
                                                          ),
                                                    ),
                                                    child: Column(
                                                      children: [
                                                        Icon(
                                                          Icons
                                                              .minimize_outlined,
                                                          color: AppColors
                                                              .blackColor,
                                                          size: 15.h,
                                                        ),
                                                        SizedBox(height: 8.h),
                                                      ],
                                                    ),
                                                  ),
                                                ),

                                                Obx(
                                                  () => CustomText(
                                                    text: controller
                                                        .quantity
                                                        .value
                                                        .toString()
                                                        .padLeft(2, '0'),
                                                    color: AppColors.blackColor,
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ),
                                                GestureDetector(
                                                  onTap: () =>
                                                      controller.increment(),
                                                  child: Container(
                                                    height: 24.h,
                                                    width: 24.w,
                                                    decoration: BoxDecoration(
                                                      color:
                                                          AppColors.blackColor,
                                                      borderRadius:
                                                          BorderRadius.all(
                                                            Radius.circular(
                                                              60.r,
                                                            ),
                                                          ),
                                                    ),
                                                    child: Center(
                                                      child: Icon(
                                                        Icons.add,
                                                        color: AppColors
                                                            .whiteColor,
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
                                  ],
                                ),
                              ),
                              Align(
                                alignment: Alignment.topRight,
                                child: GestureDetector(
                                  onTap: () {},
                                  child: Icon(
                                    Icons.close,
                                    size: 16.h,
                                    color: AppColors.lightGreyC3,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
        child: _customCheckOutButton(),
      ),
    );
  }
}

Widget _customCheckOutButton() {
  return CustomButton(
    onPressed: () => Get.to(() => CheckoutScreen()),
    text: "Checkout",
  );
}
