// import 'dart:developer';

// import 'package:flutter/material.dart';
// import 'package:flutter_easyloading/flutter_easyloading.dart';
// import 'package:get/get.dart';
// import 'package:sandlink/core/config/api_end_points/api_end_points.dart';
// import 'package:sandlink/core/network/network_caller.dart';
// import 'package:sandlink/features/user/my_orders/model/get_all_customer_orders_model.dart';
// import '../model/model.dart';

// class MyOrdersControllers extends GetxController{
//   final userReviewFeedbackController = TextEditingController();

//   final List<MyOrderModel> myorderList = [

//     MyOrderModel(
//         id: 1,
//         orderId: 'Order 00-2025-001',
//         placeDate: 'Placed on 1/1 5/2025',
//         deliveryStatus: 1,
//         imageUrl: 'https://www.figma.com/file/jNz7l61vmikt0kYyCBqz6X/image/c7eb458c8334d622e53cf983844410ccf9686134',
//         title: 'Builder’s Choice Sand',
//         quantity: '₦200',
//         totalAmount: ' ₦299.99',
//         onTapStatus: 1,
//     ),

//     MyOrderModel(
//         id: 2,
//         orderId: 'Order 00-2025-001',
//         placeDate: 'Placed on 1/1 5/2025',
//         deliveryStatus: 2,
//         imageUrl: 'https://www.figma.com/file/jNz7l61vmikt0kYyCBqz6X/image/c7eb458c8334d622e53cf983844410ccf9686134',
//         title: 'Builder’s Choice Sand',
//         quantity: '₦200',
//         totalAmount: ' ₦299.99',
//         onTapStatus: 1,
//     ),

//     MyOrderModel(
//         id: 3,
//         orderId: 'Order 00-2025-001',
//         placeDate: 'Placed on 1/1 5/2025',
//         deliveryStatus: 0,
//         imageUrl: 'https://www.figma.com/file/jNz7l61vmikt0kYyCBqz6X/image/c7eb458c8334d622e53cf983844410ccf9686134',
//         title: 'Builder’s Choice Sand',
//         quantity: '₦200',
//         totalAmount: ' ₦299.99',
//         onTapStatus: 1,
//     ),

//   ];

// final getMyOrdersModel = <MyOrdersModel>[].obs;

//   @override
//   void onInit() {
//     getMyOrders();
//     super.onInit();
//   }

//   Future<void> getMyOrders() async {
//     EasyLoading.show(status: 'Loading...');
//     try {
//       final response = await NetworkCaller().getRequest(
//         ApiEndPoints.getMyOrders,
//       );

//       if (response.isSuccess) {
//         final productData = MyOrdersData.fromJson(response.responseData);
//         getMyOrdersModel.value = productData.result!.toList();

//         log("✅ Products loaded: ${getMyOrdersModel.length}");
//       } else {
//         Get.snackbar("Error", "Failed to load products");
//       }
//     } catch (e) {
//       EasyLoading.showError("Error: $e");
//     } finally {
//       EasyLoading.dismiss();
//     }
//   }

// }




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
