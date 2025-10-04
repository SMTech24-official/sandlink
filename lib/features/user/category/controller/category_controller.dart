import 'dart:developer';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:sandlink/core/config/api_end_points/api_end_points.dart';
import 'package:sandlink/core/network/network_caller.dart';
import 'package:sandlink/core/services/DBServices/local_db_services/storage_service.dart';
import 'package:sandlink/features/user/search/model/get_all_products.model.dart';

class CategoryController extends GetxController {
  final getAllProduct = <GetAllProduct>[].obs;

  Future<void> fatchcategoryProducts(String id) async {
    EasyLoading.show(status: 'Loading...');
    try {
      final token = StorageService().getData('accessToken');
      final url = "${ApiEndPoints.allProducts}?limit=100&categoryId=$id";
      final response = await NetworkCaller().getRequest(url, token: token);

      if (response.isSuccess) {
        //final productData = ProductData.fromJson(response.responseData['result']);

        var getdata = response.responseData['result'] as List;
        getAllProduct.value = getdata
            .map((e) => GetAllProduct.fromJson(e))
            .toList();

        //getAllProduct.value = productData.result;

        log("Products loaded: ${getAllProduct.length}");
      } else {
        Get.snackbar("Error", "Failed to load products");
      }
    } catch (e) {
      EasyLoading.showError("Error: $e");
    } finally {
      EasyLoading.dismiss();
    }
  }
}
