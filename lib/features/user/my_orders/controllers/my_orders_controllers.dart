import 'dart:developer';
import 'package:get/get.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:sandlink/core/config/api_end_points/api_end_points.dart';
import 'package:sandlink/core/network/network_caller.dart';
import 'package:sandlink/core/services/DBServices/local_db_services/storage_service.dart';
import 'package:sandlink/features/user/my_orders/model/get_all_customer_orders_model.dart';

class MyOrdersController extends GetxController {
  final orders = <MyOrdersModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    getMyOrders();
  }

  final token = StorageService().getData('accessToken');

  Future<void> getMyOrders() async {
    EasyLoading.show(status: 'Loading...');
    try {
      final response = await NetworkCaller().getRequest(
        ApiEndPoints.getMyOrders,
        token: token,
      );

      if (response.isSuccess) {
        var getdata = response.responseData['result'] as List;

        // Map JSON to model
        orders.value = getdata.map((e) => MyOrdersModel.fromJson(e)).toList();

        log("✅ Orders Loaded: ${orders.length}");
      } else {
        Get.snackbar("Error", "Failed to load orders");
      }
    } catch (e) {
      EasyLoading.showError("Error is: $e");
    } finally {
      EasyLoading.dismiss();
    }
  }
}
