import 'dart:developer';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:sandlink/core/config/api_end_points/api_end_points.dart';
import '../../../../core/app_colors/app_colors.dart';
import '../../../../core/config/constants/assets_paths/icons_assets_paths.dart';
import '../../../../core/network/network_caller.dart';
import '../../../../core/services/DBServices/local_db_services/storage_service.dart';

import '../model/get_user_profile_model.dart';
import '../model/profile_menu_item.dart';

class UserProfileController extends GetxController {
  final userEmail = StorageService().getData('email');
  final username = StorageService().getData('name');
  final userToken = StorageService().getData('accessToken');

  final List<ProfileMenuItem> profilemenuList = [
    ProfileMenuItem(
      leadingImage: IconsAssetsPaths.instance.edits_icon,
      title: 'Edit Profile',
      bgColor: AppColors.lightGreen3,
      trailingImage: IconsAssetsPaths.instance.rightarrow_Icon,
    ),
    ProfileMenuItem(
      leadingImage: IconsAssetsPaths.instance.doc_icon,
      title: 'My Orders',
      trailingImage: IconsAssetsPaths.instance.rightarrow_Icon,
      bgColor: AppColors.lightGreen3,
    ),
    ProfileMenuItem(
      leadingImage: IconsAssetsPaths.instance.send_icon,
      title: 'Saved Address',
      trailingImage: IconsAssetsPaths.instance.rightarrow_Icon,
      bgColor: AppColors.lightGreen3,
    ),
    ProfileMenuItem(
      leadingImage: IconsAssetsPaths.instance.joind_icon,
      title: 'Join Affiliates',
      trailingImage: IconsAssetsPaths.instance.rightarrow_Icon,
      bgColor: AppColors.lightGreen3,
    ),
    ProfileMenuItem(
      leadingImage: IconsAssetsPaths.instance.delete_icon,
      title: 'Delete Account',
      trailingImage: IconsAssetsPaths.instance.rightarrow_Icon,
      bgColor: AppColors.lightGreen3,
    ),
    ProfileMenuItem(
      leadingImage: IconsAssetsPaths.instance.logout_Icon,
      title: 'Logout',
      trailingImage: IconsAssetsPaths.instance.rightarrow_Icon,
      bgColor: AppColors.redlightColor,
    ),
  ];

  @override
  void onInit() {
    getUserProfileData();
    super.onInit();
  }

  final token = StorageService().getData('token');

  var getUserName = ''.obs;
  var getUserEmail = ''.obs;
  var getUserProfile = ''.obs;
  var getUserphone = ''.obs;

  getUserProfileData() async {
    EasyLoading.show(status: 'Loading...');
    try {
      final response = await NetworkCaller().getRequest(
        ApiEndPoints.getUserProfile,
        token: token,
      );
      if (response.isSuccess) {
        var getdata = Data.fromJson(response.responseData);
        getUserName.value = getdata.name ?? "N/A";
        getUserEmail.value = getdata.email ?? "N/A";
        getUserProfile.value =
            getdata.image ??
            "https://cdn-icons-png.flaticon.com/512/180/180644.png";
        getUserphone.value = getdata.phoneNumber ?? "";

        log('Show Data:${getdata.email}');
      }
    } catch (e) {
      EasyLoading.dismiss();
      EasyLoading.showError('Error:$e');
    } finally {
      EasyLoading.dismiss();
    }
  }

