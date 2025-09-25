import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/app_colors/app_colors.dart';
import '../../../../../core/config/constants/assets_paths/icons_assets_paths.dart';
import '../../../../../core/wrappers/custom_text.dart';

class RiderReviewYourInformationScreen extends StatelessWidget {
  const RiderReviewYourInformationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                SizedBox(height: 50.h),
                Container(
                  width: double.infinity.w,
                  decoration: BoxDecoration(
                    border: Border.all(color: AppColors.lightGreyD1),
                    borderRadius: BorderRadius.all(Radius.circular(8.r)),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    child: Column(
                      children: [
                        SizedBox(height: 16.h),
                        CustomText(
                          text: 'Review Your Information',
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
                        SizedBox(height: 20.h),

                        Column(
                          children: [
                            _personalInformation(),
                            SizedBox(height: 16.h,),
                            _identityVerification(),
                            SizedBox(height: 16.h,),
                            _paymentVerification(),
                            SizedBox(height: 16.h,),
                            _allDocuments(),
                            SizedBox(height: 20.h),

                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 35.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget _personalInformation(){
  return Column(
    children: [
      Row(
        children: [
          Icon(Icons.person_2_outlined,size: 20,color: AppColors.blackColor,),
          SizedBox(width: 8.w,),
          CustomText(
            text: 'Personal Information',
            color: AppColors.blackColor,
            fontSize: 18.sp,
            fontWeight: FontWeight.w500,
          ),
        ],
      ),
      SizedBox(height: 8.h,),
      Container(
        width: double.infinity.w,
        decoration: BoxDecoration(
          border: Border.all(
            color: AppColors.lightGreyD1,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(8.r),
          ),
        ),
        child: Padding(
          padding:  EdgeInsets.symmetric(horizontal: 16.w,vertical: 10.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(
                text: 'Full Name',
                color: AppColors.lightGrey,
                fontSize: 12.sp,
                fontWeight: FontWeight.w500,
              ),
              SizedBox(height: 6.h),
              CustomText(
                text: 'Cameron Williamson',
                color: AppColors.blackColor,
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
              ),

              SizedBox(height: 12.h),
              CustomText(
                text: 'Phone Number',
                color: AppColors.lightGrey,
                fontSize: 12.sp,
                fontWeight: FontWeight.w500,
              ),
              SizedBox(height: 6.h),
              CustomText(
                text: '+880 IX XXX XXXXX',
                color: AppColors.blackColor,
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
              ),

              SizedBox(height: 12.h),
              CustomText(
                text: 'Email',
                color: AppColors.lightGrey,
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
              ),
              SizedBox(height: 6.h),
              CustomText(
                text: 'tim.jennings@example.com',
                color: AppColors.blackColor,
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
              ),
              SizedBox(height: 12.h),
            ],
          ),
        ),
      ),
    ],
  );
}


Widget _identityVerification(){
  return Column(
    children: [
      Row(
        children: [
          Image.asset(IconsAssetsPaths.instance.right_circle_icon,color: AppColors.blackColor,),
          SizedBox(width: 8.w,),
          CustomText(
            text: 'Identity Verification',
            color: AppColors.blackColor,
            fontSize: 18.sp,
            fontWeight: FontWeight.w500,
          ),
        ],
      ),
      SizedBox(height: 8.h,),
      Container(
        width: double.infinity.w,
        decoration: BoxDecoration(
          border: Border.all(
            color: AppColors.lightGreyD1,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(8.r),
          ),
        ),
        child: Padding(
          padding:  EdgeInsets.symmetric(horizontal: 16.w,vertical: 10.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Image.asset(IconsAssetsPaths.instance.gellary_icon,height: 24.h,width: 24.w,),

                  SizedBox(width: 5.w,),
                  CustomText(
                    text: 'National ID / Passport (Front)',
                    color: AppColors.blackColor,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ],
              ),
              SizedBox(height: 6.h),
              Row(
                children: [
                  Image.asset(IconsAssetsPaths.instance.gellary_icon,height: 24.h,width: 24.w,),

                  SizedBox(width: 5.w,),
                  CustomText(
                    text: 'National ID / Passport (Back)',
                    color: AppColors.blackColor,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ],
              ),
              SizedBox(height: 6.h),
              Row(
                children: [
                  Image.asset(IconsAssetsPaths.instance.pdf_icon,height: 24.h,width: 24.w,),

                  SizedBox(width: 5.w,),
                  CustomText(
                    text: 'Trade License',
                    color: AppColors.blackColor,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ],
              ),
              SizedBox(height: 6.h),
              Row(
                children: [
                  Image.asset(IconsAssetsPaths.instance.pdf_icon,height: 24.h,width: 24.w,),

                  SizedBox(width: 5.w,),
                  CustomText(
                    text: 'National ID / Passport (Back)',
                    color: AppColors.blackColor,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ],
              ),
              SizedBox(height: 6.h),



            ],
          ),
        ),
      ),
    ],
  );
}



Widget _paymentVerification(){
  return Column(
    children: [
      Row(
        children: [
          Image.asset(IconsAssetsPaths.instance.wallet,color: AppColors.blackColor,height: 20.h,width: 20.w,),
          SizedBox(width: 8.w,),
          CustomText(
            text: 'Payment Verification',
            color: AppColors.blackColor,
            fontSize: 18.sp,
            fontWeight: FontWeight.w500,
          ),
        ],
      ),
      SizedBox(height: 8.h,),
      Container(
        width: double.infinity.w,
        decoration: BoxDecoration(
          border: Border.all(
            color: AppColors.lightGreyD1,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(8.r),
          ),
        ),
        child: Padding(
          padding:  EdgeInsets.symmetric(horizontal: 16.w,vertical: 10.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Image.asset(IconsAssetsPaths.instance.strip_icon,height: 32.h,width: 32.w,fit: BoxFit.cover,),

                  SizedBox(width: 5.w,),
                  CustomText(
                    text: 'Stripe',
                    color: AppColors.blackColor,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ],
              ),

            ],
          ),
        ),
      ),
    ],
  );
}



Widget _allDocuments(){
  return Column(
    children: [

      Container(
        width: double.infinity.w,
        decoration: BoxDecoration(
          color: AppColors.whiteColor,
          borderRadius: BorderRadius.all(
            Radius.circular(8.r),
          ),
        ),
        child: Padding(
          padding:  EdgeInsets.symmetric(horizontal: 16.w,vertical: 10.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Image.asset(IconsAssetsPaths.instance.tick_circle_icon,height: 24.h,width: 24.w,fit: BoxFit.cover,),

                  SizedBox(width: 10.w,),
                  CustomText(
                    maxLines: 2,
                    text: 'All documents are ready for\nverification',
                    color: AppColors.greenColor,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ],
              ),
              SizedBox(height: 12.w,),
              CustomText(
                maxLines: 5,
                text: '''Once submitted, you won't be able to make changes to your documents. Our team will review them within 24-48 hours.''',
                color: AppColors.lightGrey,
                fontSize: 13.sp,
                fontWeight: FontWeight.w500,
              ),
            ],
          ),
        ),
      ),
    ],
  );
}
