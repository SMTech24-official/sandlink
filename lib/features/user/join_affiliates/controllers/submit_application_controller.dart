// import 'dart:convert';
// import 'dart:developer';
// import 'package:flutter_easyloading/flutter_easyloading.dart';
// import 'package:get/get.dart';
// import 'package:http/http.dart' as http;
// import 'package:sandlink/core/config/api_end_points/api_end_points.dart';
// import 'package:sandlink/core/services/DBServices/local_db_services/storage_service.dart';
// import 'package:sandlink/features/user/join_affiliates/model/affiliate_data_model.dart';
// import 'package:sandlink/features/user/join_affiliates/screen/widgets/submit_webview.dart';

// class SubmitApplicationController extends GetxController {
//   // var isSubmitting = false.obs;

//   Future<bool> submitAffiliateApplication(AffiliateDataModel data) async {
//     // Validate required fields
//     if (data.fullName == null || data.fullName!.isEmpty) {
//       EasyLoading.showError('Full name is required');
//       return false;
//     }

//     if (data.phoneNumber == null || data.phoneNumber!.isEmpty) {
//       EasyLoading.showError('Phone number is required');
//       return false;
//     }

//     if (data.address == null || data.address!.isEmpty) {
//       EasyLoading.showError('Address is required');
//       return false;
//     }

//     if (data.latitude == null || data.longitude == null) {
//       EasyLoading.showError('Location coordinates are required');
//       return false;
//     }

//     // Validate required documents
//     if (!data.hasRequiredDocuments) {
//       EasyLoading.showError('Please upload National ID Front & Back');
//       return false;
//     }

//     final url = ApiEndPoints.submitApplications;
//     var token = StorageService().getData('accessToken');

//     if (token == null || token.isEmpty) {
//       EasyLoading.showError('Authentication token not found');
//       return false;
//     }

//     // isSubmitting.value = true;
//     EasyLoading.show(status: 'Submitting application...');

//     final bodyData = {
//       "shopName": data.companyName ?? "",
//       "address": data.address ?? "",
//       "latitude": data.latitude,
//       "longitude": data.longitude,
//       "isAgreeTermsAndPrivacyPolicy": true,
//     };

//     log("Request Body Data: $bodyData");

//     try {
//       final request = http.MultipartRequest('POST', Uri.parse(url));

//       // Add authorization header
//       request.headers.addAll({'Authorization': token});

//       // Add body data as JSON string
//       request.fields['bodyData'] = jsonEncode(bodyData);

//       // Add National ID Front (Required)
//       if (data.nidFrontImage != null) {
//         var frontBytes = await data.nidFrontImage!.readAsBytes();
//         var frontFile = http.MultipartFile.fromBytes(
//           'frontOfNationalIdOrPassportDoc',
//           frontBytes,
//           filename: 'nid_front_${DateTime.now().millisecondsSinceEpoch}.jpg',
//         );
//         request.files.add(frontFile);
//         log("Added frontOfNationalIdOrPassportDoc");
//       }

//       // Add National ID Back (Required)
//       if (data.nidBackImage != null) {
//         var backBytes = await data.nidBackImage!.readAsBytes();
//         var backFile = http.MultipartFile.fromBytes(
//           'backOfNationalIdOrPassportDoc',
//           backBytes,
//           filename: 'nid_back_${DateTime.now().millisecondsSinceEpoch}.jpg',
//         );
//         request.files.add(backFile);
//         log("Added backOfNationalIdOrPassportDoc");
//       }

//       // Add Trade License (Optional)
//       if (data.licenceImage != null) {
//         var licenseBytes = await data.licenceImage!.readAsBytes();
//         var licenseFile = http.MultipartFile.fromBytes(
//           'tradeLicenseDoc',
//           licenseBytes,
//           filename:
//               'trade_license_${DateTime.now().millisecondsSinceEpoch}.jpg',
//         );
//         request.files.add(licenseFile);
//         log("Added tradeLicenseDoc");
//       }