  //
  //   Rx<XFile?> selectedImage = Rx<XFile?>(null);
  //
  //   Future<void> pickImage() async {
  //     final XFile? pickedFile =
  //     await ImagePicker().pickImage(source: ImageSource.gallery);
  //     if (pickedFile != null) {
  //       selectedImage.value = pickedFile;
  //     }
  //   }
  //
  //   // createGMap() async {
  //   //   try {
  //   //     isLoading.value = true;
  //   //
  //   //     var uri = Uri.parse(ApiUrl.baseUrl + ApiUrl.api + ApiUrl.createGMap);
  //   //
  //   //     var reuqest = await http.MultipartRequest("POST", uri);
  //   //
  //   //     reuqest.fields['name'] = titleController.text;
  //   //     reuqest.fields['details'] = detailsController.text;
  //   //
  //   //     if (kIsWeb) {
  //   //       final bytes = await selectedImage.value!.readAsBytes();
  //   //       final filename = await selectedImage.value!.name;
  //   //       reuqest.files.add(await http.MultipartFile.fromBytes('mapPhoto', bytes,
  //   //           filename: filename));
  //   //     } else {
  //   //       reuqest.files.add(await http.MultipartFile.fromPath(
  //   //           'mapPhoto', selectedImage.value!.path));
  //   //     }
  //   //
  //   //     final response = await reuqest.send();
  //   //     if (response.statusCode == 201) {
  //   //       final resbody = await response.stream.bytesToString();
  //   //       final decoded = await jsonDecode(resbody);
  //   //       final createModel = await CreateGMapModel.fromJson(decoded);
  //   //       await Future.delayed(Duration(seconds: 2));
  //   //       Get.back();
  //   //       Get.snackbar("G Map", "${createModel.message}",
  //   //           colorText: Colors.white);
  //   //       await getGMap();
  //   //       titleController.clear();
  //   //       detailsController.clear();
  //   //       selectedImage.value = null;
  //   //     } else {
  //   //       Get.snackbar("G Map", "Create Failed", colorText: Colors.white);
  //   //     }
  //   //   } catch (e) {
  //   //     errorMessage.value = e.toString();
  //   //     Get.snackbar("Error", "${e.toString()}", colorText: Colors.white);
  //   //   } finally {
  //   //     isLoading.value = false;
  //   //   }
  //   // }
  //
  //   // Update //]
  //
  //   final updateNameController = TextEditingController();
  //   final updatePhoneController = TextEditingController();
  //
  //   var profileImage = Rx<File?>(null);
  //
  //   final Rx<File?> pickedImage = Rx<File?>(null);
  //   final RxBool isUploadingImage = false.obs;
  //   final profileImageUrl = ''.obs;
  //
  //   Future<void> pickImageFromGallery() async {
  //     try {
  //       final pickedFile = await ImagePicker().pickImage(
  //         source: ImageSource.gallery,
  //         imageQuality: 80,
  //       );
  //       if (pickedFile != null) pickedImage.value = File(pickedFile.path);
  //     } catch (e) {
  //       _showErrorSnackbar(
  //         'Image Selection Error',
  //         'Failed to pick image: ${e.toString()}',
  //       );
  //     }
  //   }
  //
  //   Future<void> updateInstructorProfile() async {
  //     // if (!_validateInputs()) return;
  //
  //     // if (website.text.isNotEmpty &&
  //     //     !website.text.startsWith(RegExp(r'https?://'))) {
  //     //   website.text = 'https://${website.text.trim()}';
  //     // }
  //
  //     var token = StorageService().getData('token');
  //     if (token == null) {
  //       _showErrorSnackbar('auth_error_no_token'.tr, 'No access token found'.tr);
  //       return;
  //     }
  //
  //     try {
  //      // isLoading.value = true;
  //       EasyLoading.show(status: "updating_profile".tr);
  //
  //       if (pickedImage.value != null) {
  //         // final success = await uploadProfileImage();
  //         // if (!success) {
  //         //   EasyLoading.dismiss();
  //         //   return;
  //         // }
  //       }
  //
  //       final requestBody = {
  //         "name": updatePhoneController.text.trim(),
  //         "phone": updatePhoneController.text.trim(),
  //
  //         if (profileImageUrl.isNotEmpty) "photo": profileImageUrl.value,
  //       };
  //
  //       final response = await NetworkCaller().putRequest(
  //       ApiEndPoints.editProfileUpdate,
  //         body: requestBody,
  //         token: token,
  //       );
  //       if (response.isSuccess) {
  //         EasyLoading.showSuccess("Profile updated successfully");
  //         Get.back();
  //        // await instructorProfile.fetchInstructorProfile();
  //       } else {
  //         throw Exception(''.tr);
  //       }
  //     } catch (e) {
  //       EasyLoading.showError("".tr);
  //       if (kDebugMode) print('Update profile error: $e');
  //     } finally {
  //     //  isLoading.value = false;
  //     }
  //   }
  //
  //   // MediaType _getContentType(String filePath) {
  //   //   if (filePath.endsWith('.png')) return MediaType('image', 'png');
  //   //   if (filePath.endsWith('.jpeg') || filePath.endsWith('.jpg')) {
  //   //     return MediaType('image', 'jpeg');
  //   //   }
  //   //   return MediaType('application', 'octet-stream');
  //   // }
  //
  //   void _showErrorSnackbar(String title, String message) {
  //     Get.snackbar(title, message, snackPosition: SnackPosition.TOP);
  //     EasyLoading.showError(message);
  //   }
  //
  //
  //
  //
  // // updateUserProfile() async {
  //   //   try {
  //   //
  //   //
  //   //      var uri = Uri.parse(ApiEndPoints.editProfileUpdate);
  //   //
  //   //     var reuqest = await http.MultipartRequest("PATCH",uri );
  //   //
  //   //     reuqest.fields['name'] = updateNameController.text;
  //   //     reuqest.fields['phoneNumber'] = updatePhoneController.text;
  //   //
  //   //
  //   //       final bytes = await selectedImage.value!.readAsBytes();
  //   //       final filename = await selectedImage.value!.name;
  //   //       reuqest.files.add(await http.MultipartFile.fromBytes('image', bytes,
  //   //           filename: filename));
  //   //
  //   //       reuqest.files.add(await http.MultipartFile.fromPath(
  //   //           'image', selectedImage.value!.path));
  //   //
  //   //
  //   //     final response = await reuqest.send();
  //   //     if (response.statusCode == 200) {
  //   //       final resbody = await response.stream.bytesToString();
  //   //       final decoded = await jsonDecode(resbody);
  //   //       final createModel = await EditUserProfileModel.fromJson(decoded);
  //   //
  //   //       await Future.delayed(Duration(seconds: 2));
  //   //       Get.back();
  //   //       Get.snackbar("dds", "${createModel.message}",
  //   //           colorText: Colors.white);
  //   //
  //   //     } else {
  //   //       Get.snackbar("dddd", "Update", colorText: Colors.white);
  //   //     }
  //   //   } catch (e) {
  //   //    // errorMessage.value = e.toString();
  //   //     Get.snackbar("Error", "${e.toString()}", colorText: Colors.white);
  //   //   } finally {
  //   //   //  isLoading.value = false;
  //   //   }
  //   // }
}
