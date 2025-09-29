import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:sandlink/core/app_colors/app_colors.dart';
import 'package:sandlink/core/app_routes/app_route_names.dart';
import 'package:sandlink/core/services/DBServices/local_db_services/storage_service.dart';
import 'package:sandlink/core/widgets/custom_app_bar.dart';
import 'package:sandlink/core/wrappers/custom_text.dart';
import 'package:sandlink/features/user/user_profile/controller/edit_profile_controller.dart';
import 'package:sandlink/features/user/user_profile/screen/save_address_screen.dart';

import '../../../../core/config/constants/assets_paths/icons_assets_paths.dart';
import '../../../../core/widgets/custom_bottom_sheet.dart';
import '../../join_affiliates/screen/terms_conditions_screen.dart';
import '../../my_orders/screen/my_orders_screen.dart';
import '../controller/user_profile_controller.dart';
import 'edit_profile_screen.dart';

class UserProfileScreen extends StatelessWidget {
   UserProfileScreen({super.key});

  final controller = Get.put(UserProfileController());
  final editcontroller = Get.put(EditUserProfileController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: CustomAppBar(
        title: 'Profile',
        onLeadingPressed: () => Get.back(),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding:  EdgeInsets.symmetric(horizontal: 16.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GestureDetector(
            
                    onTap: ()=>controller.getUserProfileData(),
                    child: _userProfile(controller: controller, editController: editcontroller)),
                SizedBox(height: 32.h,),
                _profileMenuList(controller: controller),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


Widget _userProfile({required UserProfileController controller,required EditUserProfileController editController}){
  return Obx(()=>Column(
    children: [
      SizedBox(height: 16.h),
      CircleAvatar(
        backgroundColor: Colors.amber,
        backgroundImage: NetworkImage(
          '${controller.getUserProfile.value.isNotEmpty ? controller.getUserProfile.value : "https://cdn-icons-png.flaticon.com/512/180/180644.png"}',
        ),
        radius: 56.r,
      ),
      SizedBox(height: 16.h),
      CustomText(text: controller.getUserName.value,color: AppColors.blackColor,fontSize: 24.sp,fontWeight: FontWeight.w500,),
      CustomText(text: controller.getUserEmail.value,color: AppColors.lightGrey,fontSize: 16.sp,fontWeight: FontWeight.w400,)
    ],
  ));
}

Widget _profileMenuList({required UserProfileController controller}){
  return   Container(
      height: Get.height/2.0,
      width: double.infinity.w,

      child: ListView.separated(
        separatorBuilder: (_,index)=>SizedBox(height: 5.h,),
        itemCount:controller.profilemenuList.length,
        itemBuilder: (_,index){
          final itemdata = controller.profilemenuList[index];
          return GestureDetector(
            onTap: (){
              if(index == 0){
                Get.to(()=>EditProfileScreen());
              } else if(index == 1){
                Get.to(()=>MyOrdersScreen());
              }
              else if(index == 2){
                Get.to(()=>SaveAddressScreen());
              }

               else if (index == 3){
                 Get.to(()=>TermsConditionsScreen());
              }

              else if(index == 4){
               showCustomBottomSheet(
                   title: 'Delete Account',
                   subtitle: 'Are you sure you want to\n   delete your account?',
                   buttonTitle1: 'Cancel',
                   buttonTitle2: 'Yes, Delete',
                   onTap1: ()=>Get.back(),
                   onTap2: () async{
                     await StorageService().clearAll();

                     EasyLoading.dismiss();
                     EasyLoading.showSuccess('Account Delete Successfully');

                     Get.offAllNamed(AppRouteNames.instance.login);
                   }
               );
              }
              else if(index == 5){
               showCustomBottomSheet(
                   title: 'Logout',
                   subtitle: 'Are you sure you want to log out?',
                   buttonTitle1: 'Cancel',
                   buttonTitle2: 'Yes, Logout',
                   onTap1: ()=>Get.back(),
                   onTap2: ()async {
                     await StorageService().clearAll();

                     EasyLoading.dismiss();
                     EasyLoading.showSuccess('Logout Successfully');

                     Get.offAllNamed(AppRouteNames.instance.login); // navigate to login
                   }
               );
              }
            },
            child: Container(
              height: 50.h,
              width: double.infinity.w,
              color: AppColors.whiteColor,
              child: Row(
                children: [
                  Container(
                    height: 44.h,
                    width: 44.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(8.r)),
                      color: itemdata.bgColor,
                    ),
                    child: Image.asset("${itemdata.leadingImage}"),
                  ),
                  SizedBox(width: 8.w,),
                  CustomText(text: itemdata.title,color: AppColors.blackColor,fontWeight: FontWeight.w500,fontSize: 16.sp,),

                  Spacer(),
                  Image.asset("${itemdata.trailingImage}")

                ],
              ),
            ),
          );
        },

      )
  );
}
