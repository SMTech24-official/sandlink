// import 'package:flutter/cupertino.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter_easyloading/flutter_easyloading.dart';
// import 'package:get/get.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';
// import 'package:sandlink/core/config/api_end_points/api_end_points.dart';
// import 'package:sandlink/core/network/network_caller.dart';
// import 'package:sandlink/core/services/DBServices/local_db_services/storage_service.dart';
// import 'package:sandlink/features/user/user_profile/controller/user_profile_controller.dart';

// class PersonalInformationController extends GetxController {
//   final basickey = GlobalKey<FormState>();
//   final UserProfileController controller = Get.put(UserProfileController());

//   final nameController = TextEditingController();
//   final phoneController = TextEditingController();
//   final emailController = TextEditingController();
//   final shopNameController = TextEditingController();
//   final addressController = TextEditingController();

//   var addressText = ''.obs;
//   var addressSuggestions = <AddressSuggestion>[].obs;
//   var isAddressSelected = false.obs;

//   // Add success flag for OTP sending
//   var isOtpSentSuccessfully = false.obs;

//   final String googleApiKey = 'AIzaSyCG3pcwRKpeAxF1CSAgwKFVIwZzwwyyWjE';

//   @override
//   void onInit() {
//     super.onInit();
//     if (controller.getUserName.isNotEmpty) {
//       nameController.text = controller.getUserName.toString();
//       if (kDebugMode) {
//         print("✅ Phone number pre-filled: ${phoneController.text}");
//       }
//     }
//     if (controller.getUserphone.isNotEmpty) {
//       phoneController.text = controller.getUserphone.toString();
//       if (kDebugMode) {
//         print("✅ Phone number pre-filled: ${phoneController.text}");
//       }
//     }
//     if (controller.getUserEmail.isNotEmpty) {
//       emailController.text = controller.getUserEmail.toString();
//       if (kDebugMode) {
//         print("✅ Phone number pre-filled: ${phoneController.text}");
//       }
//     }

//     debounce<String>(addressText, (val) {
//       if (val.isNotEmpty && val.length >= 3 && !isAddressSelected.value) {
//         searchAddress(val);
//       } else if (isAddressSelected.value) {
//         isAddressSelected.value = false;
//       } else if (val.length < 3) {
//         addressSuggestions.clear();
//       }
//     }, time: Duration(milliseconds: 500));
//   }

//   var lat = 23.8103.obs;
//   var lon = 90.4125.obs;

//   GoogleMapController? googleMapController;

//   Future<void> searchAddress(String input) async {
//     try {
//       final url = Uri.parse(
//         'https://maps.googleapis.com/maps/api/place/autocomplete/json'
//         '?input=${Uri.encodeComponent(input)}'
//         '&key=$googleApiKey'
//         '&components=country:bd'
//         '&language=en',
//       );

//       final response = await http.get(url);

//       if (response.statusCode == 200) {
//         final data = json.decode(response.body);

//         if (data['status'] == 'OK') {
//           final predictions = data['predictions'] as List;

//           final List<AddressSuggestion> found = predictions.map((pred) {
//             return AddressSuggestion(
//               placeId: pred['place_id'],
//               title: pred['structured_formatting']['main_text'] ?? '',
//               subtitle: pred['structured_formatting']['secondary_text'] ?? '',
//               description: pred['description'] ?? '',
//               latitude: 0.0,
//               longitude: 0.0,
//             );
//           }).toList();

//           addressSuggestions.assignAll(found);
//         } else {
//           addressSuggestions.clear();
//         }
//       } else {
//         addressSuggestions.clear();
//       }
//     } catch (e) {
//       if (kDebugMode) {
//         print("Error fetching address suggestions: $e");
//       }
//       addressSuggestions.clear();
//     }
//   }

//   LatLng get currentLatLng => LatLng(lat.value, lon.value);

//   Future<void> selectSuggestion(AddressSuggestion suggestion) async {
//     try {
//       isAddressSelected.value = true;
//       addressController.text = suggestion.description;
//       addressText.value = suggestion.description;
//       addressSuggestions.clear();

//       final url = Uri.parse(
//         'https://maps.googleapis.com/maps/api/place/details/json'
//         '?place_id=${suggestion.placeId}'
//         '&fields=geometry'
//         '&key=$googleApiKey',
//       );

//       final response = await http.get(url);

