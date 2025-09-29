import 'dart:developer';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:sandlink/core/config/api_end_points/api_end_points.dart';
import '../../../../core/app_colors/app_colors.dart';
import '../../../../core/config/constants/assets_paths/icons_assets_paths.dart';
import '../../../../core/network/network_caller.dart';
import '../../../../core/services/DBServices/local_db_services/storage_service.dart';

import '../model/get_user_profile_model.dart';
import '../model/profile_menu_item.dart';

class UserProfileController extends GetxController {
  final userEmail = StorageService().getData('email');
  final username = StorageService().getData('name');
  final userToken = StorageService().getData('accessToken');

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

  @override
  void onInit() {
    getUserProfileData();
    super.onInit();
  }

  final token = StorageService().getData('token');

  var getUserName = ''.obs;
  var getUserEmail = ''.obs;
  var getUserProfile = ''.obs;
  var getUserphone = ''.obs;

  Future<void> getUserProfileData() async {
    EasyLoading.show(status: 'Loading...');
    try {
      final response = await NetworkCaller().getRequest(
        ApiEndPoints.getUserProfile,
        token: token,
      );
      if (response.isSuccess) {
        var getdata = Data.fromJson(response.responseData);
        getUserName.value = getdata.name ?? "N/A";
        getUserEmail.value = getdata.email ?? "N/A";
        getUserProfile.value =
            getdata.image ??
            "https://cdn-icons-png.flaticon.com/512/180/180644.png";
        getUserphone.value = getdata.phoneNumber ?? "";

        log('Show Data:${getdata.email}');
      }
    } catch (e) {
      EasyLoading.dismiss();
      EasyLoading.showError('Error:$e');
    } finally {
      EasyLoading.dismiss();
    }
  }
}
