import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:sandlink/core/config/api_end_points/api_end_points.dart';
import 'package:sandlink/core/network/network_caller.dart';
import 'package:sandlink/core/services/DBServices/local_db_services/storage_service.dart';
import 'package:sandlink/features/user/user_profile/model/address_model.dart';

class EditAddressController extends GetxController {
  final editAddressLocationNameController = TextEditingController();
  final editAddressController = TextEditingController();

  late AddressData data;

  @override
  void onInit() {
    super.onInit();
    data = Get.arguments as AddressData; // cast to your model
    editAddressLocationNameController.text = data.locationType;
    editAddressController.text = data.address;
  }

  Future<void> saveChanges(String? addressId) async {
    if (addressId == null) { 
      EasyLoading.showError("Address ID not found");
      return;
    }

    final updatedAddress = {
      "locationType": editAddressLocationNameController.text,
      "address": editAddressController.text,
    };

    try {
      EasyLoading.show(status: "Updating...");
      final String token = StorageService().getData('token');

      final response = await NetworkCaller().putRequest(
        "${ApiEndPoints.updateAddress}/$addressId", // Use the ID in URL
        body: updatedAddress,
        token: token,
      );

      EasyLoading.dismiss();

      if (response.isSuccess) {
        Get.back(result: updatedAddress); // return updated data
        EasyLoading.showSuccess("Address updated successfully!");
      } else {
        EasyLoading.showError("Failed to update address");
      }
    } catch (e) {
      EasyLoading.dismiss();
      EasyLoading.showError("Something went wrong: $e");
      if (kDebugMode) {
        print("PUT Error: $e");
      }
    }
  }

  @override
  void onClose() {
    editAddressLocationNameController.dispose();
    editAddressController.dispose();
    super.onClose();
  }
}
