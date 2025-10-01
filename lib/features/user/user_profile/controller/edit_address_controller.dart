import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:sandlink/core/network/network_caller.dart';
import 'package:sandlink/core/config/api_end_points/api_end_points.dart';
import 'package:sandlink/core/services/DBServices/local_db_services/storage_service.dart';

class EditAddressController extends GetxController {
  final editAddressLocationNameController = TextEditingController();
  final editAddressController = TextEditingController();

  @override
  void onClose() {
    editAddressLocationNameController.dispose();
    editAddressController.dispose();
    super.onClose();
  }

  Future<void> saveChanges(String addressId) async {
    final updatedAddress = {
      "locationType": editAddressLocationNameController.text,
      "address": editAddressController.text,
    };

    try {
      EasyLoading.show(status: "Updating...");
      final String token = StorageService().getData('token');
      final response = await NetworkCaller().putRequest(
        ApiEndPoints.updateAddress + addressId,
        body: updatedAddress,
        token: token,
      );

      EasyLoading.dismiss();

      if (response.statusCode == 201 || response.statusCode == 200) {
        EasyLoading.showSuccess("Address updated successfully!");
        Get.back(
          result: updatedAddress,
        ); // return updated data to previous screen
      } else {
        EasyLoading.showError("Failed to update address");
      }
    } catch (e) {
      EasyLoading.dismiss();
      EasyLoading.showError("Something went wrong: ");
      if (kDebugMode) {
        print("PUT Error: $e");
      }
    }
  }
}
