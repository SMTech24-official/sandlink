

class MyOrderModel {
  final int id;
  final String orderId;
  final String placeDate;
  final int deliveryStatus;
  final String imageUrl;
  final String title;
  final String quantity;
  final String totalAmount;
  final int onTapStatus;

  MyOrderModel( {
    required this.id,
    required this.orderId,
    required this.placeDate,
    required this.deliveryStatus,
    required this.imageUrl,
    required this.title,
    required this.quantity,
    required this.totalAmount,
    required this.onTapStatus,
  });
}
