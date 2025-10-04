class NotificationModel {
  bool? success;
  int? statusCode;
  String? message;
  NotificationModelData? data;

  NotificationModel({this.success, this.statusCode, this.message, this.data});

  factory NotificationModel.fromJson(Map<String, dynamic> json) =>
      NotificationModel(
        success: json["success"],
        statusCode: json["statusCode"],
        message: json["message"],
        data: json["data"] == null
            ? null
            : NotificationModelData.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
    "success": success,
    "statusCode": statusCode,
    "message": message,
    "data": data?.toJson(),
  };
}

class NotificationModelData {
  Meta? meta;
  List<Result>? result;

  NotificationModelData({this.meta, this.result});

  factory NotificationModelData.fromJson(Map<String, dynamic> json) =>
      NotificationModelData(
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
  String? title;
  String? message;
  String? type;
  ResultData? data;
  bool? isRead;
  String? recipientId;
  DateTime? createdAt;
  DateTime? updatedAt;

  Result({
    this.id,
    this.title,
    this.message,
    this.type,
    this.data,
    this.isRead,
    this.recipientId,
    this.createdAt,
    this.updatedAt,
  });

  factory Result.fromJson(Map<String, dynamic> json) => Result(
    id: json["id"],
    title: json["title"],
    message: json["message"],
    type: json["type"],
    data: json["data"] == null ? null : ResultData.fromJson(json["data"]),
    isRead: json["isRead"],
    recipientId: json["recipientId"],
    createdAt: json["createdAt"] == null
        ? null
        : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null
        ? null
        : DateTime.parse(json["updatedAt"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "message": message,
    "type": type,
    "data": data?.toJson(),
    "isRead": isRead,
    "recipientId": recipientId,
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
  };
}

class ResultData {
  String? subscriptionId;
  String? planId;

  ResultData({this.subscriptionId, this.planId});

  factory ResultData.fromJson(Map<String, dynamic> json) => ResultData(
    subscriptionId: json["subscriptionId"],
    planId: json["planId"],
  );

  Map<String, dynamic> toJson() => {
    "subscriptionId": subscriptionId,
    "planId": planId,
  };
}
