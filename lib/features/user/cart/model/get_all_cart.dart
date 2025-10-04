class GetAllCart {
    bool? success;
    int? statusCode;
    String? message;
    Meta? meta;
    List<CartItems>? data;

    GetAllCart({
        this.success,
        this.statusCode,
        this.message,
        this.meta,
        this.data,
    });

    factory GetAllCart.fromJson(Map<String, dynamic> json) => GetAllCart(
        success: json["success"],
        statusCode: json["statusCode"],
        message: json["message"],
        meta: json["meta"] == null ? null : Meta.fromJson(json["meta"]),
        data: json["data"] == null ? [] : List<CartItems>.from(json["data"]!.map((x) => CartItems.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "statusCode": statusCode,
        "message": message,
        "meta": meta?.toJson(),
        "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
    };
}

class CartItems {
    String? id;
    int? quantity;
    String? productId;
    String? customerId;
    DateTime? createdAt;
    DateTime? updatedAt;
    Product? product;

    CartItems({
        this.id,
        this.quantity,
        this.productId,
        this.customerId,
        this.createdAt,
        this.updatedAt,
        this.product,
    });

    factory CartItems.fromJson(Map<String, dynamic> json) => CartItems(
        id: json["id"],
        quantity: json["quantity"],
        productId: json["productId"],
        customerId: json["customerId"],
        createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
        product: json["product"] == null ? null : Product.fromJson(json["product"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "quantity": quantity,
        "productId": productId,
        "customerId": customerId,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "product": product?.toJson(),
    };
}

class Product {
    String? id;
    String? name;
    int? price;
    String? image;
    Seller? seller;

    Product({
        this.id,
        this.name,
        this.price,
        this.image,
        this.seller,
    });

    factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
        name: json["name"],
        price: json["price"],
        image: json["image"],
        seller: json["seller"] == null ? null : Seller.fromJson(json["seller"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "price": price,
        "image": image,
        "seller": seller?.toJson(),
    };
}

class Seller {
    String? id;
    String? shopName;

    Seller({
        this.id,
        this.shopName,
    });

    factory Seller.fromJson(Map<String, dynamic> json) => Seller(
        id: json["id"],
        shopName: json["shopName"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "shopName": shopName,
    };
}

class Meta {
    int? page;
    int? limit;
    int? total;
    int? totalPage;

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
