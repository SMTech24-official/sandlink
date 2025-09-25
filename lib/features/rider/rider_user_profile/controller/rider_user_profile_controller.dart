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
      leadingImage: IconsAssetsPaths.instance.edits_icon,
      title: 'Edit Profile',
      bgColor: AppColors.lightGreen3,
      trailingImage: IconsAssetsPaths.instance.rightarrow_Icon,
    ),
    RiderProfileMenuItem(
      leadingImage: IconsAssetsPaths.instance.doc_icon,
      title: 'Documents',
      trailingImage: IconsAssetsPaths.instance.rightarrow_Icon,
      bgColor: AppColors.lightGreen3,
    ),

    RiderProfileMenuItem(
      leadingImage: IconsAssetsPaths.instance.joind_icon,
      title: 'Payment Methods',
      trailingImage: IconsAssetsPaths.instance.rightarrow_Icon,
      bgColor: AppColors.lightGreen3,
    ),
    RiderProfileMenuItem(
      leadingImage: IconsAssetsPaths.instance.delete_icon,
      title: 'Delete Account',
      trailingImage: IconsAssetsPaths.instance.rightarrow_Icon,
      bgColor: AppColors.lightGreen3,
    ),
    RiderProfileMenuItem(
      leadingImage: IconsAssetsPaths.instance.logout_Icon,
      title: 'Logout',
      trailingImage: IconsAssetsPaths.instance.rightarrow_Icon,
      bgColor: AppColors.redlightColor,
    ),
  ];



}