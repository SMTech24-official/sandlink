import 'package:get/get.dart';
import 'package:sandlink/core/app_colors/app_colors.dart';

import '../../../../core/config/constants/assets_paths/icons_assets_paths.dart';
import '../model/profile_menu_item.dart';

class RiderUserProfileController extends GetxController{

  RxBool isSwitched = true.obs;

  void toggleSwitch(bool value) {
    isSwitched.value = value;
  }


  final List<RiderProfileMenuItem> profilemenuList = [
    RiderProfileMenuItem(
      leadingImage: IconsAssetsPaths.instance.editsicon,
      title: 'Edit Profile',
      bgColor: AppColors.lightGreen3,
      trailingImage: IconsAssetsPaths.instance.rightarrowIcon,
    ),
    RiderProfileMenuItem(
      leadingImage: IconsAssetsPaths.instance.docicon,
      title: 'Documents',
      trailingImage: IconsAssetsPaths.instance.rightarrowIcon,
      bgColor: AppColors.lightGreen3,
    ),

    RiderProfileMenuItem(
      leadingImage: IconsAssetsPaths.instance.joindicon,
      title: 'Payment Methods',
      trailingImage: IconsAssetsPaths.instance.rightarrowIcon,
      bgColor: AppColors.lightGreen3,
    ),
    RiderProfileMenuItem(
      leadingImage: IconsAssetsPaths.instance.deleteicon,
      title: 'Delete Account',
      trailingImage: IconsAssetsPaths.instance.rightarrowIcon,
      bgColor: AppColors.lightGreen3,
    ),
    RiderProfileMenuItem(
      leadingImage: IconsAssetsPaths.instance.logoutIcon,
      title: 'Logout',
      trailingImage: IconsAssetsPaths.instance.rightarrowIcon,
      bgColor: AppColors.redlightColor,
    ),
  ];



}