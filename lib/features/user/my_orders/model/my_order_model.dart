class MyOrderModel {
  bool? success;
  int? statusCode;
  String? message;
  Data? data;

  MyOrderModel({this.success, this.statusCode, this.message, this.data});

  factory MyOrderModel.fromJson(Map<String, dynamic> json) => MyOrderModel(
    success: json["success"],
    statusCode: json["statusCode"],
    message: json["message"],
    data: json["data"] != null ? Data.fromJson(json["data"]) : null,
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
  List<Result>? result;

  Data({this.meta, this.result});

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    meta: json["meta"] != null ? Meta.fromJson(json["meta"]) : null,
    result: json["result"] != null
        ? List<Result>.from(json["result"].map((x) => Result.fromJson(x)))
        : [],
  );

  Map<String, dynamic> toJson() => {
    "meta": meta?.toJson(),
    "result": result?.map((x) => x.toJson()).toList() ?? [],
  };
}

class Meta {
  int? page;
  int? limit;
  int? total;
  int? totalPage;

  Meta({this.page, this.limit, this.total, this.totalPage});

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

class Result {
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

  Result({
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

  factory Result.fromJson(Map<String, dynamic> json) => Result(
    pickUpAddress: json["pickUpAddress"] != null
        ? Address.fromJson(json["pickUpAddress"])
        : null,
    deliveryAddress: json["deliveryAddress"] != null
        ? Address.fromJson(json["deliveryAddress"])
        : null,
    id: json["id"],
    invoiceId: json["invoiceId"],
    transactionId: json["transactionId"],
    subTotal: json["subTotal"],
    totalAmount: json["totalAmount"],
    status: json["status"],
    deliveryFee: json["deliveryFee"],
    createdAt: json["createdAt"] != null
        ? DateTime.tryParse(json["createdAt"])
        : null,
    updatedAt: json["updatedAt"] != null
        ? DateTime.tryParse(json["updatedAt"])
        : null,
    customerId: json["customerId"],
    sellerId: json["sellerId"],
    riderId: json["riderId"],
    seller: json["seller"] != null ? Seller.fromJson(json["seller"]) : null,
    customer: json["customer"] != null
        ? Customer.fromJson(json["customer"])
        : null,
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

// ------------------------ CUSTOMER ------------------------
class Customer {
  String? id;
  User? user;

  Customer({this.id, this.user});

  factory Customer.fromJson(Map<String, dynamic> json) => Customer(
    id: json["id"],
    user: json["user"] != null ? User.fromJson(json["user"]) : null,
  );

  Map<String, dynamic> toJson() => {"id": id, "user": user?.toJson()};
}

class User {
  String? name;

  User({this.name});

  factory User.fromJson(Map<String, dynamic> json) => User(name: json["name"]);

  Map<String, dynamic> toJson() => {"name": name};
}

// ------------------------ ADDRESS ------------------------
class Address {
  String? locationType;
  String? address;
  double? longitude;
  double? latitude;

  Address({this.locationType, this.address, this.longitude, this.latitude});

  factory Address.fromJson(Map<String, dynamic> json) => Address(
    locationType: json["locationType"],
    address: json["address"],
    longitude: (json["longitude"]?.toDouble()),
    latitude: (json["latitude"]?.toDouble()),
  );

  Map<String, dynamic> toJson() => {
    "locationType": locationType,
    "address": address,
    "longitude": longitude,
    "latitude": latitude,
  };
}

// ------------------------ SELLER ------------------------
class Seller {
  String? id;
  String? shopName;

  Seller({this.id, this.shopName});

  factory Seller.fromJson(Map<String, dynamic> json) =>
      Seller(id: json["id"], shopName: json["shopName"]);

  Map<String, dynamic> toJson() => {"id": id, "shopName": shopName};
}
