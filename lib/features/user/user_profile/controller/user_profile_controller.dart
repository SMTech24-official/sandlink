import 'package:get/get.dart';
import 'package:sandlink/core/app_colors/app_colors.dart';

import '../../../../core/config/constants/assets_paths/icons_assets_paths.dart';
import '../model/profile_menu_item.dart';

class UserProfileController extends GetxController{


  final List<ProfileMenuItem> profilemenuList = [
    ProfileMenuItem(
      leadingImage: IconsAssetsPaths.instance.edits_icon,
      title: 'Edit Profile',
      bgColor: AppColors.lightGreen3,
      trailingImage: IconsAssetsPaths.instance.rightarrow_Icon,
    ),
    ProfileMenuItem(
      leadingImage: IconsAssetsPaths.instance.doc_icon,
      title: 'My Orders',
      trailingImage: IconsAssetsPaths.instance.rightarrow_Icon,
      bgColor: AppColors.lightGreen3,
    ),
    ProfileMenuItem(
      leadingImage: IconsAssetsPaths.instance.send_icon,
      title: 'Saved Address',
      trailingImage: IconsAssetsPaths.instance.rightarrow_Icon,
      bgColor: AppColors.lightGreen3,
    ),
    ProfileMenuItem(
      leadingImage: IconsAssetsPaths.instance.joind_icon,
      title: 'Join Affiliates',
      trailingImage: IconsAssetsPaths.instance.rightarrow_Icon,
      bgColor: AppColors.lightGreen3,
    ),
    ProfileMenuItem(
      leadingImage: IconsAssetsPaths.instance.delete_icon,
      title: 'Delete Account',
      trailingImage: IconsAssetsPaths.instance.rightarrow_Icon,
      bgColor: AppColors.lightGreen3,
    ),
    ProfileMenuItem(
      leadingImage: IconsAssetsPaths.instance.logout_Icon,
      title: 'Logout',
      trailingImage: IconsAssetsPaths.instance.rightarrow_Icon,
      bgColor: AppColors.redlightColor,
    ),
  ];



}