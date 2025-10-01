import 'dart:developer';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:sandlink/core/config/api_end_points/api_end_points.dart';
import 'package:sandlink/core/services/DBServices/local_db_services/storage_service.dart';
import 'package:sandlink/features/user/user_profile/controller/user_profile_controller.dart';

class EditUserProfileController extends GetxController {
  final userInfoController = Get.put(UserProfileController());

  final fullNameController = TextEditingController();
  final emailController = TextEditingController();
  final numberController = TextEditingController();

  final userEmail = StorageService().getData('email');

  final RxBool isUploadingImage = false.obs;
  final profileImageUrl = ''.obs;

  var profileImage = Rx<File?>(null);

  /// Pick image from gallery
  pickImageFromGallery() async {
    try {
      final pickedFile = await ImagePicker().pickImage(
        source: ImageSource.gallery,
      );

      if (pickedFile != null) {
        profileImage.value = File(pickedFile.path);
        log("ImagePath: ${profileImage.value!.path}");
      }
    } catch (e) {
      if (kDebugMode) {
        print("Error picking image: $e");
      }
    }
  }

  /// Update user profile API call
  Future<void> updateProfile() async {
    EasyLoading.show(status: "Loading...");
    try {
      final token = StorageService().getData('accessToken');
      if (token == null || token.toString().isEmpty) {
        EasyLoading.showError("No token found!");
        return;
      }

      var uri = Uri.parse(ApiEndPoints.editProfileUpdate);
      var request = http.MultipartRequest("PATCH", uri);

      // ✅ Authorization header (Bearer prefix is required)
      request.headers['Authorization'] = "Bearer $token";
      request.headers['Accept'] = "application/json";

      log("Request Headers: ${request.headers}");

      // ✅ Attach image if user selected one
      if (profileImage.value != null) {
        request.files.add(
          await http.MultipartFile.fromPath("image", profileImage.value!.path),
        );
      }

      // ✅ Send as separate fields (if backend expects multipart form-data)
      request.fields["name"] = fullNameController.text.trim();
      request.fields["phoneNumber"] = numberController.text.trim();

      // ✅ If backend requires JSON body inside a single field,
      // uncomment the following instead:
      /*
      request.fields["bodyData"] = jsonEncode({
        "name": fullNameController.text.trim(),
        "phoneNumber": numberController.text.trim(),
      });
      */

      // ✅ Send request
      var streamedResponse = await request.send();
      var responseBody = await streamedResponse.stream.bytesToString();

      log("Edit Response: $responseBody");

      if (streamedResponse.statusCode == 200 ||
          streamedResponse.statusCode == 201) {
        await userInfoController.getUserProfileData();
        EasyLoading.showSuccess("Profile updated successfully");
        Get.back();
      } else {
        EasyLoading.showError("Failed: $responseBody");
      }
    } catch (e) {
      EasyLoading.showError("Error: $e");
    } finally {
      EasyLoading.dismiss();
    }
  }

  @override
  void onInit() {
    super.onInit();
    fullNameController.text = userInfoController.getUserName.value;
    numberController.text = userInfoController.getUserphone.value;
    emailController.text = userInfoController.getUserEmail.value;
  }
}