//       // Add TIN Certificate (Optional)
//       if (data.tinImage != null) {
//         var tinBytes = await data.tinImage!.readAsBytes();
//         var tinFile = http.MultipartFile.fromBytes(
//           'tinCertificateDoc',
//           tinBytes,
//           filename:
//               'tin_certificate_${DateTime.now().millisecondsSinceEpoch}.jpg',
//         );
//         request.files.add(tinFile);
//         log("Added tinCertificateDoc");
//       }

//       // Add Utility Bill / Bank Statement (Optional)
//       if (data.addressImage != null) {
//         var utilityBytes = await data.addressImage!.readAsBytes();
//         var utilityFile = http.MultipartFile.fromBytes(
//           'utilityBillOrBankStatementDoc',
//           utilityBytes,
//           filename: 'utility_bill_${DateTime.now().millisecondsSinceEpoch}.jpg',
//         );
//         request.files.add(utilityFile);
//         log("Added utilityBillOrBankStatementDoc");
//       }

//       log("Total files attached: ${request.files.length}");

//       // Send request
//       final streamedResponse = await request.send();
//       final response = await http.Response.fromStream(streamedResponse);

//       log("Response Status: ${response.statusCode}");
//       log("Raw Response Body: ${response.body}");

//       try {
//         final decodedResponse = jsonDecode(response.body);
//         log("Decoded JSON Response: $decodedResponse");

//         if (response.statusCode == 200 || response.statusCode == 201) {
//           final stripeUrl = decodedResponse['data']['url'];
//           // Get.to(() => SubmitWebview(paymentUrl: stripeUrl));
//           if (stripeUrl != null && stripeUrl.isNotEmpty) {
//             // Navigate to payment webview
//             Get.to(() => SubmitWebview(paymentUrl: stripeUrl));
//             return true;
//           }
//         } else {
//           EasyLoading.dismiss();
//           String errorMessage =
//               decodedResponse['message'] ??
//               decodedResponse['error'] ??
//               'Failed to submit application';
//           EasyLoading.showError(errorMessage);
//           return false;
//         }
//       } catch (jsonError) {
//         log("JSON Decode Error: $jsonError");
//         EasyLoading.dismiss();
//         EasyLoading.showError('Invalid response format from server');
//         return false;
//       }
//     } catch (e) {
//       log("Error submitting application: $e");
//       EasyLoading.dismiss();
//       EasyLoading.showError('An error occurred: $e');
//       return false;
//     } finally {
//       EasyLoading.dismiss();
//     }
//   }
// }

import 'dart:convert';
import 'dart:developer';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:sandlink/core/config/api_end_points/api_end_points.dart';
import 'package:sandlink/core/services/DBServices/local_db_services/storage_service.dart';
import 'package:sandlink/features/user/join_affiliates/model/affiliate_data_model.dart';
import 'package:sandlink/features/user/join_affiliates/screen/widgets/submit_webview.dart';

