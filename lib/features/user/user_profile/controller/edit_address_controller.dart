import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:sandlink/core/network/network_caller.dart';
import 'package:sandlink/core/config/api_end_points/api_end_points.dart';
import 'package:sandlink/core/services/DBServices/local_db_services/storage_service.dart';
import 'package:sandlink/features/user/user_profile/controller/save_address_controller.dart';

class EditAddressController extends GetxController {
  final editAddressLocationNameController = TextEditingController();
  final editAddressController = TextEditingController();
  final controller = Get.put(AddressController());
  Future<void> saveChanges(String addressId) async {
    try {
      EasyLoading.show(status: "Updating...");
      final String token = StorageService().getData('accessToken');
      final response = await NetworkCaller().patchRequest(
        "${ApiEndPoints.updateAddress}/$addressId",
        body: {
          "locationType": editAddressLocationNameController.text,
          "address": editAddressController.text,
        },
        token: token,
      );
      if (response.isSuccess) {
        EasyLoading.showSuccess("Address updated successfully!");
        await controller.getAddress(addressId);
        Get.back();
      } else {
        EasyLoading.showError("Failed to update address");
      }
    } catch (e) {
      EasyLoading.showError("Something went wrong: ");
      if (kDebugMode) {
        print("PATCH Error: $e");
      }
    } finally {
      EasyLoading.dismiss();
    }
  }
}
