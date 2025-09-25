import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

import '../model/available_orders_model.dart';

class RiderHomeController extends GetxController {
  RxBool isSwitched = true.obs;

  void toggleSwitch(bool value) {
    isSwitched.value = value;
  }

  // Available Order List //

  final List<AvailableOrdersModel> availabelOrderList = [
    AvailableOrdersModel(
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
    ),
    AvailableOrdersModel(
      ID: 2,
      imageUrl: '',
      quantity: '25',
      orderID: 'ORD-1200',
      price: '₦15,000',
      pickupLocation: 'Lagos Quarry, Ikeja',
      deliveryLocation: 'Victoria Island Construction Site',
      pickupDistance: '2',
      deliveryDistance: '80',
      productName: 'Ton Sand',
    ),
    AvailableOrdersModel(
      ID: 3,
      imageUrl: '',
      quantity: '20',
      orderID: 'ORD-1234',
      price: '₦15,000',
      pickupLocation: 'Lagos Quarry, Ikeja',
      deliveryLocation: 'Victoria Island Construction Site',
      pickupDistance: '5',
      deliveryDistance: '12',
      productName: 'Ton Sand',
    ),
    AvailableOrdersModel(
      ID: 4,
      imageUrl: '',
      quantity: '20',
      orderID: 'ORD-1234',
      price: '₦15,000',
      pickupLocation: 'Lagos Quarry, Ikeja',
      deliveryLocation: 'Victoria Island Construction Site',
      pickupDistance: '5',
      deliveryDistance: '12',
      productName: 'Ton Sand',
    ),
    AvailableOrdersModel(
      ID: 5,
      imageUrl: '',
      quantity: '20',
      orderID: 'ORD-1234',
      price: '₦15,000',
      pickupLocation: 'Lagos Quarry, Ikeja',
      deliveryLocation: 'Victoria Island Construction Site',
      pickupDistance: '5',
      deliveryDistance: '12',
      productName: 'Ton Sand',
    ),
  ];
}
