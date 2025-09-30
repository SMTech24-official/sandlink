import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sandlink/core/app_colors/app_colors.dart';
import '../../../../core/config/constants/assets_paths/icons_assets_paths.dart';

class RiderLiveMapControllers extends GetxController {
  final deliveryStatus = 0.obs;

  final steps = <OrderStep>[
    OrderStep(
      title: "Pick up Location",
      subtitle: "6391 Elgin St. Celina 10299",
      imageUrl: IconsAssetsPaths.instance.van,
    ),
    OrderStep(
      title: "Estimated Time",
      subtitle: "2-2.30 Hours",
      imageUrl: IconsAssetsPaths.instance.clock,
    ),
    OrderStep(
      title: "Delivery Location",
      subtitle: "43 La Sierra St. Fremont, CA 94538",
      imageUrl: IconsAssetsPaths.instance.locationsicon,
    ),
  ];

  final colors = [
    AppColors.redColor.withValues(alpha: 0.2),
    AppColors.blueColor.withValues(alpha: 0.2),
    AppColors.greenColor.withValues(alpha: 0.2),
  ];

  final LatLng pickupPoint = const LatLng(23.8103, 90.4125); // Dhaka
  final LatLng deliveryPoint = const LatLng(23.7980, 90.4040); // Example

  var markers = <Marker>{}.obs;
  var polylines = <Polyline>{}.obs;

  final String apiKey = "AIzaSyBhlfDHbkwZ3aeUpM_sFuC0opIiPCt7VpQ";

  // @override
  // void onInit() {
  //   super.onInit();
  //   // _setMarkers();
  //   // _getRoutePolyline();
  //   loadCustomIcon();
  //
  // }
  // Future<void> loadCustomIcon() async {
  //   var vanIcon = await BitmapDescriptor.fromAssetImage(
  //     const ImageConfiguration(size: Size(48, 48)),
  //     "${IconsAssetsPaths.instance.van}",
  //   );
  //
  //   _setMarkers();
  //   _getRoutePolyline();
  // }
  //
  // /// Set Pickup & Delivery Markers
  // void _setMarkers() {
  //   markers.addAll([
  //     Marker(
  //       markerId: const MarkerId("pickup"),
  //       position: pickupPoint,
  //       infoWindow: const InfoWindow(title: "Pickup Point"),
  //       icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
  //     ),
  //     Marker(
  //       markerId: const MarkerId("delivery"),
  //       position: deliveryPoint,
  //
  //       infoWindow: const InfoWindow(title: "Delivery Point"),
  //       icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
  //     ),
  //
  //
  //   ]);
  // }
  //
  // /// Fetch Route Polyline from Google Directions API
  // Future<void> _getRoutePolyline() async {
  //   final url =
  //       "https://maps.googleapis.com/maps/api/directions/json?origin=${pickupPoint.latitude},${pickupPoint.longitude}&destination=${deliveryPoint.latitude},${deliveryPoint.longitude}&key=$apiKey";
  //
  //   final response = await http.get(Uri.parse(url));
  //   final data = json.decode(response.body);
  //
  //   if (data["routes"].isNotEmpty) {
  //     final points = PolylinePoints().decodePolyline(
  //       data["routes"][0]["overview_polyline"]["points"],
  //     );
  //
  //     final polylineCoordinates = points
  //         .map((e) => LatLng(e.latitude, e.longitude))
  //         .toList();
  //
  //     polylines.add(
  //       Polyline(
  //         polylineId: const PolylineId("route"),
  //         points: polylineCoordinates,
  //
  //         color: AppColors.orangeColor,
  //         width: 6,
  //       ),
  //     );
  //   }
  // }

  BitmapDescriptor? vanIcon; // store van icon

  @override
  void onInit() {
    super.onInit();
    _loadCustomIcon();
  }

  Future<void> _loadCustomIcon() async {
    vanIcon = await BitmapDescriptor.asset(
      const ImageConfiguration(size: Size(60, 60)),
      IconsAssetsPaths.instance.van,
    );

    _setMarkers();
    _setPolyline();
  }

  void _setMarkers() {
    markers.addAll([
      Marker(
        markerId: const MarkerId("pickup"),
        position: pickupPoint,
        infoWindow: const InfoWindow(title: "Pickup Point"),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
      ),
      Marker(
        markerId: const MarkerId("delivery"),
        position: deliveryPoint,
        infoWindow: const InfoWindow(title: "Delivery Point"),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
      ),
      if (vanIcon != null)
        Marker(
          markerId: const MarkerId("van"),
          position: LatLng(
            (pickupPoint.latitude + deliveryPoint.latitude) / 1,
            (pickupPoint.longitude + deliveryPoint.longitude) / 1,
          ),
          infoWindow: const InfoWindow(title: "Delivery Van"),
          icon: vanIcon!,
        ),
    ]);
  }

  void _setPolyline() {
    polylines.add(
      Polyline(
        polylineId: PolylineId("route"),
        points: [pickupPoint, deliveryPoint],
        color: Colors.orange,
        width: 3,
      ),
    );
  }
}

class OrderStep {
  final String title;
  final String subtitle;
  final String imageUrl;

  OrderStep({
    required this.title,
    required this.subtitle,
    required this.imageUrl,
  });
}
