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
  Seller? seller; // <-- new
  Category? category;
  List<Review>? reviews;
  int? averageRating; // <-- new
  int? totalReviews; // <-- new

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
    this.seller,
    this.category,
    this.reviews,
    this.averageRating,
    this.totalReviews,
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
        createdAt:
            json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
        updatedAt:
            json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
        isActive: json["isActive"],
        isDeleted: json["isDeleted"],
        categoryId: json["categoryId"],
        sellerId: json["sellerId"],
        userId: json["userId"],
        seller: json["seller"] == null ? null : Seller.fromJson(json["seller"]),
        category: json["category"] == null ? null : Category.fromJson(json["category"]),
        reviews: json["reviews"] == null
            ? []
            : List<Review>.from(json["reviews"].map((x) => Review.fromJson(x))),
        averageRating: json["averageRating"],
        totalReviews: json["totalReviews"],
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
        "reviews": reviews == null
            ? []
            : List<dynamic>.from(reviews!.map((x) => x.toJson())),
        "averageRating": averageRating,
        "totalReviews": totalReviews,
      };
}

class Seller {
  String? id;
  String? shopName;
  SellerUser? user;

  Seller({this.id, this.shopName, this.user});

  factory Seller.fromJson(Map<String, dynamic> json) => Seller(
        id: json["id"],
        shopName: json["shopName"],
        user: json["user"] == null ? null : SellerUser.fromJson(json["user"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "shopName": shopName,
        "user": user?.toJson(),
      };
}

class SellerUser {
  String? id;
  String? name;

  SellerUser({this.id, this.name});

  factory SellerUser.fromJson(Map<String, dynamic> json) =>
      SellerUser(id: json["id"], name: json["name"]);

  Map<String, dynamic> toJson() => {"id": id, "name": name};
}

class Category {
  String? id;
  String? name;

  Category({this.id, this.name});

  factory Category.fromJson(Map<String, dynamic> json) =>
      Category(id: json["id"], name: json["name"]);

  Map<String, dynamic> toJson() => {"id": id, "name": name};
}

class Review {
  String? id;
  int? rating;
  String? comment;
  DateTime? createdAt;
  DateTime? updatedAt;
  bool? isDeleted;
  String? userId;
  String? productId;
  ReviewUser? user; // <-- new

  Review({
    this.id,
    this.rating,
    this.comment,
    this.createdAt,
    this.updatedAt,
    this.isDeleted,
    this.userId,
    this.productId,
    this.user,
  });

  factory Review.fromJson(Map<String, dynamic> json) => Review(
        id: json["id"],
        rating: json["rating"],
        comment: json["comment"],
        createdAt:
            json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
        updatedAt:
            json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
        isDeleted: json["isDeleted"],
        userId: json["userId"],
        productId: json["productId"],
        user: json["user"] == null ? null : ReviewUser.fromJson(json["user"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "rating": rating,
        "comment": comment,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "isDeleted": isDeleted,
        "userId": userId,
        "productId": productId,
        "user": user?.toJson(),
      };
}

class ReviewUser {
  String? id;
  String? name;

  ReviewUser({this.id, this.name});

  factory ReviewUser.fromJson(Map<String, dynamic> json) =>
      ReviewUser(id: json["id"], name: json["name"]);

  Map<String, dynamic> toJson() => {"id": id, "name": name};
}
