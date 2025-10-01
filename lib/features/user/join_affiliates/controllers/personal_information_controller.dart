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

class PersonalInformationController extends GetxController {
  final basickey = GlobalKey<FormState>();

  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final emailController = TextEditingController();
  final shopNameController = TextEditingController();
  final addressController = TextEditingController();

  var addressText = ''.obs;
  var addressSuggestions = <AddressSuggestion>[].obs;
  var isAddressSelected =
      false.obs; // Track if address was selected from suggestions

  // Add your Google Places API key here
  final String googleApiKey = 'AIzaSyCG3pcwRKpeAxF1CSAgwKFVIwZzwwyyWjE';

  @override
  void onInit() {
    super.onInit();

    debounce<String>(addressText, (val) {
      // Only search if address wasn't just selected from suggestions
      if (val.isNotEmpty && val.length >= 3 && !isAddressSelected.value) {
        searchAddress(val);
      } else if (isAddressSelected.value) {
        // Reset the flag after debounce period
        isAddressSelected.value = false;
      } else if (val.length < 3) {
        addressSuggestions.clear();
      }
    }, time: Duration(milliseconds: 500));
  }

  var lat = 23.8103.obs;
  var lon = 90.4125.obs;

  GoogleMapController? googleMapController;

  // Use Google Places Autocomplete API for address suggestions
  Future<void> searchAddress(String input) async {
    try {
      final url = Uri.parse(
        'https://maps.googleapis.com/maps/api/place/autocomplete/json'
        '?input=${Uri.encodeComponent(input)}'
        '&key=$googleApiKey'
        '&components=country:bd' // Restrict to Bangladesh, change as needed
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
              latitude: 0.0, // Will be fetched when selected
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

  // When user picks a suggestion, fetch the coordinates
  Future<void> selectSuggestion(AddressSuggestion suggestion) async {
    try {
      // Mark that an address was selected
      isAddressSelected.value = true;

      // Show the selected address immediately
      addressController.text = suggestion.description;
      addressText.value = suggestion.description;

      // Clear suggestions immediately
      addressSuggestions.clear();

      // Fetch place details to get coordinates
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

          // Animate map camera
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

  Future<void> phoneOtpSend() async {
    EasyLoading.show(status: 'Loading...');
    try {
      var url = ApiEndPoints.pricingPlan;

      final response = await NetworkCaller().patchRequest(
        url,
        body: {
          "phoneNumber": phoneController.text.trim(),
          "latitude": lat.value,
          "longitude": lon.value,
        },
        token: StorageService().getData('accessToken'),
      );

      if (response.isSuccess) {
        // Handle success
      } else {
        EasyLoading.showError(response.errorMessage);
      }
    } catch (e) {
      EasyLoading.showError('Failed! Please try again');
    } finally {
      EasyLoading.dismiss();
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
