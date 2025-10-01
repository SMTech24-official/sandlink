import 'dart:convert';
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
  final token = StorageService().getData('token');

  final RxBool isUploadingImage = false.obs;
  final profileImageUrl = ''.obs;

  var profileImage = Rx<File?>(null);

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

  Future<void> updateProfile() async {
    EasyLoading.show(status: "Loading...");
    try {
      var uri = Uri.parse(ApiEndPoints.editProfileUpdate);

      var request = http.MultipartRequest("PATCH", uri);
      // ✅ Token header add
      request.headers['Authorization'] = "$token";
      request.headers['Accept'] = "application/json";
      // ✅ Image add
      if (profileImage.value != null) {
        request.files.add(
          await http.MultipartFile.fromPath("image", profileImage.value!.path),
        );
      }

      // ✅ bodyData add as JSON string
      request.fields["bodyData"] = jsonEncode({
        "name": fullNameController.text.trim(),
        "phoneNumber": numberController.text.trim(),
      });

      // ✅ Send request
      var streamedResponse = await request.send();
      var responseBody = await streamedResponse.stream.bytesToString();

      log("Edit Response: $responseBody");

      if (streamedResponse.statusCode == 201 ||
          streamedResponse.statusCode == 200) {
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
