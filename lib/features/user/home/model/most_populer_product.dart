// To parse this JSON data, do
//
//     final mostPopularProductsModel = mostPopularProductsModelFromJson(jsonString);

import 'dart:convert';

MostPopularProductsModel mostPopularProductsModelFromJson(String str) => MostPopularProductsModel.fromJson(json.decode(str));

String mostPopularProductsModelToJson(MostPopularProductsModel data) => json.encode(data.toJson());

class MostPopularProductsModel {
  final bool? success;
  final int? statusCode;
  final String? message;
  final ProductData? data;

  MostPopularProductsModel({
    this.success,
    this.statusCode,
    this.message,
    this.data,
  });

  factory MostPopularProductsModel.fromJson(Map<String, dynamic> json) => MostPopularProductsModel(
    success: json["success"],
    statusCode: json["statusCode"],
    message: json["message"],
    data: json["data"] == null ? null : ProductData.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "statusCode": statusCode,
    "message": message,
    "data": data?.toJson(),
  };
}

class ProductData {
  final Meta? meta;
  final List<MostProductResult>? result;

  ProductData({
    this.meta,
    this.result,
  });

  factory ProductData.fromJson(Map<String, dynamic> json) => ProductData(
    meta: json["meta"] == null ? null : Meta.fromJson(json["meta"]),
    result: json["result"] == null ? [] : List<MostProductResult>.from(json["result"]!.map((x) => MostProductResult.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "meta": meta?.toJson(),
    "result": result == null ? [] : List<dynamic>.from(result!.map((x) => x.toJson())),
  };
}

class Meta {
  final int? page;
  final int? limit;
  final int? total;
  final int? totalPage;

  Meta({
    this.page,
    this.limit,
    this.total,
    this.totalPage,
  });

  factory Meta.fromJson(Map<String, dynamic> json) => Meta(
    page: json["page"],
    limit: json["limit"],
    total: json["total"],
    totalPage: json["totalPage"],
  );

  Map<String, dynamic> toJson() => {
    "page": page,
    "limit": limit,
    "total": total,
    "totalPage": totalPage,
  };
}

class MostProductResult {
  final String? id;
  final String? name;
  final String? image;
  final int? quantity;
  final int? price;
  final String? description;
  final String? specification;
  final String? status;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final bool? isActive;
  final bool? isDeleted;
  final String? categoryId;
  final String? sellerId;
  final dynamic userId;
  final Seller? seller;
  final Category? category;
  final List<dynamic>? reviews;

  MostProductResult({
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
    this.seller,
    this.category,
    this.reviews,
  });

  factory MostProductResult.fromJson(Map<String, dynamic> json) => MostProductResult(
    id: json["id"],
    name: json["name"],
    image: json["image"],
    quantity: json["quantity"],
    price: json["price"],
    description: json["description"],
    specification: json["specification"],
    status: json["status"],
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    isActive: json["isActive"],
    isDeleted: json["isDeleted"],
    categoryId: json["categoryId"],
    sellerId: json["sellerId"],
    userId: json["userId"],
    seller: json["seller"] == null ? null : Seller.fromJson(json["seller"]),
    category: json["category"] == null ? null : Category.fromJson(json["category"]),
    reviews: json["reviews"] == null ? [] : List<dynamic>.from(json["reviews"]!.map((x) => x)),
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
    "seller": seller?.toJson(),
    "category": category?.toJson(),
    "reviews": reviews == null ? [] : List<dynamic>.from(reviews!.map((x) => x)),
  };
}

class Category {
  final String? id;
  final String? name;

  Category({
    this.id,
    this.name,
  });

  factory Category.fromJson(Map<String, dynamic> json) => Category(
    id: json["id"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
  };
}

class Seller {
  final User? user;

  Seller({
    this.user,
  });

  factory Seller.fromJson(Map<String, dynamic> json) => Seller(
    user: json["user"] == null ? null : User.fromJson(json["user"]),
  );

  Map<String, dynamic> toJson() => {
    "user": user?.toJson(),
  };
}

class User {
  final String? name;

  User({
    this.name,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
  };
}
