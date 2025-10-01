class SubscriptionsPlanModel {
  bool? success;
  int? statusCode;
  String? message;
  Data? data;

  SubscriptionsPlanModel({
    this.success,
    this.statusCode,
    this.message,
    this.data,
  });

  factory SubscriptionsPlanModel.fromJson(Map<String, dynamic> json) =>
      SubscriptionsPlanModel(
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
  List<Result>? result;

  Data({this.meta, this.result});

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    meta: json["meta"] == null ? null : Meta.fromJson(json["meta"]),
    result: json["result"] == null
        ? []
        : List<Result>.from(json["result"]!.map((x) => Result.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "meta": meta?.toJson(),
    "result": result == null
        ? []
        : List<dynamic>.from(result!.map((x) => x.toJson())),
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
  String? id;
  String? planName;
  double? price;
  String? interval;
  String? description;
  List<String>? features;
  String? stripeProductId;
  String? stripePriceId;
  bool? isDeleted;
  DateTime? createdAt;
  DateTime? updatedAt;

  Result({
    this.id,
    this.planName,
    this.price,
    this.interval,
    this.description,
    this.features,
    this.stripeProductId,
    this.stripePriceId,
    this.isDeleted,
    this.createdAt,
    this.updatedAt,
  });

  factory Result.fromJson(Map<String, dynamic> json) => Result(
    id: json["id"],
    planName: json["planName"],
    price: json["price"]?.toDouble(),
    interval: json["interval"],
    description: json["description"],
    features: json["features"] == null
        ? []
        : List<String>.from(json["features"]!.map((x) => x)),
    stripeProductId: json["stripeProductId"],
    stripePriceId: json["stripePriceId"],
    isDeleted: json["isDeleted"],
    createdAt: json["createdAt"] == null
        ? null
        : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null
        ? null
        : DateTime.parse(json["updatedAt"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "planName": planName,
    "price": price,
    "interval": interval,
    "description": description,
    "features": features == null
        ? []
        : List<dynamic>.from(features!.map((x) => x)),
    "stripeProductId": stripeProductId,
    "stripePriceId": stripePriceId,
    "isDeleted": isDeleted,
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
  };
}