//       if (response.statusCode == 200) {
//         final data = json.decode(response.body);

//         if (data['status'] == 'OK') {
//           final location = data['result']['geometry']['location'];
//           lat.value = location['lat'];
//           lon.value = location['lng'];

//           googleMapController?.animateCamera(
//             CameraUpdate.newLatLng(LatLng(lat.value, lon.value)),
//           );
//         }
//       }
//     } catch (e) {
//       if (kDebugMode) {
//         print("Error getting place details: $e");
//       }
//     }
//   }

//   Future<bool> phoneOtpSend() async {
//     // Reset success flag
//     isOtpSentSuccessfully.value = false;

//     // Validate form before proceeding
//     if (basickey.currentState != null && !basickey.currentState!.validate()) {
//       EasyLoading.showError('Please fill all required fields correctly');
//       return false;
//     }

//     // Validate phone number
//     if (phoneController.text.trim().isEmpty) {
//       EasyLoading.showError('Phone number is required');
//       return false;
//     }

//     EasyLoading.show(status: 'Sending OTP...');

//     try {
//       var url = ApiEndPoints.sendPhoneOtp;

//       final response = await NetworkCaller().patchRequest(
//         url,
//         body: {"phoneNumber": phoneController.text.trim()},
//         token: StorageService().getData('accessToken'),
//       );

//       EasyLoading.dismiss();

//       if (response.isSuccess) {
//         isOtpSentSuccessfully.value = true;
//         EasyLoading.showSuccess('OTP sent successfully');
//         return true;
//       } else {
//         isOtpSentSuccessfully.value = false;
//         EasyLoading.showError(response.errorMessage);
//         return false;
//       }
//     } catch (e) {
//       EasyLoading.dismiss();
//       isOtpSentSuccessfully.value = false;
//       EasyLoading.showError('Failed! Please try again');
//       if (kDebugMode) {
//         print("Error sending OTP: $e");
//       }
//       return false;
//     }
//   }

//   @override
//   void onClose() {
//     nameController.dispose();
//     phoneController.dispose();
//     emailController.dispose();
//     shopNameController.dispose();
//     addressController.dispose();
//     super.onClose();
//   }
// }

// class AddressSuggestion {
//   final String placeId;
//   final String title;
//   final String subtitle;
//   final String description;
//   final double latitude;
//   final double longitude;

//   AddressSuggestion({
//     required this.placeId,
//     required this.title,
//     required this.subtitle,
//     required this.description,
//     required this.latitude,
//     required this.longitude,
//   });
// }

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:sandlink/core/config/api_end_points/api_end_points.dart';
import 'package:sandlink/core/network/network_caller.dart';
import 'package:sandlink/core/services/DBServices/local_db_services/storage_service.dart';
import 'package:sandlink/features/user/user_profile/controller/user_profile_controller.dart';

class PersonalInformationController extends GetxController {
  final basickey = GlobalKey<FormState>();
  final UserProfileController controller = Get.put(UserProfileController());

  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final emailController = TextEditingController();
  final shopNameController = TextEditingController();
  final addressController = TextEditingController();

  var addressText = ''.obs;
  var addressSuggestions = <AddressSuggestion>[].obs;
  var isAddressSelected = false.obs;

  // Add success flag for OTP sending
  var isOtpSentSuccessfully = false.obs;

  final String googleApiKey = 'AIzaSyCG3pcwRKpeAxF1CSAgwKFVIwZzwwyyWjE';

  @override
  void onInit() {
    super.onInit();

    // Pre-fill user data
    _prefillUserData();

    debounce<String>(addressText, (val) {
      if (val.isNotEmpty && val.length >= 3 && !isAddressSelected.value) {
        searchAddress(val);
      } else if (isAddressSelected.value) {
        isAddressSelected.value = false;
      } else if (val.length < 3) {
        addressSuggestions.clear();
      }
    }, time: Duration(milliseconds: 500));
  }

  void _prefillUserData() {
    try {
      if (controller.getUserName.isNotEmpty) {
        nameController.text = controller.getUserName.toString();
      }
      if (controller.getUserphone.isNotEmpty) {
        phoneController.text = controller.getUserphone.toString();
      }
      if (controller.getUserEmail.isNotEmpty) {
        emailController.text = controller.getUserEmail.toString();
      }

      if (kDebugMode) {
        print("✅ User data pre-filled:");
        print("Name: ${nameController.text}");
        print("Phone: ${phoneController.text}");
        print("Email: ${emailController.text}");
      }
    } catch (e) {
      if (kDebugMode) {
        print("⚠️ Error pre-filling user data: $e");
      }
    }
  }

