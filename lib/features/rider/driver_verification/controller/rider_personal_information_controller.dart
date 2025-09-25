import 'package:flutter/cupertino.dart';
import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class RiderPersonalInformationController extends GetxController {
  final basic_key = GlobalKey<FormState>();

  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final emailController = TextEditingController();
  final shopNameController = TextEditingController();
  final addressController = TextEditingController();


  var addressText = ''.obs;

  @override
  void onInit() {
    super.onInit();

    debounce<String>(addressText, (val) {
      if (val.isNotEmpty) {
        searchAddress(val);
      }
    }, time: Duration(milliseconds: 800));

  }

  var lat = 23.8103.obs;
  var lon = 90.4125.obs;

  GoogleMapController? googleMapController;

  // Convert address text → lat/lon
  Future<void> searchAddress(String address) async {
    try {
      List<Location> locations = await locationFromAddress(address);
      if (locations.isNotEmpty) {
        lat.value = locations.first.latitude;
        lon.value = locations.first.longitude;

        // animate map camera
        googleMapController?.animateCamera(
          CameraUpdate.newLatLng(LatLng(lat.value, lon.value)),
        );
      }
    } catch (e) {
      print("Address not found: $e");
    }
  }

  LatLng get currentLatLng => LatLng(lat.value, lon.value);



}
