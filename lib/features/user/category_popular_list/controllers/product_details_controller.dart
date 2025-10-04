import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:sandlink/core/config/api_end_points/api_end_points.dart';
import 'package:sandlink/core/network/network_caller.dart';
import 'package:sandlink/core/services/DBServices/local_db_services/storage_service.dart';
import 'package:sandlink/features/user/category_popular_list/model/product_details_model.dart';

class ProductDetailsController extends GetxController {
  var currentPage = 0.obs;

  final productdetails = Rxn<Data>();

  // Reviews list getter
  List<Review> get reviewsList {
    return productdetails.value?.reviews ?? [];
  }

  // Average rating getter
  double get averageRating {
    final reviews = productdetails.value?.reviews ?? [];
    if (reviews.isEmpty) return 0.0;
    final total = reviews.fold<int>(0, (sum, item) => sum + (item.rating ?? 0));
    return total / reviews.length;
  }

  Future<void> getProductdetails(String productid) async {
    EasyLoading.show(status: 'Loading...');
    try {
      final response = await NetworkCaller().getRequest(
        "${ApiEndPoints.productdetails}/$productid",
      );

      if (response.isSuccess) {
        var getdata = response.responseData;
        productdetails.value = Data.fromJson(getdata);
      } else {
        Get.snackbar("Error", "Failed to load product details");
      }
    } catch (e) {
      EasyLoading.showError("Error: $e");
    } finally {
      EasyLoading.dismiss();
    }
  }

  Future<void> addtocard(String productid) async {
    try {
      EasyLoading.show(status: 'Add TO Card...');

      final url = "${ApiEndPoints.addtocard}?productId=$productid";

      final response = await NetworkCaller().postRequest(
        url,
        body: {},
        token: StorageService().getData('accessToken'),
      );

      if (response.isSuccess) {
        EasyLoading.showSuccess('Add to cart Successfully');
      } else if (response.statusCode == 400) {
        EasyLoading.show(status: response.errorMessage);
      } else {
        EasyLoading.show(status: response.errorMessage);
      }
    } catch (e) {
      EasyLoading.showError('Add to cart failed. Try again.');
    } finally {
      EasyLoading.dismiss();
    }
  }
}
