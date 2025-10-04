import 'dart:developer';

import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:sandlink/core/config/api_end_points/api_end_points.dart';
import 'package:sandlink/core/network/network_caller.dart';
import 'package:sandlink/core/services/DBServices/local_db_services/storage_service.dart';
import 'package:sandlink/features/user/notification/model/notification_model.dart';

class NotificationController extends GetxController {
  final notifation = <Result>[].obs;

  @override
  void onInit() {
    super.onInit();
    fatchnotification();
  }

  final token = StorageService().getData('accessToken');

  Future<void> fatchnotification() async {
    EasyLoading.show(status: 'Loading...');
    try {
      final response = await NetworkCaller().getRequest(
        ApiEndPoints.notification,
        token: token,
      );

      if (response.isSuccess) {
        var getdata = response.responseData["result"] as List;

        // Map JSON to model
        notifation.value = getdata.map((e) => Result.fromJson(e)).toList();

        log("Notifications Loaded: ${notifation.length}");
      } else {
        Get.snackbar("Error", "Failed to load notifications");
      }
    } catch (e) {
      EasyLoading.showError("Error is: $e");
    } finally {
      EasyLoading.dismiss();
    }
  }
}
