class GetAllCustomerOrders {
    bool? success;
    int? statusCode;
    String? message;
    Data? data;

    GetAllCustomerOrders({
        this.success,
        this.statusCode,
        this.message,
        this.data,
    });

    factory GetAllCustomerOrders.fromJson(Map<String, dynamic> json) => GetAllCustomerOrders(
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
    Meta? meta;
    List<MyOrdersModel>? result;

    Data({
        this.meta,
        this.result,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        meta: json["meta"] == null ? null : Meta.fromJson(json["meta"]),
        result: json["result"] == null ? [] : List<MyOrdersModel>.from(json["result"]!.map((x) => MyOrdersModel.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "meta": meta?.toJson(),
        "result": result == null ? [] : List<dynamic>.from(result!.map((x) => x.toJson())),
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

class MyOrdersModel {
    Address? pickUpAddress;
    Address? deliveryAddress;
    String? id;
    String? invoiceId;
    String? transactionId;
    int? subTotal;
    int? totalAmount;
    String? status;
    int? deliveryFee;
    DateTime? createdAt;
    DateTime? updatedAt;
    String? customerId;
    String? sellerId;
    dynamic riderId;
    Seller? seller;
    Customer? customer;

    MyOrdersModel({
        this.pickUpAddress,
        this.deliveryAddress,
        this.id,
        this.invoiceId,
        this.transactionId,
        this.subTotal,
        this.totalAmount,
        this.status,
        this.deliveryFee,
        this.createdAt,
        this.updatedAt,
        this.customerId,
        this.sellerId,
        this.riderId,
        this.seller,
        this.customer,
    });

    factory MyOrdersModel.fromJson(Map<String, dynamic> json) => MyOrdersModel(
        pickUpAddress: json["pickUpAddress"] == null ? null : Address.fromJson(json["pickUpAddress"]),
        deliveryAddress: json["deliveryAddress"] == null ? null : Address.fromJson(json["deliveryAddress"]),
        id: json["id"],
        invoiceId: json["invoiceId"],
        transactionId: json["transactionId"],
        subTotal: json["subTotal"],
        totalAmount: json["totalAmount"],
        status: json["status"],
        deliveryFee: json["deliveryFee"],
        createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
        customerId: json["customerId"],
        sellerId: json["sellerId"],
        riderId: json["riderId"],
        seller: json["seller"] == null ? null : Seller.fromJson(json["seller"]),
        customer: json["customer"] == null ? null : Customer.fromJson(json["customer"]),
    );

    Map<String, dynamic> toJson() => {
        "pickUpAddress": pickUpAddress?.toJson(),
        "deliveryAddress": deliveryAddress?.toJson(),
        "id": id,
        "invoiceId": invoiceId,
        "transactionId": transactionId,
        "subTotal": subTotal,
        "totalAmount": totalAmount,
        "status": status,
        "deliveryFee": deliveryFee,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "customerId": customerId,
        "sellerId": sellerId,
        "riderId": riderId,
        "seller": seller?.toJson(),
        "customer": customer?.toJson(),
    };
}

class Customer {
    String? id;
    User? user;

    Customer({
        this.id,
        this.user,
    });

    factory Customer.fromJson(Map<String, dynamic> json) => Customer(
        id: json["id"],
        user: json["user"] == null ? null : User.fromJson(json["user"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "user": user?.toJson(),
    };
}

class User {
    String? name;

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

class Address {
    dynamic locationType;
    String? address;
    double? longitude;
    double? latitude;

    Address({
        this.locationType,
        this.address,
        this.longitude,
        this.latitude,
    });

    factory Address.fromJson(Map<String, dynamic> json) => Address(
        locationType: json["locationType"],
        address: json["address"],
        longitude: json["longitude"]?.toDouble(),
        latitude: json["latitude"]?.toDouble(),
    );

    Map<String, dynamic> toJson() => {
        "locationType": locationType,
        "address": address,
        "longitude": longitude,
        "latitude": latitude,
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