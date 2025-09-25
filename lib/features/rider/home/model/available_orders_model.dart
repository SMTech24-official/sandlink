class AvailableOrdersModel {
  final int ID;
  final String imageUrl;
  final String productName;
  final String quantity;
  final String orderID;
  final String price;
  final String pickupLocation;
  final String deliveryLocation;
  final String pickupDistance;
  final String deliveryDistance;

  AvailableOrdersModel({
    required this.ID,
    required this.imageUrl,
    required this.productName,
    required this.quantity,
    required this.orderID,
    required this.price,
    required this.pickupLocation,
    required this.deliveryLocation,
    required this.pickupDistance,
    required this.deliveryDistance,
  });
}
