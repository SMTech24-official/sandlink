import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:sandlink/core/services/DBServices/local_db_services/storage_service.dart';
import 'package:sandlink/core/network/network_caller.dart';
import 'package:sandlink/core/config/api_end_points/api_end_points.dart';
import 'package:sandlink/features/user/user_profile/model/address_model.dart';

class AddressController extends GetxController {
  final String? addressid = StorageService().getData('id');

  var addressResponse = Rx<AddressData?>(null);
  @override
  void onInit() {
    super.onInit();
    if (addressid != null) {
      getAddress(addressid!);
    } else {
      EasyLoading.showError("Address ID not found");
    }
  }

  Future<void> getAddress(String? addressId) async {
    EasyLoading.show(status: "Loading...");

    try {
      final response = await NetworkCaller().getRequest(
        "${ApiEndPoints.getAddress}/$addressId",
        token: StorageService().getData('accessToken'),
      );

      if (response.isSuccess) {
        addressResponse.value = AddressData.fromJson(response.responseData);
        EasyLoading.dismiss();
      } else {
        EasyLoading.showError(response.errorMessage);
      }
    } catch (e) {
      EasyLoading.showError("Error: $e");
    } finally {
      EasyLoading.dismiss();
    }
  }

  Future<void> deleteAddress(String? addressId) async {
    EasyLoading.show(status: 'Deleting...');

    try {
      final response = await NetworkCaller().deleteRequest(
        "${ApiEndPoints.deleteadress}/$addressId",
        token: StorageService().getData('accessToken'),
        body: {}, // send empty JSON instead of null
      );

      EasyLoading.dismiss();

      // Success for 200/201/204
      if (response.isSuccess ||
          response.statusCode == 200 ||
          response.statusCode == 201 ||
          response.statusCode == 204) {
        if (addressResponse.value?.id == addressId) {
          addressResponse.value = null;
        }
        EasyLoading.showSuccess('Address deleted successfully');
        return;
      }

      // Handle errors safely
      final message =
          (response.responseData != null &&
              response.responseData is Map &&
              response.responseData['message'] != null)
          ? response.responseData['message']
          : 'Failed to delete address';
      EasyLoading.showError(message);
    } catch (e) {
      EasyLoading.dismiss();
      EasyLoading.showError('Something went wrong');
      if (kDebugMode) print('Delete address error: $e');
    }
  }
}
