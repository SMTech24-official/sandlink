import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/app_colors/app_colors.dart';
import '../../../../../core/config/constants/assets_paths/icons_assets_paths.dart';
import '../../../../../core/widgets/custom_text_field.dart';
import '../../../../../core/wrappers/custom_text.dart';

class RiderPaymentNformationScreen extends StatelessWidget {
  const RiderPaymentNformationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.backgroundColor,
        body:  SafeArea(
            child: Padding(
              padding:  EdgeInsets.symmetric(horizontal: 16.w),
              child: SingleChildScrollView(

                scrollDirection: Axis.vertical,
                child: Column(
                  children: [
                    SizedBox(height: 50.h,),
                    Container(

                      width: double.infinity.w,
                      decoration: BoxDecoration(
                        border: Border.all(color: AppColors.lightGreyD1),
                        borderRadius: BorderRadius.all(Radius.circular(8.r)),
                      ),
                      child: Padding(
                        padding:  EdgeInsets.symmetric(horizontal: 16.w),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 16.h,),
                           Center(
                             child: Column(
                               children: [
                                 CustomText(
                                   text: 'Payment Information',
                                   color: AppColors.blackColor,
                                   fontSize: 18.sp,
                                   fontWeight: FontWeight.w600,
                                 ),
                                 SizedBox(height: 8.h),
                                 CustomText(
                                   text: 'Setup your payment method for withdrawals',
                                   color: AppColors.lightGrey,
                                   fontSize: 14.sp,
                                   fontWeight: FontWeight.w500,
                                 ),
                                 SizedBox(height: 20.h,),
                               ],
                             ),
                           ),
                            CustomText(
                              text: 'Identity Verification',
                              color: AppColors.blackColor,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
                            ),
                            SizedBox(height: 8.h),
                            Container(
                              height: 100.h,
                              width: double.infinity.w,
                              decoration: BoxDecoration(
                                color: AppColors.blueColor49.withOpacity(0.2),
                                borderRadius: BorderRadius.all(Radius.circular(8.r)),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,

                                children: [
                                Image.asset(IconsAssetsPaths.instance.wallet),
                                  SizedBox(height: 8.h,),
                                  CustomText(
                                    text: 'Stripe',
                                    color: AppColors.blackColor,
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  SizedBox(height: 8.h,),
                                  CustomText(
                                    text: 'Global psyrnzrts',
                                    color: AppColors.lightGrey,
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 12.h),

                            CustomInputField(
                              headerTitle: "Stripe Account ID *",
                              headerfontSize: 14.sp,
                              hintTextFontWeight: FontWeight.w500,
                              headerTextColor: AppColors.blackColor,
                           //   textController: controller.otpController,
                              hintText: 'acct xxxx>xxxxxxxxxxxxx',
                              keyboardType: TextInputType.number,
                            ),
                            SizedBox(height: 8.h),


                            SizedBox(height: 12.h),
                            Container(

                              width: double.infinity.w,
                              decoration: BoxDecoration(
                                color: AppColors.blueColor49.withOpacity(0.2),
                                borderRadius: BorderRadius.all(Radius.circular(8.r)),
                              ),
                              child: Padding(
                                padding:  EdgeInsets.symmetric(horizontal: 16.w,vertical: 14.h),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,

                                  children: [

                                    SizedBox(height: 8.h,),
                                    CustomText(
                                      text: 'Payment Information',
                                      color: AppColors.blackColor,
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w500,
                                    ),
                                    SizedBox(height:10.h,),
                                    CustomText(
                                      textAlign: TextAlign.center,
                                      text: 'This information will be used to transfer your earnings, Make sure the details are accurate.',
                                      color: AppColors.lightGrey,
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ],
                                ),
                              ),
                            ),

                            SizedBox(height: 35.h,),


                          ],
                        ),
                      ),
                    ),


                  ],),
              ),
            ))
    );
  }
}
