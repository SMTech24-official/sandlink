import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:sandlink/core/app_colors/app_colors.dart';
import 'package:sandlink/core/widgets/custom_app_bar.dart';
import 'package:sandlink/core/widgets/custom_button.dart';

import '../../../../core/config/constants/assets_paths/icons_assets_paths.dart';
import '../../../../core/wrappers/custom_text.dart';
import 'arrived_at_pickup_screen.dart';

class OrderDetailsScreen extends StatelessWidget {
   OrderDetailsScreen({super.key,  this.itemName,  this.itrmQuantity,  this.itemprice,  this.imageurl,  this.pickupLocation,  this.pickupduration,  this.deliveryLocation,  this.deliveryduration, this.itemOrder});

   final String? itemName;
   final  String? itrmQuantity;
   final String? itemprice;
   final String? itemOrder;
   final String? imageurl;
   final String? pickupLocation;
   final String? pickupduration;
   final String? deliveryLocation;
   final String? deliveryduration;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: CustomAppBar(
        title: 'Order Details',
        centerTitle: true,
        onLeadingPressed: ()=>Get.back(),
      ),
      body: SafeArea(
          child: Column(
        children: [
         Expanded(
             flex: 8,
             child: SingleChildScrollView(
               scrollDirection: Axis.vertical,
               child: Column(
                          children: [
               Padding(
                 padding: EdgeInsets.symmetric(horizontal: 16.w),
                 child: Container(

                   width: double.infinity.w,
                   decoration: BoxDecoration(
                     color: AppColors.whiteColor,
                     borderRadius: BorderRadius.all(
                       Radius.circular(8.r),
                     ),
                   ),
                   child: Padding(
                     padding: EdgeInsets.symmetric(
                       horizontal: 12.w,
                       vertical: 12.h,
                     ),
                     child: Column(
                       children: [
                         Row(
                           children: [
                             Container(
                               height: 50.h,
                               width: 50.w,
                               decoration: BoxDecoration(
                                 color: AppColors.blueColorF7,
                                 borderRadius: BorderRadius.all(
                                   Radius.circular(8.r),
                                 ),
                               ),

                               child: Image.asset(
                                 IconsAssetsPaths.instance.orderimage,
                                 fit: BoxFit.fill,
                                 height: 44.h,
                                 width: 44.w,
                               ),
                             ),
                             SizedBox(width: 8.w),
                             Column(
                               crossAxisAlignment:
                               CrossAxisAlignment.start,
                               children: [
                                 Row(
                                   children: [
                                     CustomText(
                                       text: itrmQuantity.toString(),
                                       fontSize: 16.sp,
                                       fontWeight: FontWeight.w500,
                                       color: AppColors.blackColor,
                                     ),
                                     SizedBox(width: 5.w),
                                     CustomText(
                                       text: itemName.toString(),
                                       fontSize: 16.sp,
                                       fontWeight: FontWeight.w500,
                                       color: AppColors.blackColor,
                                     ),
                                   ],
                                 ),
                                 CustomText(
                                   text: itemOrder.toString(),
                                   fontSize: 14.sp,
                                   fontWeight: FontWeight.w400,
                                   color: AppColors.lightGrey,
                                 ),
                               ],
                             ),
                             Spacer(),
                             Container(
                               height: 25.h,
                               width: 80.w,
                               decoration: BoxDecoration(
                                 color: AppColors.blueColorF7,
                                 borderRadius: BorderRadius.all(
                                   Radius.circular(4.r),
                                 ),
                               ),
                               child: Center(
                                 child: CustomText(
                                   text: itemprice.toString(),
                                   fontSize: 14.sp,
                                   fontWeight: FontWeight.w500,
                                   color: AppColors.primaryColor,
                                 ),
                               ),
                             ),
                           ],
                         ),
                         SizedBox(height: 12.h,),
                         Row(
                           children: [
                             Icon(
                               Icons.access_time,
                               size: 20,
                               color: AppColors.lightGrey,
                             ),
                             SizedBox(width: 5.w,),
                             CustomText(
                               maxLines: 2,
                               text: 'Estimated time: 2h 30m',
                               fontSize: 14.sp,
                               fontWeight: FontWeight.w400,
                               color: AppColors.lightGrey,
                             ),

                           ],
                         ),
                         SizedBox(height: 6.h,),


                       ],
                     ),
                   ),
                 ),
               ),
               SizedBox(height: 20.h,),
               Padding(
                 padding: EdgeInsets.symmetric(horizontal: 16.w),
                 child: Container(

                   width: double.infinity.w,
                   decoration: BoxDecoration(
                     color: AppColors.whiteColor,
                     borderRadius: BorderRadius.all(
                       Radius.circular(8.r),
                     ),
                   ),
                   child: Padding(
                     padding: EdgeInsets.symmetric(
                       horizontal: 12.w,
                       vertical: 12.h,
                     ),
                     child: Column(
                       children: [
                         Row(
                           children: [
                             Container(
                               height: 50.h,
                               width: 50.w,
                               decoration: BoxDecoration(
                                 color: AppColors.greenColor.withOpacity(0.2),
                                 borderRadius: BorderRadius.all(
                                   Radius.circular(60.r),
                                 ),
                               ),

                               child: Icon(Icons.location_on_outlined,size: 30,color: AppColors.greenColor,),
                             ),
                             SizedBox(width: 8.w),
                             Column(
                               crossAxisAlignment:
                               CrossAxisAlignment.start,
                               children: [
                                 CustomText(
                                   text: 'PICKUP LOCATION',
                                   fontSize: 12.sp,
                                   fontWeight: FontWeight.w400,
                                   color: AppColors.lightGrey,
                                 ),
                                 Row(
                                   children: [
                                     CustomText(
                                       text: itrmQuantity.toString(),
                                       fontSize: 16.sp,
                                       fontWeight: FontWeight.w500,
                                       color: AppColors.blackColor,
                                     ),
                                     SizedBox(width: 5.w),
                                     CustomText(
                                       text: itemName.toString(),
                                       fontSize: 16.sp,
                                       fontWeight: FontWeight.w500,
                                       color: AppColors.blackColor,
                                     ),
                                   ],
                                 ),

                               ],
                             ),
                             Spacer(),
                             Container(
                               height: 25.h,
                               width: 100.w,
                               decoration: BoxDecoration(
                                 color: AppColors.blueColorF7,
                                 borderRadius: BorderRadius.all(
                                   Radius.circular(4.r),
                                 ),
                               ),
                               child: Center(
                                 child: CustomText(
                                   text: " ${pickupduration.toString()} km away",
                                   fontSize: 14.sp,
                                   fontWeight: FontWeight.w500,
                                   color: AppColors.primaryColor,
                                 ),
                               ),
                             ),
                           ],
                         ),
                         SizedBox(height: 12.h,),
                         Row(
                           children: [
                             Icon(
                               Icons.location_on_outlined,
                               size: 20,
                               color: AppColors.lightGrey,
                             ),
                             SizedBox(width: 5.w,),
                             CustomText(
                               maxLines: 2,
                               text: pickupLocation.toString(),
                               fontSize: 14.sp,
                               fontWeight: FontWeight.w400,
                               color: AppColors.lightGrey,
                             ),

                           ],
                         ),


                       ],
                     ),
                   ),
                 ),
               ),


               SizedBox(height: 20.h,),
               Padding(
                 padding: EdgeInsets.symmetric(horizontal: 16.w),
                 child: Container(

                   width: double.infinity.w,
                   decoration: BoxDecoration(
                     color: AppColors.whiteColor,
                     borderRadius: BorderRadius.all(
                       Radius.circular(8.r),
                     ),
                   ),
                   child: Padding(
                     padding: EdgeInsets.symmetric(
                       horizontal: 12.w,
                       vertical: 12.h,
                     ),
                     child: Column(
                       children: [
                         Row(
                           children: [
                             Container(
                               height: 50.h,
                               width: 50.w,
                               decoration: BoxDecoration(
                                 color: AppColors.greenColor.withOpacity(0.2),
                                 borderRadius: BorderRadius.all(
                                   Radius.circular(60.r),
                                 ),
                               ),

                               child: Icon(Icons.location_on_outlined,size: 30,color: AppColors.greenColor,),
                             ),
                             SizedBox(width: 8.w),
                             Column(
                               crossAxisAlignment:
                               CrossAxisAlignment.start,
                               children: [

                                 Row(
                                   children: [
                                     CustomText(
                                       text: itrmQuantity.toString(),
                                       fontSize: 16.sp,
                                       fontWeight: FontWeight.w500,
                                       color: AppColors.blackColor,
                                     ),
                                     SizedBox(width: 5.w),
                                     CustomText(
                                       text: itemName.toString(),
                                       fontSize: 16.sp,
                                       fontWeight: FontWeight.w500,
                                       color: AppColors.blackColor,
                                     ),
                                   ],
                                 ),
                                 CustomText(
                                   text: itemOrder.toString(),
                                   fontSize: 14.sp,
                                   fontWeight: FontWeight.w500,
                                   color: AppColors.lightGrey,
                                 ),
                               ],
                             ),
                             Spacer(),
                             Container(
                               height: 25.h,
                               width: 100.w,
                               decoration: BoxDecoration(
                                 color: AppColors.blueColorF7,
                                 borderRadius: BorderRadius.all(
                                   Radius.circular(4.r),
                                 ),
                               ),
                               child: Center(
                                 child: CustomText(
                                   text: " ${deliveryduration.toString()} km away",
                                   fontSize: 14.sp,
                                   fontWeight: FontWeight.w500,
                                   color: AppColors.primaryColor,
                                 ),
                               ),
                             ),
                           ],
                         ),
                         SizedBox(height: 12.h,),
                         Row(
                           children: [
                             Icon(
                               Icons.location_on_outlined,
                               size: 20,
                               color: AppColors.lightGrey,
                             ),
                             SizedBox(width: 5.w,),
                             CustomText(
                               maxLines: 2,
                               text: deliveryLocation.toString(),
                               fontSize: 14.sp,
                               fontWeight: FontWeight.w400,
                               color: AppColors.lightGrey,
                             ),

                           ],
                         ),


                       ],
                     ),
                   ),
                 ),
               ),
                          ],
                        ),
             )),
          Expanded(
              child: Container(
                 color: AppColors.whiteColor,
                child: Padding(
                  padding:  EdgeInsets.symmetric(horizontal: 18.w),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: CustomButton(
                          borderSide: BorderSide(
                            color: AppColors.redColor,
                            width: 1.w
                          ),
                            backgroundColor: AppColors.redliteColor,
                            text: 'Decline Order',
                            textColor: AppColors.redColor,
                            onPressed: (){}),
                      ),
                      SizedBox(width: 16.w,),
                      Expanded(
                        flex: 1,
                        child: CustomButton(

                            text: 'Accept Order',
                            onPressed: ()=>Get.to(()=>ArrivedAtPickupScreen(
                              itemName: itemName.toString(),
                              itrmQuantity: itrmQuantity.toString(),
                              itemOrder: itemOrder.toString(),
                              itemprice: itemprice.toString(),
                            ))),
                      ),
                    ],
                  ),
                ),
          ))
        ],
      )),
    );
  }
}
