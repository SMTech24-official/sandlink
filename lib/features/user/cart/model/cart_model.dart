class CartModel {
  final int id;
  final String imageUrl;
  final String title;
  final String subTitle;
  final String quantity;
  final String totalQuantity;

  CartModel({
    required this.id,
    required this.imageUrl,
    required this.title,
    required this.subTitle,
    required this.quantity,
    required this.totalQuantity,
  });
}
