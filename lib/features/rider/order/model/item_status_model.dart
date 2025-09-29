class ItemStatusModel {
  final int iD;
  final String imageUrl;
  final String productName;
  final String quantity;
  final String orderID;
  final String price;
  final String pickupLocation;
  final String deliveryLocation;
  final String pickupDistance;
  final String deliveryDistance;
  final String status;

  ItemStatusModel({
    required this.iD,
    required this.imageUrl,
    required this.productName,
    required this.quantity,
    required this.orderID,
    required this.price,
    required this.pickupLocation,
    required this.deliveryLocation,
    required this.pickupDistance,
    required this.deliveryDistance,
    required this.status,
  });
}
