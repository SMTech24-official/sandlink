import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class PhoneVerificationController extends GetxController {
  final verifyKey = GlobalKey<FormState>();

  final otpController = TextEditingController();
}
