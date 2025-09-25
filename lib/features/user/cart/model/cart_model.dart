class CartModel {
  final int id;
  final String ImageUrl;
  final String title;
  final String subTitle;
  final String quantity;
  final String totalQuantity;

  CartModel({
    required this.id,
    required this.ImageUrl,
    required this.title,
    required this.subTitle,
    required this.quantity,
    required this.totalQuantity,
  });
}
