class Productdetails {
  bool? success;
  int? statusCode;
  String? message;
  Data? data;

  Productdetails({this.success, this.statusCode, this.message, this.data});

  factory Productdetails.fromJson(Map<String, dynamic> json) => Productdetails(
    success: json["success"],
    statusCode: json["statusCode"],
    message: json["message"],
    data: json["data"] == null ? null : Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "statusCode": statusCode,
    "message": message,
    "data": data?.toJson(),
  };
}

class Data {
  String? id;
  String? name;
  String? image;
  int? quantity;
  int? price;
  String? description;
  String? specification;
  String? status;
  DateTime? createdAt;
  DateTime? updatedAt;
  bool? isActive;
  bool? isDeleted;
  String? categoryId;
  String? sellerId;
  dynamic userId;
  Category? category;

  Data({
    this.id,
    this.name,
    this.image,
    this.quantity,
    this.price,
    this.description,
    this.specification,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.isActive,
    this.isDeleted,
    this.categoryId,
    this.sellerId,
    this.userId,
    this.category,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["id"],
    name: json["name"],
    image: json["image"],
    quantity: json["quantity"],
    price: json["price"],
    description: json["description"],
    specification: json["specification"],
    status: json["status"],
    createdAt: json["createdAt"] == null
        ? null
        : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null
        ? null
        : DateTime.parse(json["updatedAt"]),
    isActive: json["isActive"],
    isDeleted: json["isDeleted"],
    categoryId: json["categoryId"],
    sellerId: json["sellerId"],
    userId: json["userId"],
    category: json["category"] == null
        ? null
        : Category.fromJson(json["category"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "image": image,
    "quantity": quantity,
    "price": price,
    "description": description,
    "specification": specification,
    "status": status,
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
    "isActive": isActive,
    "isDeleted": isDeleted,
    "categoryId": categoryId,
    "sellerId": sellerId,
    "userId": userId,
    "category": category?.toJson(),
  };
}

class Category {
  String? id;
  String? name;

  Category({this.id, this.name});

  factory Category.fromJson(Map<String, dynamic> json) =>
      Category(id: json["id"], name: json["name"]);

  Map<String, dynamic> toJson() => {"id": id, "name": name};
}
