import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class RiderEarningController extends GetxController{

  var selectedIndex = (0).obs;
  final amounts = ["₦8,500", "₦42,00", "₦16,000"];
  final overviewTypes = ['Today','This week','This Month',];


  final withdrawController = TextEditingController();


}