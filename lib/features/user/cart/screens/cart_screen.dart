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
      appBar: CustomAppBar(
        title: 'Cart',
        centerTitle: true,
      ),

      body: SafeArea(
        child: Column(
          children: [
           // final code.................................
            Obx(() {
              if (controller.allCartModel.isEmpty) {
                return Center(child: Text('Cart is empty'));
              }
              return SizedBox(
                height: Get.height / 1.3.h,
                child: ListView.separated(
                  separatorBuilder: (_, index) => SizedBox(height: 8.h),
                  itemCount: controller.allCartModel.length,
                  itemBuilder: (_, index) {
                    final item = controller.allCartModel[index];
                    return Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.r),
                      child: Card(
                        color: Colors.transparent,
                        elevation: 1,
                        child: Container(
                          height: 121.h,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: AppColors.whiteColor,
                            borderRadius: BorderRadius.circular(8.r),
                          ),
                          child: Padding(
                            padding: EdgeInsets.only(
                              top: 8,
                              bottom: 8,
                              right: 8,
                            ),
                            child: Row(
                              children: [
                                Obx(
                                  () => Checkbox(
                                    activeColor: AppColors.primaryColor,
                                    value: controller.selectedItems[index],
                                    onChanged: (val) =>
                                        controller.toggleSelection(index),
                                  ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Container(
                                    height: 105.h,
                                    width: 105.w,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: NetworkImage(item.product?.image ?? ""),
                                        fit: BoxFit.cover,
                                      ),
                                      borderRadius: BorderRadius.circular(8.r),
                                    ),
                                  ),
                                ),
                                SizedBox(width: 16.w),
                                Expanded(
                                  flex: 2,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      CustomText(
                                        text: item.product?.name ?? '',
                                        color: AppColors.blackColor,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 14.sp,
                                      ),
                                      SizedBox(height: 8.h),
                                      CustomText(
                                        text: item.product?.seller?.shopName ?? "",
                                        color: AppColors.blackColor,
                                        fontWeight: FontWeight.w400,
                                        fontSize: 14.sp,
                                      ),
                                      SizedBox(height: 12.h),
                                      Row(
                                        children: [
                                          CustomText(
                                            text: '₦${item.product?.price ?? ""}/ Ton ',
                                            color: AppColors.blackColor,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 16.sp,
                                          ),
                                          Flexible(
                                            child: Container(
                                              padding: EdgeInsets.all(4),
                                              decoration: BoxDecoration(
                                                color: AppColors.lightGreen3,
                                                borderRadius:
                                                    BorderRadius.circular(20.r),
                                              ),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  GestureDetector(
                                                    onTap: () => controller
                                                        .decrement(index),
                                                    child: Container(
                                                      height: 24.h,
                                                      width: 24.w,
                                                      alignment:
                                                          Alignment.center,
                                                      decoration: BoxDecoration(
                                                        color: AppColors
                                                            .whiteColor,
                                                        borderRadius:
                                                            BorderRadius.circular(
                                                              60.r,
                                                            ),
                                                      ),
                                                      child: Icon(
                                                        Icons.remove,
                                                        color: AppColors
                                                            .blackColor,
                                                        size: 15.h,
                                                      ),
                                                    ),
                                                  ),
                                                  Obx(
                                                    () => CustomText(
                                                      text: controller
                                                          .quantities[index]
                                                          .toString()
                                                          .padLeft(2, '0'),
                                                      color:
                                                          AppColors.blackColor,
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                    ),
                                                  ),
                                                  GestureDetector(
                                                    onTap: () => controller
                                                        .increment(index),
                                                    child: Container(
                                                      height: 24.h,
                                                      width: 24.w,
                                                      decoration: BoxDecoration(
                                                        color: AppColors
                                                            .blackColor,
                                                        borderRadius:
                                                            BorderRadius.circular(
                                                              60.r,
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
                                    onTap: () {
                                      final id = item.id;
                                      controller.deleteCart(id ?? "");
                                    },
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
              );
            }),
            
          

            
            _customCheckOutButton(),
          ],
        ),
      ),
      // bottomNavigationBar: Padding(
      //   padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
      //   child: _customCheckOutButton(),
      // ),
    );
  }
}

Widget _customCheckOutButton() {
  return CustomButton(
    onPressed: () => Get.to(() => CheckoutScreen()),
    text: "Checkout",
  );
}
