import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../model/model.dart';



class MyOrdersControllers extends GetxController{
  final userReviewFeedbackController = TextEditingController();


  final List<MyOrderModel> myorderList = [

    MyOrderModel(
        id: 1,
        orderId: 'Order 00-2025-001',
        placeDate: 'Placed on 1/1 5/2025',
        deliveryStatus: 1,
        imageUrl: 'https://www.figma.com/file/jNz7l61vmikt0kYyCBqz6X/image/c7eb458c8334d622e53cf983844410ccf9686134',
        title: 'Builder’s Choice Sand',
        quantity: '₦200',
        totalAmount: ' ₦299.99',
        onTapStatus: 1,
    ),

    MyOrderModel(
        id: 2,
        orderId: 'Order 00-2025-001',
        placeDate: 'Placed on 1/1 5/2025',
        deliveryStatus: 2,
        imageUrl: 'https://www.figma.com/file/jNz7l61vmikt0kYyCBqz6X/image/c7eb458c8334d622e53cf983844410ccf9686134',
        title: 'Builder’s Choice Sand',
        quantity: '₦200',
        totalAmount: ' ₦299.99',
        onTapStatus: 1,
    ),

    MyOrderModel(
        id: 3,
        orderId: 'Order 00-2025-001',
        placeDate: 'Placed on 1/1 5/2025',
        deliveryStatus: 0,
        imageUrl: 'https://www.figma.com/file/jNz7l61vmikt0kYyCBqz6X/image/c7eb458c8334d622e53cf983844410ccf9686134',
        title: 'Builder’s Choice Sand',
        quantity: '₦200',
        totalAmount: ' ₦299.99',
        onTapStatus: 1,
    ),


  ];




}


