import 'package:get/state_manager.dart';

class TrackOrderController extends GetxController{

  var deliveryStatus = 3.obs;

  final steps = <OrderStep>[
    OrderStep(title: "Order Placed", subtitle: "Your order #262365is placed successfully."),
    OrderStep(title: "Payment", subtitle: "Your payment is successfully completed."),
    OrderStep(title: "Confirmed", subtitle: "Your order is confirmed. Will deliver it soon."),
    OrderStep(title: "Processing", subtitle: "Your product is processing to deliver you on time."),
    OrderStep(title: "On the way", subtitle: "Rider is on the way with your order."),
    OrderStep(title: "Delivered", subtitle: "Your order #262365 is delivered successfully."),
  ];


}

class OrderStep {
  final String title;
  final String subtitle;

  OrderStep({required this.title, required this.subtitle});
}