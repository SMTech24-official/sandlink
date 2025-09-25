import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:sandlink/core/app_colors/app_colors.dart';
import 'package:sandlink/core/config/constants/assets_paths/icons_assets_paths.dart';
import 'package:sandlink/core/widgets/custom_app_bar.dart';
import 'package:sandlink/core/widgets/custom_button.dart';
import 'package:sandlink/core/widgets/custom_text_field.dart';
import 'package:sandlink/core/wrappers/custom_text.dart';

import '../controller/rider_earnings_controller.dart';

class RiderEarningsScreen extends StatelessWidget {
  RiderEarningsScreen({super.key});

  final controller = Get.put(RiderEarningController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: CustomAppBar(
        title: 'Earnings',
        centerTitle: true,
        onLeadingPressed: () => Get.back(),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                Container(
                  height: 265.h,
                  width: double.infinity.w,
                  decoration: BoxDecoration(
                    color: AppColors.whiteColor,
                    borderRadius: BorderRadius.all(Radius.circular(8.r)),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: 10.w, vertical: 16.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText(text: 'Earnings Overview',
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                          color: AppColors.primaryColor,),
                        Obx(() => Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: List.generate(controller.amounts.length, (index) {
                            return GestureDetector(
                              onTap: () {
                                controller.selectedIndex.value = index;
                              },
                              child: Container(
                                height: 80.h,
                                width: 80.w,
                                margin: EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  color: controller.selectedIndex.value == index
                                      ? AppColors.blueColorF7
                                      : AppColors.whiteColor,
                                  border: Border.all(
                                    color: controller.selectedIndex.value == index
                                        ? AppColors.greenColor
                                        : AppColors.lightGreyD1,
                                    width: 2.w,
                                  ),
                                  borderRadius: BorderRadius.circular(4),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    CustomText(
                                      text: controller.overviewTypes[index],
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                      color: AppColors.blackColor,
                                    ),
                                    CustomText(
                                      text: '${controller.amounts[index]}',
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                      color: AppColors.blackColor,
                                    ),
                                  ],
                                ),
                              ),
                            );
                          }),
                        )),

                        SizedBox(height: 20.h),
                        Divider(
                          height: 2,
                          indent: 8,
                          endIndent: 8,
                          thickness: 2,
                          color: AppColors.lightGreyD1,
                        ),
                        // show selected amount
                        SizedBox(height: 20.h),
                        Center(
                          child: Obx(() =>
                          controller.selectedIndex.value != -1
                              ? CustomText(text:" ${controller.overviewTypes[controller.selectedIndex.value]}",fontWeight:FontWeight.w500,fontSize: 14.sp,color: AppColors.blackColor,)
                              : const Text(" ")),
                        ), Center(
                          child: Obx(() =>
                          controller.selectedIndex.value != -1
                              ? CustomText(text:"${controller.amounts[controller.selectedIndex.value]}",fontWeight:FontWeight.w500,fontSize: 32.sp,color: AppColors.blackColor,)
                              : const Text("")),
                        ),

                      ],
                    ),
                  ),


                ),
                    SizedBox(height: 10.h,),
                _withdrawFunds(controller: controller),
                SizedBox(height: 12.h,),
                _paymentMethods(controller: controller),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


Widget _withdrawFunds({required RiderEarningController controller}){
  return Container(

    width: double.infinity.w,
    decoration: BoxDecoration(
      color: AppColors.whiteColor,
      borderRadius: BorderRadius.all(Radius.circular(8.r)),
    ),
    child: Padding(
      padding:  EdgeInsets.symmetric(horizontal: 12.w,vertical: 12.h),
      child: Column(
        children: [
          CustomInputField(
            textController: controller.withdrawController,
              borderSide: BorderSide(
                color: AppColors.lightGreyD1,
                width: 1.w
              ),
              hintText: 'Enter amount'),
          SizedBox(height: 12.h,),
          CustomButton(
              text: 'Withdraw Funds',
              onPressed: (){})
        ],
      ),
    ),
  );
}


Widget _paymentMethods({required RiderEarningController controller}){
  return Container(

    width: double.infinity.w,
    decoration: BoxDecoration(
      color: AppColors.whiteColor,
      borderRadius: BorderRadius.all(Radius.circular(8.r)),
    ),
    child: Padding(
      padding:  EdgeInsets.symmetric(horizontal: 12.w,vertical: 12.h),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomText(text: 'Payment Methods',fontSize: 18.sp,fontWeight: FontWeight.w600,color: AppColors.blackColor,),
              CustomButton(
                width: 73.w,
                height: 5.h,
                backgroundColor: AppColors.whiteColor,
                borderSide: BorderSide(
                  color: AppColors.lightGreyD1,
                  width: 1.w,
                ),
                onPressed: (){},text: '+ Add',fontWeight: FontWeight.w500,fontSize: 14.sp,textColor: AppColors.blackColor,)
            ],
          ),
          SizedBox(height: 16.h,),
          Container(
            height: 67.h,
            width: double.infinity.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(8.r)),
              color: AppColors.blueColorF7,
            ),
            child: Padding(
              padding:  EdgeInsets.symmetric(horizontal: 12.w),
              child: Row(
                children: [
                  Image.asset(IconsAssetsPaths.instance.wallet,color: AppColors.blackColor,height: 24.h,width: 26.w,),
                  SizedBox(width: 8.w,),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 10.h,),
                      CustomText(text: 'GTBank*****1234',fontSize: 14.sp,fontWeight: FontWeight.w500,color: AppColors.blackColor,),
                      CustomText(text: 'Savings Account',fontSize: 12.sp,fontWeight: FontWeight.w500,color: AppColors.lightGrey,)
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    ),
  );
}