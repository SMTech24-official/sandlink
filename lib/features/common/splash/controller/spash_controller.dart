import 'dart:developer';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:sandlink/core/services/DBServices/local_db_services/storage_service.dart';
import 'package:sandlink/features/common/splash/screens/splash_screen%20_tow.dart';
import 'package:sandlink/features/rider/rider_nav_bar/rider_nav_bar.dart';
import 'package:sandlink/features/user/nav_bar/screens/user_nav_bar.dart';

class SplashController extends GetxController {
  void _moveToNext() async {
    final String? role = StorageService().getData('role');
    log("===============ROLE================$role");

    await Future.delayed(Duration(seconds: 2), () {
      final String? accessToken = StorageService().getData("accessToken");
      if (kDebugMode) {
        print("token : $accessToken");
      }
      if (accessToken != null) {
        if (role == 'CUSTOMER') {
          Get.offAll(() => UserNavBar());
        } else {
          Get.offAll(() => RiderNavBar());
        }
      } else {
        Get.to(SplashScreentow());
      }
    });
  }

  @override
  void onInit() {
    super.onInit();
    _moveToNext();
  }
}