class SubmitApplicationController extends GetxController {
  Future<bool> submitAffiliateApplication(AffiliateDataModel data) async {
    // Validate required fields
    if (data.fullName == null || data.fullName!.isEmpty) {
      EasyLoading.showError('Full name is required');
      return false;
    }

    if (data.phoneNumber == null || data.phoneNumber!.isEmpty) {
      EasyLoading.showError('Phone number is required');
      return false;
    }

    if (data.address == null || data.address!.isEmpty) {
      EasyLoading.showError('Address is required');
      return false;
    }

    if (data.latitude == null || data.longitude == null) {
      EasyLoading.showError('Location coordinates are required');
      return false;
    }

    // Validate required documents
    if (!data.hasRequiredDocuments) {
      EasyLoading.showError('Please upload National ID Front & Back');
      return false;
    }

    final url = ApiEndPoints.submitApplications;
    var token = StorageService().getData('accessToken');

    if (token == null || token.isEmpty) {
      EasyLoading.showError('Authentication token not found');
      return false;
    }

    EasyLoading.show(status: 'Submitting application...');

    final bodyData = {
      "shopName": data.companyName ?? "",
      "address": data.address ?? "",
      "latitude": data.latitude,
      "longitude": data.longitude,
      "isAgreeTermsAndPrivacyPolicy": true,
    };

    log("Request Body Data: $bodyData");

    try {
      final request = http.MultipartRequest('POST', Uri.parse(url));

      // Add authorization header
      request.headers.addAll({'Authorization': token});

      // Add body data as JSON string
      request.fields['bodyData'] = jsonEncode(bodyData);

      // Add National ID Front (Required)
      if (data.nidFrontImage != null) {
        var frontBytes = await data.nidFrontImage!.readAsBytes();
        var frontFile = http.MultipartFile.fromBytes(
          'frontOfNationalIdOrPassportDoc',
          frontBytes,
          filename: 'nid_front_${DateTime.now().millisecondsSinceEpoch}.jpg',
        );
        request.files.add(frontFile);
        log("Added frontOfNationalIdOrPassportDoc");
      }

      // Add National ID Back (Required)
      if (data.nidBackImage != null) {
        var backBytes = await data.nidBackImage!.readAsBytes();
        var backFile = http.MultipartFile.fromBytes(
          'backOfNationalIdOrPassportDoc',
          backBytes,
          filename: 'nid_back_${DateTime.now().millisecondsSinceEpoch}.jpg',
        );
        request.files.add(backFile);
        log("Added backOfNationalIdOrPassportDoc");
      }

      // Add Trade License (Optional)
      if (data.licenceImage != null) {
        var licenseBytes = await data.licenceImage!.readAsBytes();
        var licenseFile = http.MultipartFile.fromBytes(
          'tradeLicenseDoc',
          licenseBytes,
          filename:
              'trade_license_${DateTime.now().millisecondsSinceEpoch}.jpg',
        );
        request.files.add(licenseFile);
        log("Added tradeLicenseDoc");
      }

      // Add TIN Certificate (Optional)
      if (data.tinImage != null) {
        var tinBytes = await data.tinImage!.readAsBytes();
        var tinFile = http.MultipartFile.fromBytes(
          'tinCertificateDoc',
          tinBytes,
          filename:
              'tin_certificate_${DateTime.now().millisecondsSinceEpoch}.jpg',
        );
        request.files.add(tinFile);
        log("Added tinCertificateDoc");
      }

      // Add Utility Bill / Bank Statement (Optional)
      if (data.addressImage != null) {
        var utilityBytes = await data.addressImage!.readAsBytes();
        var utilityFile = http.MultipartFile.fromBytes(
          'utilityBillOrBankStatementDoc',
          utilityBytes,
          filename: 'utility_bill_${DateTime.now().millisecondsSinceEpoch}.jpg',
        );
        request.files.add(utilityFile);
        log("Added utilityBillOrBankStatementDoc");
      }

      log("Total files attached: ${request.files.length}");

      // Send request
      final streamedResponse = await request.send();
      final response = await http.Response.fromStream(streamedResponse);

      log("Response Status: ${response.statusCode}");
      log("Raw Response Body: ${response.body}");

      try {
        final decodedResponse = jsonDecode(response.body);
        log("Decoded JSON Response: $decodedResponse");

        if (response.statusCode == 200 || response.statusCode == 201) {
          final stripeUrl = decodedResponse['data']['url'];

          if (stripeUrl != null && stripeUrl.isNotEmpty) {
            // Navigate to payment webview
            Get.to(() => SubmitWebview(paymentUrl: stripeUrl));
            return true;
          } else {
            EasyLoading.showError('Payment URL not found in response');
            return false;
          }
        } else {
          EasyLoading.dismiss();
          String errorMessage =
              decodedResponse['message'] ??
              decodedResponse['error'] ??
              'Failed to submit application';
          EasyLoading.showError(errorMessage);
          return false;
        }
      } catch (jsonError) {
        log("JSON Decode Error: $jsonError");
        EasyLoading.dismiss();
        EasyLoading.showError('Invalid response format from server');
        return false;
      }
    } catch (e) {
      log("Error submitting application: $e");
      EasyLoading.dismiss();
      EasyLoading.showError('An error occurred: $e');
      return false;
    } finally {
      // Ensure loading is dismissed in all cases
      EasyLoading.dismiss();
    }
  }
}