  var lat = 23.8103.obs;
  var lon = 90.4125.obs;

  GoogleMapController? googleMapController;

  Future<void> searchAddress(String input) async {
    try {
      final url = Uri.parse(
        'https://maps.googleapis.com/maps/api/place/autocomplete/json'
        '?input=${Uri.encodeComponent(input)}'
        '&key=$googleApiKey'
        '&components=country:bd'
        '&language=en',
      );

      final response = await http.get(url);

      if (response.statusCode == 200) {
        final data = json.decode(response.body);

        if (data['status'] == 'OK') {
          final predictions = data['predictions'] as List;

          final List<AddressSuggestion> found = predictions.map((pred) {
            return AddressSuggestion(
              placeId: pred['place_id'],
              title: pred['structured_formatting']['main_text'] ?? '',
              subtitle: pred['structured_formatting']['secondary_text'] ?? '',
              description: pred['description'] ?? '',
              latitude: 0.0,
              longitude: 0.0,
            );
          }).toList();

          addressSuggestions.assignAll(found);
        } else {
          addressSuggestions.clear();
        }
      } else {
        addressSuggestions.clear();
      }
    } catch (e) {
      if (kDebugMode) {
        print("Error fetching address suggestions: $e");
      }
      addressSuggestions.clear();
    }
  }

  LatLng get currentLatLng => LatLng(lat.value, lon.value);

  Future<void> selectSuggestion(AddressSuggestion suggestion) async {
    try {
      isAddressSelected.value = true;
      addressController.text = suggestion.description;
      addressText.value = suggestion.description;
      addressSuggestions.clear();

      final url = Uri.parse(
        'https://maps.googleapis.com/maps/api/place/details/json'
        '?place_id=${suggestion.placeId}'
        '&fields=geometry'
        '&key=$googleApiKey',
      );

      final response = await http.get(url);

      if (response.statusCode == 200) {
        final data = json.decode(response.body);

        if (data['status'] == 'OK') {
          final location = data['result']['geometry']['location'];
          lat.value = location['lat'];
          lon.value = location['lng'];

          googleMapController?.animateCamera(
            CameraUpdate.newLatLng(LatLng(lat.value, lon.value)),
          );
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print("Error getting place details: $e");
      }
    }
  }

  Future<bool> phoneOtpSend() async {
    // Reset success flag
    isOtpSentSuccessfully.value = false;

    // Validate form before proceeding
    if (basickey.currentState != null && !basickey.currentState!.validate()) {
      EasyLoading.showError('Please fill all required fields correctly');
      return false;
    }

    // Validate phone number
    if (phoneController.text.trim().isEmpty) {
      EasyLoading.showError('Phone number is required');
      return false;
    }

    EasyLoading.show(status: 'Sending OTP...');

    try {
      var url = ApiEndPoints.sendPhoneOtp;

      final response = await NetworkCaller().patchRequest(
        url,
        body: {"phoneNumber": phoneController.text.trim()},
        token: StorageService().getData('accessToken'),
      );

      EasyLoading.dismiss();

      if (response.isSuccess) {
        isOtpSentSuccessfully.value = true;
        EasyLoading.showSuccess('OTP sent successfully');
        return true;
      } else {
        isOtpSentSuccessfully.value = false;
        EasyLoading.showError(response.errorMessage);
        return false;
      }
    } catch (e) {
      EasyLoading.dismiss();
      isOtpSentSuccessfully.value = false;
      EasyLoading.showError('Failed! Please try again');
      if (kDebugMode) {
        print("Error sending OTP: $e");
      }
      return false;
    }
  }

  @override
  void onClose() {
    nameController.dispose();
    phoneController.dispose();
    emailController.dispose();
    shopNameController.dispose();
    addressController.dispose();
    super.onClose();
  }
}

class AddressSuggestion {
  final String placeId;
  final String title;
  final String subtitle;
  final String description;
  final double latitude;
  final double longitude;

  AddressSuggestion({
    required this.placeId,
    required this.title,
    required this.subtitle,
    required this.description,
    required this.latitude,
    required this.longitude,
  });
}
