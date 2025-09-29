import 'dart:developer';

import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

class ChooseRoleController extends GetxController {
  var selectedRole = " ".obs;

  var currentAddress = ''.obs;
  var latitude = 0.0.obs;
  var longitude = 0.0.obs;

  final street = ''.obs;
  final locality = ''.obs;
  final postalCode = ''.obs;
  final country = ''.obs;

  void selectRole(String role) async{
    selectedRole.value = role;

  }



  /// Get current location with permission check





  Future<void> getCurrentLocation() async {
    try {
      bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        Get.snackbar('Error', 'Location services are disabled.');
        return;
      }

      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          Get.snackbar('Error', 'Location permission denied.');
          return;
        }
      }

      if (permission == LocationPermission.deniedForever) {
        Get.snackbar('Error', 'Location permission denied forever.');
        return;
      }

      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);

      latitude.value = position.latitude;
      longitude.value = position.longitude;


      log("lat:${position.latitude}");
      log("log:${position.longitude}");

      await getAddressFromCoordinates(latitude.value, longitude.value);
    } catch (e) {
      currentAddress.value = "Unable to get location";
      print("Error getting location: $e");
    }
  }

  /// Reverse geocode
  Future<void> getAddressFromCoordinates(double lat, double lng) async {
    try {
      List<Placemark> placemarks = await placemarkFromCoordinates(lat, lng);
      if (placemarks.isNotEmpty) {
        Placemark place = placemarks[0];
        currentAddress.value = "${place.street}, ${place.locality}, ${place.postalCode}, ${place.country}";

        street.value = "${place.street}";
        locality.value = "${place.locality}";
        postalCode.value = "${place.postalCode}";
        country.value = "${place.country}";

        log("LOC:${currentAddress.value}");

      }
    } catch (e) {
      currentAddress.value = "Unknown location";
      print("Error getting address: $e");
    }
  }


  //
  // void riderBasicScreen(String role){
  //    if(role == 'rider'){
  //      Get.to(()=>RiderPersonalInformationScreen());
  //    }
  //
  // }
}
