class ProductResponse {
  final bool success;
  final int statusCode;
  final String message;
  final ProductData data;

  ProductResponse({
    required this.success,
    required this.statusCode,
    required this.message,
    required this.data,
  });

  factory ProductResponse.fromJson(Map<String, dynamic> json) {
    return ProductResponse(
      success: json['success'],
      statusCode: json['statusCode'],
      message: json['message'],
      data: ProductData.fromJson(json['data']),
    );
  }

  Map<String, dynamic> toJson() => {
    'success': success,
    'statusCode': statusCode,
    'message': message,
    'data': data.toJson(),
  };
}

class ProductData {
  final Meta meta;
  final List<GetAllProduct> result;

  ProductData({required this.meta, required this.result});

  factory ProductData.fromJson(Map<String, dynamic> json) {
    return ProductData(
      meta: Meta.fromJson(json['meta']),
      result: List<GetAllProduct>.from(
        json['result'].map((x) => GetAllProduct.fromJson(x)),
      ),
    );
  }

  Map<String, dynamic> toJson() => {
    'meta': meta.toJson(),
    'result': List<dynamic>.from(result.map((x) => x.toJson())),
  };
}

class Meta {
  final int page;
  final int limit;
  final int total;
  final int totalPage;

  Meta({
    required this.page,
    required this.limit,
    required this.total,
    required this.totalPage,
  });

  factory Meta.fromJson(Map<String, dynamic> json) => Meta(
    page: json['page'],
    limit: json['limit'],
    total: json['total'],
    totalPage: json['totalPage'],
  );

  Map<String, dynamic> toJson() => {
    'page': page,
    'limit': limit,
    'total': total,
    'totalPage': totalPage,
  };
}

class GetAllProduct {
  final String id;
  final String name;
  final String image;
  final int quantity;
  final int price;
  final String description;
  final String specification;
  final String status;
  final DateTime createdAt;
  final DateTime updatedAt;
  final bool isActive;
  final bool isDeleted;
  final String categoryId;
  final String sellerId;
  final String? userId;
  final Seller seller;
  final Category category;
  final int averageRating;
  final int totalReviews;

  GetAllProduct({
    required this.id,
    required this.name,
    required this.image,
    required this.quantity,
    required this.price,
    required this.description,
    required this.specification,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    required this.isActive,
    required this.isDeleted,
    required this.categoryId,
    required this.sellerId,
    this.userId,
    required this.seller,
    required this.category,
    required this.averageRating,
    required this.totalReviews,
  });

  factory GetAllProduct.fromJson(Map<String, dynamic> json) => GetAllProduct(
    id: json['id'],
    name: json['name'],
    image: json['image'],
    quantity: json['quantity'],
    price: json['price'],
    description: json['description'],
    specification: json['specification'],
    status: json['status'],
    createdAt: DateTime.parse(json['createdAt']),
    updatedAt: DateTime.parse(json['updatedAt']),
    isActive: json['isActive'],
    isDeleted: json['isDeleted'],
    categoryId: json['categoryId'],
    sellerId: json['sellerId'],
    userId: json['userId'],
    seller: Seller.fromJson(json['seller']),
    category: Category.fromJson(json['category']),
    averageRating: json['averageRating'] ?? 0,
    totalReviews: json['totalReviews'] ?? 0,
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'image': image,
    'quantity': quantity,
    'price': price,
    'description': description,
    'specification': specification,
    'status': status,
    'createdAt': createdAt.toIso8601String(),
    'updatedAt': updatedAt.toIso8601String(),
    'isActive': isActive,
    'isDeleted': isDeleted,
    'categoryId': categoryId,
    'sellerId': sellerId,
    'userId': userId,
    'seller': seller.toJson(),
    'category': category.toJson(),
    'averageRating': averageRating,
    'totalReviews': totalReviews,
  };
}

class Seller {
  final String id;
  final String shopName;
  final User user;

  Seller({required this.id, required this.shopName, required this.user});

  factory Seller.fromJson(Map<String, dynamic> json) => Seller(
    id: json['id'],
    shopName: json['shopName'],
    user: User.fromJson(json['user']),
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'shopName': shopName,
    'user': user.toJson(),
  };
}

class User {
  final String name;

  User({required this.name});

  factory User.fromJson(Map<String, dynamic> json) => User(name: json['name']);

  Map<String, dynamic> toJson() => {'name': name};
}

class Category {
  final String id;
  final String name;

  Category({required this.id, required this.name});

  factory Category.fromJson(Map<String, dynamic> json) =>
      Category(id: json['id'], name: json['name']);

  Map<String, dynamic> toJson() => {'id': id, 'name': name};
}
