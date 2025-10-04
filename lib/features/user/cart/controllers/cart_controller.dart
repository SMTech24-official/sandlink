import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sandlink/core/config/api_end_points/api_end_points.dart';
import 'package:sandlink/core/network/network_caller.dart';
import 'package:sandlink/core/services/DBServices/local_db_services/storage_service.dart';
import 'package:sandlink/features/user/cart/model/get_all_cart.dart';

class CartController extends GetxController {
  final box = GetStorage();

  var quantity = 1.obs;

  // void increment() {
  //   quantity++;
  // }

  // void decrement() {
  //   if (quantity > 1) {
  //     quantity--;
  //   }
  // }

  var cartItems = <Map<String, dynamic>>[].obs;

  //Track selected items (assuming 10 items for now)
  // var selectedItems = List<bool>.filled(10, false).obs;

  // void toggleSelection(int index) {
  //   selectedItems[index] = !selectedItems[index];
  // }

  // final code......................................................

  final isLoading = false.obs;
  final allCartModel = <CartItems>[].obs;
  final selectedItems = <bool>[].obs; // Track checkbox per item
  final quantities = <int>[].obs; // Track quantity per item

  final token = StorageService().getData('accessToken');

  @override
  void onInit() {
    super.onInit();
    fetchAllCart();
  }

  Future<void> fetchAllCart() async {
    EasyLoading.show(status: 'Loading...');
    try {
      final response = await NetworkCaller().getRequest(
        ApiEndPoints.getAllCart,
        token: token,
      );

      if (response.isSuccess) {
        var getdata = response.responseData as List;
        allCartModel.value = getdata.map((e) => CartItems.fromJson(e)).toList();

        // Initialize checkboxes and quantities
        selectedItems.value = List.generate(allCartModel.length, (_) => false);
        quantities.value = List.generate(allCartModel.length, (_) => 1);

        log("Cart Loaded: ${allCartModel.length}");
      } else {
        Get.snackbar("Error", "Failed to load cart");
      }
    } catch (e) {
      EasyLoading.showError("Error is: $e");
    } finally {
      EasyLoading.dismiss();
    }
  }

  void toggleSelection(int index) {
    selectedItems[index] = !selectedItems[index];
    selectedItems.refresh();
  }

  void increment(int index) {
    quantities[index]++;
    quantities.refresh();
  }

  void decrement(int index) {
    if (quantities[index] > 1) {
      quantities[index]--;
      quantities.refresh();
    }
  }

  // cart delete.............................................

  Future<void> deleteCart(String productId) async {
    EasyLoading.show(status: 'Loading...');
    try {
      final response = await NetworkCaller().deleteRequest(
        "${ApiEndPoints.deleteCart}?productId=$productId",
        token: StorageService().getData('accessToken'),
      );

      if (response.isSuccess) {
        allCartModel.removeWhere(
          (item) => item.id == productId,
        ); 
        selectedItems.removeAt(0);
        quantities.removeAt(0);

        EasyLoading.showSuccess("Cart delete success");
      } else {
        Get.snackbar("Error", "Failed delete cart");
      }
    } catch (e) {
      EasyLoading.showError("Error is: $e");
    } finally {
      EasyLoading.dismiss();
    }
  }
}
