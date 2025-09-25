import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sandlink/core/config/constants/assets_paths/icons_assets_paths.dart';

import '../model/item_status_model.dart';

class RiderOrderController extends GetxController with GetSingleTickerProviderStateMixin{

  late TabController tabController;

  var orderList = <ItemStatusModel> [].obs;
   
  

  // List<ItemStatusModel> get activeOrders => orderList.where((o) => o.status == "active").toList();
  // List<ItemStatusModel> get completedOrders => orderList.where((o) => o.status == "completed").toList();
  // List<ItemStatusModel> get canceledOrders => orderList.where((o) => o.status == "canceled").toList();


  @override
  void onInit() {
    super.onInit();
    tabController = TabController(length: 3, vsync: this);
    orderList.addAll([
      ItemStatusModel(
        ID: 1,
        imageUrl: '',
        quantity: '20',
        orderID: 'ORD-1234',
        price: '₦15,000',
        pickupLocation: 'Lagos Quarry, Ikeja',
        deliveryLocation: 'Victoria Island Construction Site',
        pickupDistance: '5',
        deliveryDistance: '12',
        productName: 'Ton Sand',
        status: 'active',
      ),

      ItemStatusModel(
        ID: 2,
        imageUrl: '',
        quantity: '20',
        orderID: 'ORD-1234',
        price: '₦15,000',
        pickupLocation: 'Lagos Quarry, Ikeja',
        deliveryLocation: 'Victoria Island Construction Site',
        pickupDistance: '5',
        deliveryDistance: '12',
        productName: 'Ton Sand',
        status: 'completed',
      ),

      ItemStatusModel(
        ID: 3,
        imageUrl: IconsAssetsPaths.instance.orderimage,
        quantity: '20',
        orderID: 'ORD-1234',
        price: '₦15,000',
        pickupLocation: 'Lagos Quarry, Ikeja',
        deliveryLocation: 'Victoria Island Construction Site',
        pickupDistance: '5',
        deliveryDistance: '12',
        productName: 'Ton Sand',
        status: 'canceled',
      ),
    ]);
  }

  @override
  void onClose() {
    tabController.dispose();
    super.onClose();
  }

}