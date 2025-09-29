import 'dart:convert';
import 'dart:developer';
import 'dart:io';


import 'package:flutter/cupertino.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:sandlink/core/config/api_end_points/api_end_points.dart';
import 'package:sandlink/core/network/network_caller.dart';
import 'package:sandlink/core/services/DBServices/local_db_services/storage_service.dart';
import 'package:sandlink/features/user/user_profile/controller/user_profile_controller.dart';

import '../model/edit_user_profile_model.dart';


class EditUserProfileController extends GetxController {

  final userInfoController = Get.put(UserProfileController());

  final fullNameController = TextEditingController();
  final emailController = TextEditingController();
  final numberController = TextEditingController();

  final userEmail = StorageService().getData('email');
  final token = StorageService().getData('token');


  final RxBool isUploadingImage = false.obs;
  final profileImageUrl = ''.obs;


  // createGMap() async {
  //   try {
  //     isLoading.value = true;
  //
  //     var uri = Uri.parse(ApiUrl.baseUrl + ApiUrl.api + ApiUrl.createGMap);
  //
  //     var reuqest = await http.MultipartRequest("POST", uri);
  //
  //     reuqest.fields['name'] = titleController.text;
  //     reuqest.fields['details'] = detailsController.text;
  //
  //     if (kIsWeb) {
  //       final bytes = await selectedImage.value!.readAsBytes();
  //       final filename = await selectedImage.value!.name;
  //       reuqest.files.add(await http.MultipartFile.fromBytes('mapPhoto', bytes,
  //           filename: filename));
  //     } else {
  //       reuqest.files.add(await http.MultipartFile.fromPath(
  //           'mapPhoto', selectedImage.value!.path));
  //     }
  //
  //     final response = await reuqest.send();
  //     if (response.statusCode == 201) {
  //       final resbody = await response.stream.bytesToString();
  //       final decoded = await jsonDecode(resbody);
  //       final createModel = await CreateGMapModel.fromJson(decoded);
  //       await Future.delayed(Duration(seconds: 2));
  //       Get.back();
  //       Get.snackbar("G Map", "${createModel.message}",
  //           colorText: Colors.white);
  //       await getGMap();
  //       titleController.clear();
  //       detailsController.clear();
  //       selectedImage.value = null;
  //     } else {
  //       Get.snackbar("G Map", "Create Failed", colorText: Colors.white);
  //     }
  //   } catch (e) {
  //     errorMessage.value = e.toString();
  //     Get.snackbar("Error", "${e.toString()}", colorText: Colors.white);
  //   } finally {
  //     isLoading.value = false;
  //   }
  // }

  // Update //]



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
      print("Error picking image: $e");
    }
  }


  // Future<void> updateUserProfile() async {
  //   EasyLoading.show(status: 'Loading...');
  //
  //   try {
  //     var uri = Uri.parse(ApiEndPoints.editProfileUpdate);
  //
  //     final request = http.MultipartRequest('PATCH', uri);
  //     request.headers['Authorization'] = token;
  //
  //     // Add fields
  //     request.fields['name'] = updateNameController.text.trim();
  //     request.fields['phoneNumber'] = updatePhoneController.text.trim();
  //
  //     // Add image if available
  //     if (profileImage.value != null) {
  //       request.files.add(await http.MultipartFile.fromPath(
  //         'image',
  //         profileImage.value!.path,
  //       ));
  //     }
  //
  //
  //
  //     final response = await request.send();
  //     if (response.statusCode == 201) {
  //       final resbody = await response.stream.bytesToString();
  //       final decoded = await jsonDecode(resbody);
  //      // final createModel = await EditUserProfileModelData.fromJson(decoded);
  //       await Future.delayed(Duration(seconds: 2));
  //       Get.back();
  //       EasyLoading.show(status: decoded);
  //
  //
  //     } else {
  //       EasyLoading.showError('Upload Failed');
  //     }
  //   } catch (e) {
  //     EasyLoading.dismiss();
  //     EasyLoading.showError("Something went wrong: $e");
  //   }
  // }


  Future<void> UpdateProfile()async{
    EasyLoading.show(status: "Loading...");
    try{

      var editBody = {
        'image':profileImage.value?.path,
        'name':fullNameController.text.trim(),
        'phoneNumber':numberController.text.trim(),


      };

      final response = await NetworkCaller().patchRequest(
        ApiEndPoints.editProfileUpdate,
        body: editBody,
        token: token,
      );
       log('Edit${response.responseData}');
      if(response.isSuccess){

        EasyLoading.dismiss();
        EasyLoading.showSuccess(response.responseData['message'] ?? "Success");



      }



    }
        catch(e){
      EasyLoading.dismiss();
      EasyLoading.showError('Error:${e}');

        }
    finally{
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


//}
    //    catch(e){
   //   EasyLoading.dismiss();
   //   EasyLoading.showError('Error:$e');

  //  finally{
   //   EasyLoading.dismiss();
   // }













