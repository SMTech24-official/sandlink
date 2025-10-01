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
        body: {},
      );

      if (response.isSuccess) {
        if (addressResponse.value?.id == addressId) {
          addressResponse.value = null;
        }
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
