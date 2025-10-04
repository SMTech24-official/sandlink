import 'dart:developer';

import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:sandlink/core/app_colors/app_colors.dart';
import 'package:sandlink/core/config/api_end_points/api_end_points.dart';
import 'package:sandlink/core/network/network_caller.dart';
import 'package:sandlink/core/services/DBServices/local_db_services/storage_service.dart';

import '../../../../core/config/constants/assets_paths/icons_assets_paths.dart';
import '../../../user/user_profile/model/get_user_profile_model.dart';
import '../model/profile_menu_item.dart';

class RiderUserProfileController extends GetxController {
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

  @override
  void onInit() {
    super.onInit();
    getUserProfileData();
  }

  final token = StorageService().getData('accessToken');

  /// Observables for UI
  var getUserName = ''.obs;
  var getUserEmail = ''.obs;
  var getUserProfile = ''.obs;
  var getUserphone = ''.obs;
  var userId = ''.obs;

  /// Fetch user profile
  Future<void> getUserProfileData() async {
    try {
      EasyLoading.show(status: 'Loading...');
      final response = await NetworkCaller().getRequest(
        ApiEndPoints.getUserProfile,
        token: token,
      );

      if (response.isSuccess) {
        var getdata = Data.fromJson(response.responseData);

        /// Set values safely with fallbacks
        getUserName.value = (getdata.name?.isNotEmpty == true)
            ? getdata.name!
            : "N/A";
        getUserEmail.value = (getdata.email?.isNotEmpty == true)
            ? getdata.email!
            : "N/A";
        getUserphone.value = (getdata.phoneNumber?.isNotEmpty == true)
            ? getdata.phoneNumber!
            : "N/A";
        userId.value = (getdata.phoneNumber?.isNotEmpty == true)
            ? getdata.id ?? ''
            : "N/A";

        /// ✅ Image must not be empty string
        if (getdata.image != null && getdata.image!.isNotEmpty) {
          getUserProfile.value = getdata.image!;
        } else {
          getUserProfile.value =
              "https://cdn-icons-png.flaticon.com/512/180/180644.png";
        }

        log('Profile Loaded: ${getdata.email}');
      } else {
        EasyLoading.showError("Failed to load profile");
      }
    } catch (e) {
      EasyLoading.showError('Error: $e');
    } finally {
      EasyLoading.dismiss();
    }
  }
}
