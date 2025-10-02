import 'dart:developer';
import 'package:flutter/foundation.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import 'package:get/get.dart';
import 'package:sandlink/core/config/api_end_points/api_end_points.dart';
import 'package:sandlink/core/network/network_caller.dart';

import 'package:sandlink/core/services/DBServices/local_db_services/storage_service.dart';
import '../../../common/splash/controller/choose_role_controller.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';

import '../model/categories_model.dart';
import '../model/most_populer_product.dart';

class UserHomeController extends GetxController {
  final loctionController = Get.put(ChooseRoleController());

  var currentPage = 0.obs;
  final List<String> images = [
    'https://www.figma.com/file/jNz7l61vmikt0kYyCBqz6X/image/7fb4ff2ac9294f42624fecf54617a99c024f8170',
    'https://www.figma.com/file/jNz7l61vmikt0kYyCBqz6X/image/7fb4ff2ac9294f42624fecf54617a99c024f8170',
    'https://www.figma.com/file/jNz7l61vmikt0kYyCBqz6X/image/7fb4ff2ac9294f42624fecf54617a99c024f8170',
    'https://www.figma.com/file/jNz7l61vmikt0kYyCBqz6X/image/7fb4ff2ac9294f42624fecf54617a99c024f8170',
  ];

  // var currentAddress = ''.obs;
  // var latitude = 0.0.obs;
  // var longitude = 0.0.obs;
  //
  // /// Get current location with permission check
  // Future<void> getCurrentLocation() async {
  //   try {
  //     bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
  //     if (!serviceEnabled) {
  //       Get.snackbar('Error', 'Location services are disabled.');
  //       return;
  //     }
  //
  //     LocationPermission permission = await Geolocator.checkPermission();
  //     if (permission == LocationPermission.denied) {
  //       permission = await Geolocator.requestPermission();
  //       if (permission == LocationPermission.denied) {
  //         Get.snackbar('Error', 'Location permission denied.');
  //         return;
  //       }
  //     }
  //
  //     if (permission == LocationPermission.deniedForever) {
  //       Get.snackbar('Error', 'Location permission denied forever.');
  //       return;
  //     }
  //
  //     Position position = await Geolocator.getCurrentPosition(
  //         desiredAccuracy: LocationAccuracy.high);
  //
  //     latitude.value = position.latitude;
  //     longitude.value = position.longitude;
  //
  //     await getAddressFromCoordinates(latitude.value, longitude.value);
  //   } catch (e) {
  //     currentAddress.value = "Unable to get location";
  //     print("Error getting location: $e");
  //   }
  // }
  //
  // /// Reverse geocode
  // Future<void> getAddressFromCoordinates(double lat, double lng) async {
  //   try {
  //     List<Placemark> placemarks = await placemarkFromCoordinates(lat, lng);
  //     if (placemarks.isNotEmpty) {
  //       Placemark place = placemarks[0];
  //       currentAddress.value ="${place.street}";
  //       // "${place.street}, ${place.locality}, ${place.postalCode}, ${place.country}";
  //     }
  //   } catch (e) {
  //     currentAddress.value = "Unknown location";
  //     print("Error getting address: $e");
  //   }
  // }

  var currentAddress = ''.obs;
  var latitude = 0.0.obs;
  var longitude = 0.0.obs;

  /// Get current location with permission check
  Future<void> getCurrentLocation() async {
    try {
      bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        Get.snackbar('Error', 'Location services are disabled.');
        return;
      }

      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          Get.snackbar('Error', 'Location permission denied.');
          return;
        }
      }

      if (permission == LocationPermission.deniedForever) {
        Get.snackbar('Error', 'Location permission denied forever.');
        return;
      }
      Position position = await Geolocator.getCurrentPosition(
        locationSettings: const LocationSettings(
          accuracy: LocationAccuracy.high,
        ),
      );

      latitude.value = position.latitude;
      longitude.value = position.longitude;

      await getAddressFromCoordinates(latitude.value, longitude.value);
    } catch (e) {
      currentAddress.value = "Unable to get location";
      if (kDebugMode) {
        print("Error getting location: $e");
      }
    }
  }

  /// Reverse geocode
  Future<void> getAddressFromCoordinates(double lat, double lng) async {
    try {
      List<Placemark> placemarks = await placemarkFromCoordinates(lat, lng);
      if (placemarks.isNotEmpty) {
        Placemark place = placemarks[0];
        currentAddress.value = "${place.street}";
        // "${place.street}, ${place.locality}, ${place.postalCode}, ${place.country}";
      }
    } catch (e) {
      currentAddress.value = "Unknown location";
      if (kDebugMode) {
        print("Error getting address: $e");
      }
    }
  }

  @override
  void onInit() {
    getCategories();
    getMostPopularProduct();
    super.onInit();
  }

  // Get Categories //

  final categoriesList = <Result>[].obs;

  Future<void> getCategories() async {
    EasyLoading.show(status: 'Loading...');
    try {
      final response = await NetworkCaller().getRequest(
        ApiEndPoints.categories,
      );

      if (response.isSuccess) {
        var getdata = response.responseData['result'] as List;

        // Map JSON to model
        categoriesList.value = getdata.map((e) => Result.fromJson(e)).toList();

        log("Categories loaded: $getdata");
        log("loaded: ");
      } else {
        Get.snackbar("Error", "Failed to load categories");
      }
    } catch (e) {
      EasyLoading.showError("Error: $e");
    } finally {
      EasyLoading.dismiss();
    }
  }

  final mostPopularProductList = <MostProductResult>[].obs;

  Future<void> getMostPopularProduct() async {
    EasyLoading.show(status: 'Loading...');
    try {
      final response = await NetworkCaller().getRequest(
        ApiEndPoints.mostPopular,
      );

      if (response.isSuccess) {
        var getdata = response.responseData as List;

        // Map JSON to model
        mostPopularProductList.value = getdata
            .map((e) => MostProductResult.fromJson(e))
            .toList();

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

  var userlocation = StorageService().getData('street');
}
