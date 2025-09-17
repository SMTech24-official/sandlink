import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SizeConfigController extends GetxController {
  static Rx<MediaQueryData>? _mediaQueryData;
  static Rx<double>? screenWidth;
  static Rx<double>? screenHeight;

  static void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context).obs;
    screenWidth = _mediaQueryData!.value.size.width.obs;
    screenHeight = _mediaQueryData!.value.size.height.obs;

    _mediaQueryData!.listen((data) {
      screenWidth?.value = data.size.width;
      screenHeight?.value = data.size.height;
    });

    debugPrint("Initial Width: ${screenWidth?.value}");
    debugPrint("Initial Height: ${screenHeight?.value}");
  }

  double get currentWidth => screenWidth?.value ?? 0.0;

  double get currentHeight => screenHeight?.value ?? 0.0;
}
