import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:sandlink/core/app_colors/app_colors.dart';
import 'package:sandlink/core/config/constants/assets_paths/icons_assets_paths.dart';
import 'package:sandlink/core/widgets/custom_app_bar.dart';
import 'package:sandlink/core/widgets/custom_button.dart';
import 'package:sandlink/core/wrappers/custom_text.dart';

import '../../../../core/config/constants/assets_paths/svg_assets_paths.dart';
import '../../payment/screen/payment_screen.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: CustomAppBar(
        title: 'Checkout',
        centerTitle: true,
        onLeadingPressed: ()=>Get.back(),
      ),
      body: SafeArea(
          child: Center(
            child: Padding(
              padding:  EdgeInsets.symmetric(horizontal: 16.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        _orderInfo(),
                        SizedBox(height: 10.h,),
                        CustomText(text: 'Delivery Address',color: AppColors.blackColor,fontSize: 20.sp,fontWeight: FontWeight.w500,),

                        SizedBox(
                     height: Get.height/2.1,
                     width: double.infinity,

                     child: SingleChildScrollView(
                       scrollDirection: Axis.vertical,
                       child: _deliveryAddress(),
                     ),
                   ),
                        SizedBox(height: 10.h,),
                        _orderNowButton()

                      ],
                    ),
            ),
          ),
      ),
    );
  }
}


Widget _orderInfo(){
  return  Container(
    height: 212.h,
    width: 343.w,
    decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.all(Radius.circular(16.r))
    ),
    child: Padding(
      padding:  EdgeInsets.symmetric(horizontal: 16.w,vertical:20.h ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomText(text: 'Order Info',color: AppColors.blackColor,fontSize: 24.sp,fontWeight: FontWeight.w500,),
          SizedBox(height: 12.h,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomText(text: 'Subtotal',color: AppColors.blackColor,fontSize: 16.sp,fontWeight: FontWeight.w500,),
              CustomText(text: '₦89.54',color: AppColors.blackColor,fontSize: 16.sp,fontWeight: FontWeight.w500,),

            ],
          ),
          SizedBox(height: 16.h,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomText(text: 'Delivery fee',color: AppColors.blackColor,fontSize: 16.sp,fontWeight: FontWeight.w500,),
              CustomText(text: '₦15.00',color: AppColors.blackColor,fontSize: 16.sp,fontWeight: FontWeight.w500,),

            ],
          ),
          DottedBorder(
              options: CustomPathDottedBorderOptions(
                padding: const EdgeInsets.all(8),
                color:AppColors.GreyColors9E,
                strokeWidth: 2,
                dashPattern: [10, 5],
                customPath: (size) => Path()
                  ..moveTo(0, size.height)
                  ..relativeLineTo(size.width, 0),
              ),
              child:  SizedBox(height: 0, width: 320.w)
          ),
          SizedBox(height: 16.h,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomText(text: 'Total',color: AppColors.blackColor,fontSize: 20.sp,fontWeight: FontWeight.w500,),
              CustomText(text: '₦104.54',color: AppColors.blackColor,fontSize: 20.sp,fontWeight: FontWeight.w500,),
            ],
          ),


        ],
      ),
    ),

  );
}

Widget _deliveryAddress(){
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      SizedBox(height: 16.h,),
      Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: AppColors.whiteColor,
          border: BoxBorder.all(
            color: Color(0xff0A2833),),
          borderRadius: BorderRadius.all(Radius.circular(8.r))
        ),
        child: Padding(
          padding:  EdgeInsets.symmetric(horizontal: 16.w,vertical: 6.h),
          child: Row(
            children: [
              SvgPicture.asset(SvgAssetsPaths.instance.location),
              SizedBox(width: 8.w,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(text: 'Home',color: AppColors.blackColor,fontWeight: FontWeight.w500,fontSize: 16.sp,),
                  CustomText(text: '123 Main Street, City, State',color: AppColors.lightGrey,fontWeight: FontWeight.w400,fontSize: 14.sp,),
                ],
              ),

              Spacer(),
              GestureDetector(
                onTap: (){
                },
                child: Image.asset(IconsAssetsPaths.instance.edit_icon,height: 20.h,width: 20.w,color: AppColors.blackColor,),
              ),
              SizedBox(width: 12.w,),
              GestureDetector(
                onTap: (){
                },
                child: Image.asset(IconsAssetsPaths.instance.delete_icon,height: 20.h,width: 20.w,color: AppColors.redColor,),
              ),

            ],
          ),
        ),
      ),
      SizedBox(
        height: 24.h,
      ),
      Container(
        width: double.infinity,
        decoration: BoxDecoration(
            color: AppColors.whiteColor,
            border: BoxBorder.all(
              color: Color(0xff0A2833),),
            borderRadius: BorderRadius.all(Radius.circular(8.r))
        ),
        child: Padding(
          padding:  EdgeInsets.symmetric(horizontal: 16.w,vertical: 6.h),
          child: Row(
            children: [
              SvgPicture.asset(SvgAssetsPaths.instance.location),
              SizedBox(width: 8.w,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(text: 'Office',color: AppColors.blackColor,fontWeight: FontWeight.w500,fontSize: 16.sp,),
                  CustomText(text: '456 Business Avenue, City, State',color: AppColors.lightGrey,fontWeight: FontWeight.w400,fontSize: 14.sp,),
                ],
              ),

              Spacer(),
              GestureDetector(
                onTap: (){
                },
                child: Image.asset(IconsAssetsPaths.instance.edit_icon,height: 20.h,width: 20.w,color: AppColors.blackColor,),
              ),
              SizedBox(width: 12.w,),
              GestureDetector(
                onTap: (){
                },
                child: Image.asset(IconsAssetsPaths.instance.delete_icon,height: 20.h,width: 20.w,color: AppColors.redColor,),
              ),

            ],
          ),
        ),
      ),

      Align(
        alignment: Alignment.centerRight,
        child: TextButton(onPressed: (){},
            child: CustomText(text: '+ Add New Address',color: AppColors.blackColor,fontSize: 14.sp,fontWeight: FontWeight.w500,)),
      )
    ],
  );
}

Widget _orderNowButton(){
  return CustomButton(
    text: 'Order Now',
    textColor: AppColors.whiteColor,fontWeight: FontWeight.w500,
    fontSize: 18.sp,
    onPressed: ()=>Get.to(()=>PaymentScreen()),
  );
}




