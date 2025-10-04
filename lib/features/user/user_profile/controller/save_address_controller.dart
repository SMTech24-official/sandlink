import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:sandlink/core/services/DBServices/local_db_services/storage_service.dart';
import 'package:sandlink/core/network/network_caller.dart';
import 'package:sandlink/core/config/api_end_points/api_end_points.dart';
import 'package:sandlink/features/user/user_profile/model/address_model.dart';

class AddressController extends GetxController {
  var addresses = <AddressData>[].obs; // Observable list

  @override
  void onInit() {
    super.onInit();
    getAddress();
  }

  Future<void> getAddress() async {
    EasyLoading.show(status: "Loading...");

    try {
      final response = await NetworkCaller().getRequest(
        ApiEndPoints.getAddress,
        token: StorageService().getData('accessToken'),
      );

      if (response.isSuccess) {
        // Use the full response map
        final addressResponse = AddressResponseModel.fromJson(
          response.responseData['result'],
        );

        // Assign the list to the observable
        addresses.value = addressResponse.data?.result ?? [];

        if (kDebugMode) print("✅ Loaded ${addresses.length} addresses");
      } else {
        EasyLoading.showError(response.errorMessage);
      }
    } catch (e) {
      EasyLoading.showError("Error: $e");
      if (kDebugMode) print('Get address error: $e');
    } finally {
      EasyLoading.dismiss();
    }
  }

  // Delete a specific address
  Future<void> deleteAddress(String addressId) async {
    EasyLoading.show(status: 'Deleting...');

    try {
      final response = await NetworkCaller().deleteRequest(
        "${ApiEndPoints.deleteadress}/$addressId",
        token: StorageService().getData('accessToken'),
        body: {},
      );

      if (response.isSuccess) {
        // Remove from the observable list
        addresses.removeWhere((element) => element.id == addressId);
        EasyLoading.showSuccess('Address deleted successfully');
        return;
      }

      EasyLoading.showError("Failed to delete address");
    } catch (e) {
      EasyLoading.showError('Something went wrong');
      if (kDebugMode) print('Delete address error: $e');
    } finally {
      EasyLoading.dismiss();
    }
  }
}
