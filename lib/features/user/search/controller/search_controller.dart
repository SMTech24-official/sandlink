import 'dart:developer';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:sandlink/core/config/api_end_points/api_end_points.dart';
import 'package:sandlink/core/network/network_caller.dart';
import 'package:sandlink/features/user/search/model/get_all_products.model.dart';

class SearchingController extends GetxController {
  final getAllProduct = <GetAllProduct>[].obs;
  final search = ''.obs;
  final allProducts = <GetAllProduct>[].obs; 

  @override
  void onInit() {
    getAllProducts();
    super.onInit();
  }

  // Get filtered products based on search
  List<GetAllProduct> get filteredProducts {
    if (search.isEmpty) {
      return allProducts;
    }
    return allProducts.where((product) => 
      product.name.toLowerCase().contains(search.toLowerCase())
    ).toList();
  }

  Future<void> getAllProducts() async {
    EasyLoading.show(status: 'Loading...');
    try {
      final response = await NetworkCaller().getRequest(
        ApiEndPoints.allProducts,
      );

      if (response.isSuccess) {
        final productData = ProductData.fromJson(response.responseData);
        allProducts.value = productData.result;
        getAllProduct.value = productData.result; 
        
        log("✅ Products loaded: ${allProducts.length}");
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