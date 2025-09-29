import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sandlink/core/app_colors/app_colors.dart';
import 'package:sandlink/core/config/constants/assets_paths/icons_assets_paths.dart';
import 'package:sandlink/core/widgets/custom_app_bar.dart';
import 'package:sandlink/core/wrappers/custom_text.dart';

import '../controller/rider_doc_controller.dart';

class RiderDocumentScreen extends StatelessWidget {
   RiderDocumentScreen({super.key});
 final controller  = Get.put(RiderDocController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Documents',
        centerTitle: true,
        onLeadingPressed: ()=>Get.back(),
      ),
      body: SafeArea(
          child: Padding(
            padding:  EdgeInsets.symmetric(horizontal: 16.w,vertical: 12.h),
            child: ListView.separated(
                    separatorBuilder: (_,index)=>SizedBox(height: 8.h,),
            itemCount: controller.docList.length,
            itemBuilder: (_,index){
                      final items = controller.docList[index];
              return Container(
                height: 50.h,
                width: double.infinity.w,

                decoration: BoxDecoration(
                    color: AppColors.lightGreyD1,
                  borderRadius: BorderRadius.all(Radius.circular(8.r))
                ),
                child: Padding(
                  padding:  EdgeInsets.symmetric(horizontal: 12.w,vertical: 12.h),
                  child: Row(
                    children: [
                      CustomText(text: items.title,color: AppColors.lightGrey,fontSize: 16.sp,fontWeight: FontWeight.w500,),
Spacer(),
                     Image.asset(IconsAssetsPaths.instance.upload_icon),
                     SizedBox(width: 8.w,),
                     Image.asset(IconsAssetsPaths.instance.show_icon),
                      SizedBox(width: 8.w,),
                     Image.asset(IconsAssetsPaths.instance.delete_icon),
                    ],
                  ),
                ),
              );
            }

                  ),
          )),
    );
  }
}
