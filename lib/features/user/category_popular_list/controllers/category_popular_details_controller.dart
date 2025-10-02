import 'dart:developer';

import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:sandlink/core/config/api_end_points/api_end_points.dart';
import 'package:sandlink/core/network/network_caller.dart';
import 'package:sandlink/core/services/DBServices/local_db_services/storage_service.dart';
import 'package:sandlink/features/user/category_popular_list/model/product_details_model.dart';
import 'package:sandlink/features/user/home/controllers/user_home_controller.dart';
import 'package:sandlink/features/user/home/model/most_populer_product.dart';
import '../model/reviews_model.dart';

class CategoryPopularDetailsController extends GetxController {
  final homecontroller = Get.put(UserHomeController());
  final product = Get.arguments as MostProductResult;

  //Details Carousel Slider //
  var currentPage = 0.obs;
  final List<String> images = [
    'https://www.figma.com/file/jNz7l61vmikt0kYyCBqz6X/image/7fb4ff2ac9294f42624fecf54617a99c024f8170',
    'https://www.figma.com/file/jNz7l61vmikt0kYyCBqz6X/image/7fb4ff2ac9294f42624fecf54617a99c024f8170',
    'https://www.figma.com/file/jNz7l61vmikt0kYyCBqz6X/image/7fb4ff2ac9294f42624fecf54617a99c024f8170',
  ];

  // Description Expanded false //
  var isExpanded = false.obs;

  void toggle() {
    isExpanded.value = !isExpanded.value;
  }

  // Reviews
  final List<ReviewsModel> reviewsList = [
    ReviewsModel(
      name: 'Mike Johnson',
      days: '2 days ago',
      rating: 5,
      title: '''Excellent quality sand. Perfect for my concrete project.''',
    ),
    ReviewsModel(
      name: 'Mike Johnson',
      days: '2 days ago',
      rating: 5,
      title: '''Excellent quality sand. Perfect for my concrete project.''',
    ),
    ReviewsModel(
      name: 'Mike Johnson',
      days: '2 days ago',
      rating: 5,
      title: '''Excellent quality sand. Perfect for my concrete project.''',
    ),
    ReviewsModel(
      name: 'Mike Johnson',
      days: '2 days ago',
      rating: 5,
      title: '''Excellent quality sand. Perfect for my concrete project.''',
    ),
    ReviewsModel(
      name: 'Mike Johnson',
      days: '2 days ago',
      rating: 5,
      title: '''Excellent quality sand. Perfect for my concrete project.''',
    ),
    ReviewsModel(
      name: 'Mike Johnson',
      days: '2 days ago',
      rating: 5,
      title: '''Excellent quality sand. Perfect for my concrete project.''',
    ),
    ReviewsModel(
      name: 'Mike Johnson',
      days: '2 days ago',
      rating: 5,
      title: '''Excellent quality sand. Perfect for my concrete project.''',
    ),
  ];

  final productdetails = <Data>[].obs;

  Future<void> getrProductdetails() async {
    EasyLoading.show(status: 'Loading...');
    try {
      final response = await NetworkCaller().getRequest(
        ApiEndPoints.productdetails,
      );

      if (response.isSuccess) {
        var getdata = response.responseData as List;

        // Map JSON to model
        productdetails.value = getdata.map((e) => Data.fromJson(e)).toList();

        log("Popular loaded: $getdata");
      } else {
        Get.snackbar("Error", "Failed to load categories");
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

      final url = "${ApiEndPoints.addtocard}?productId=$productid&quantity=1";

      final response = await NetworkCaller().postRequest(
        url,
        body: {},
        token: StorageService().getData('accessToken'),
      );

      if (response.isSuccess) {
        EasyLoading.showSuccess('Add to card Successfully');
      } else if (response.statusCode == 400) {
        EasyLoading.show(status: response.errorMessage);
      } else {
        EasyLoading.show(status: response.errorMessage);
      }
    } catch (e) {
      EasyLoading.showError('Registration failed. Try again.');
    } finally {
      EasyLoading.dismiss();
    }
  }
}
