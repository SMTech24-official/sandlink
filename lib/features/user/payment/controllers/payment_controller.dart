import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class PaymentController extends GetxController{

  final payment_Key = GlobalKey<FormState>();

  var items = ["Country", "USA", ].obs;
  var selectedValue = "Country".obs;

  void setSelected(String value) {
    selectedValue.value = value;
  }


}