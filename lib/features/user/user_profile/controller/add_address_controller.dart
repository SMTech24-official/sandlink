import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:sandlink/core/config/api_end_points/api_end_points.dart';
import 'package:sandlink/core/network/network_caller.dart';
import 'package:sandlink/core/services/DBServices/local_db_services/storage_service.dart';
import 'package:sandlink/features/user/user_profile/controller/save_address_controller.dart';

class AddAddressController extends GetxController {
  final addresskey = GlobalKey<FormState>();
  final controller = Get.put(AddressController());
  final addAddressLocationNameController = TextEditingController();
  final addAddressController = TextEditingController();

  @override
  void onClose() {
    addAddressLocationNameController.dispose();
    addAddressController.dispose();
    super.onClose();
  }

  Future<void> addAddress() async {
    if (!addresskey.currentState!.validate()) return;

    EasyLoading.show(status: "Saving...");

    try {
      String locationName = addAddressLocationNameController.text.trim();
      String address = addAddressController.text.trim();

      final body = {"locationType": locationName, "address": address};

      final String token = StorageService().getData('accessToken');

      final response = await NetworkCaller().postRequest(
        ApiEndPoints.addAddress,
        body: body,
        token: token,
      );

      // ✅ Handle response
      if (response.statusCode == 201) {
        EasyLoading.showSuccess("Address added successfully");

        // Save address ID locally
        String addressId = response.responseData['id'] ?? "";
        await StorageService().saveData('id', addressId);

        if (kDebugMode) {
          print("Address ID ..................$addressId");
        }
        await controller.getAddress(addressId);
        // Clear fields
        addAddressLocationNameController.clear();
        addAddressController.clear();

        Get.back();
      } else {
        // Handle errors
        EasyLoading.showError(
          response.responseData["message"] ?? "Failed to add address",
        );

        if (kDebugMode) {
          print("Error Response: ${response.responseData}");
        }
      }
    } catch (e) {
      EasyLoading.showError("Error: $e");

      if (kDebugMode) {
        print("Exception: $e");
      }
    } finally {
      EasyLoading.dismiss();
    }
  }
}
