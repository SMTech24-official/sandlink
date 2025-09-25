import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:sandlink/core/app_colors/app_colors.dart';
import 'package:sandlink/core/widgets/custom_button.dart';
import 'package:sandlink/core/wrappers/custom_text.dart';
import 'package:sandlink/features/user/join_affiliates/screen/steps_screen.dart';

import '../../../../core/config/constants/assets_paths/icons_assets_paths.dart';
import '../../../../core/widgets/custom_app_bar.dart';
import '../controllers/pricing_plan_controller.dart';

class PricingPlanScreen extends StatelessWidget {
   PricingPlanScreen({super.key});

   final controller = Get.put(PricingPlanController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Pricing Plan',
        centerTitle: true,
        onLeadingPressed: () => Get.back(),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Container(
            height: Get.height / 1,
            width: double.infinity.w,
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.lightGreyD1),
              borderRadius: BorderRadius.all(Radius.circular(8.r)),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Column(
                children: [
                 Container(
                   height: Get.height/7.2.h,
                   width: double.infinity.w,

                   child:  Padding(
                     padding: EdgeInsets.symmetric(vertical: 24.h),
                     child: Column(
                       children: [
                         CustomText(
                           text: 'Pricing Plan',
                           color: AppColors.blackColor,
                           fontSize: 18.sp,
                           fontWeight: FontWeight.w600,
                         ),
                         SizedBox(height: 8.h),
                         CustomText(
                           text: 'Find the Perfect Plan for Your Goals',
                           color: AppColors.lightGrey,
                           fontSize: 14.sp,
                           fontWeight: FontWeight.w500,
                         ),
                       ],
                     ),
                   ),
                 ),
                 Container(
                   height: Get.height/1.4,
                   width: double.infinity.w,

                   child: ListView.separated(
                     separatorBuilder: (_,index)=>SizedBox(height: 8.h,),
                     itemCount: controller.purchasePlanList.length,
                     itemBuilder: (_,index){
                       final items = controller.purchasePlanList[index];
                     return  Container(
                       height: 308.h,
                       width: double.infinity.w,
                       decoration: BoxDecoration(
                         border: Border.all(color: AppColors.lightGreyD1),
                         borderRadius: BorderRadius.all(Radius.circular(8.r)),
                       ),
                       child: Column(
                         children: [
                           SizedBox(height: 16.h),
                           Image.asset(
                             IconsAssetsPaths.instance.purches_icon,
                             height: 48.h,
                             width: 48.w,
                           ),
                           SizedBox(height: 12.h),
                           CustomText(
                             text: '${items.planType}',
                             color: AppColors.blackColor,
                             fontSize: 18.sp,
                             fontWeight: FontWeight.w500,
                           ),
                           SizedBox(height: 8.h),
                           CustomText(
                             textAlign: TextAlign.center,
                             text: items.planDetails,
                             color: AppColors.lightGrey,
                             fontSize: 14.sp,
                             fontWeight: FontWeight.w400,
                           ),
                           SizedBox(height: 12.h),
                           Container(
                             height: 45.h,
                             width: double.infinity.w,
                             child: Row(
                               mainAxisAlignment: MainAxisAlignment.center,
                               children: [
                                 CustomText(
                                   textAlign: TextAlign.center,
                                   text:
                                   '₦',
                                   color: AppColors.primaryColor,
                                   fontSize: 18.sp,
                                   fontWeight: FontWeight.w500,
                                 ),CustomText(
                                   textAlign: TextAlign.center,
                                   text:
                                   items.amount,
                                   color: AppColors.primaryColor,
                                   fontSize: 40.sp,
                                   fontWeight: FontWeight.w500,
                                 ),Align(

                                   alignment: Alignment.bottomRight,
                                   child: CustomText(
                                     textAlign: TextAlign.center,
                                     text:
                                     '/ ${items.packageType}',
                                     color: AppColors.primaryColor,
                                     fontSize: 16.sp,
                                     fontWeight: FontWeight.w500,
                                   ),
                                 ),
                               ],
                             ),
                           ),
                           SizedBox(height: 20.h),
                           Padding(
                             padding:  EdgeInsets.symmetric(horizontal: 20.w),
                             child: CustomButton(
                                 text: 'Purchase Plan',
                                 onPressed: (){
                                   if(items.planID==0){
                                     Get.to(()=>StepsScreen());
                                     print('click');
                                   }
                                   else if(items.planID ==1){}
                                   else if(items.planID ==3){}

                                 }),
                           )
                         ],
                       ),
                     );
                   },

                   ),
                 )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
