import 'package:get/get.dart';

import '../../../../core/config/constants/assets_paths/icons_assets_paths.dart';
import '../model/rider_notification_model.dart';

class RiderNotificationController extends GetxController {
  final List<RiderNotificationModel> messageList = [
    RiderNotificationModel(
      imageUrl: IconsAssetsPaths.instance.notificationicon,
      orderStatus: 'Rate your experience',
      messageTime: '5min',
      message: 'Please left a review about our product.',
    ),
    RiderNotificationModel(
      imageUrl: IconsAssetsPaths.instance.notificationicon,
      orderStatus: 'Order Confirmation',
      messageTime: '5min',
      message: 'Your order #ORD-4521 for 15 tons of Cement has been confirmed.',
    ),
    RiderNotificationModel(
      imageUrl: IconsAssetsPaths.instance.notificationicon,
      orderStatus: 'Order Delivered',
      messageTime: '5min',
      message:
          'Your order #ORD-4521 has been delivered successfully. Thank you for shopping with us!',
    ),
    RiderNotificationModel(
      imageUrl: IconsAssetsPaths.instance.notificationicon,
      orderStatus: 'Order Cancelled',
      messageTime: '5min',
      message:
          'Order #ORD-4502 was cancelled. Refund of ₦300 has been initiated.',
    ),
    RiderNotificationModel(
      imageUrl: IconsAssetsPaths.instance.notificationicon,
      orderStatus: 'Payment Successful',
      messageTime: '5min',
      message: 'Your payment of ₦1,200 for order #ORD-4521 was successful.',
    ),
    RiderNotificationModel(
      imageUrl: IconsAssetsPaths.instance.notificationicon,
      orderStatus: 'Refund Processed',
      messageTime: '5min',
      message:
          'Refund of ₦300 for order #ORD-4502 has been credited to your account.',
    ),
    RiderNotificationModel(
      imageUrl: IconsAssetsPaths.instance.notificationicon,
      orderStatus: 'Pending Payment Reminder',
      messageTime: '5min',
      message:
          'Your order #ORD-4525 is pending payment. Complete payment to confirm delivery.',
    ),
    RiderNotificationModel(
      imageUrl: IconsAssetsPaths.instance.notificationicon,
      orderStatus: 'Order Successful',
      messageTime: '5min',
      message: 'Please left a review about our product.',
    ),
  ];
}
