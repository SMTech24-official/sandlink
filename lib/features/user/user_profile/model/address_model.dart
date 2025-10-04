class AddressResponseModel {
  final bool success;
  final int statusCode;
  final String message;
  final AddressDataList? data;

  AddressResponseModel({
    required this.success,
    required this.statusCode,
    required this.message,
    this.data,
  });

  factory AddressResponseModel.fromJson(Map<String, dynamic> json) {
    return AddressResponseModel(
      success: json['success'] ?? false,
      statusCode: json['statusCode'] ?? 0,
      message: json['message'] ?? '',
      data: json['data'] != null
          ? AddressDataList.fromJson(json['data'])
          : null,
    );
  }

  Map<String, dynamic> toJson() => {
    'success': success,
    'statusCode': statusCode,
    'message': message,
    'data': data?.toJson(),
  };
}

class AddressDataList {
  final Meta meta;
  final List<AddressData> result;

  AddressDataList({required this.meta, required this.result});

  factory AddressDataList.fromJson(Map<String, dynamic> json) =>
      AddressDataList(
        meta: Meta.fromJson(json['meta']),
        result: List<AddressData>.from(
          json['result'].map((x) => AddressData.fromJson(x)),
        ),
      );

  Map<String, dynamic> toJson() => {
    'meta': meta.toJson(),
    'result': result.map((x) => x.toJson()).toList(),
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
    page: json['page'] ?? 0,
    limit: json['limit'] ?? 0,
    total: json['total'] ?? 0,
    totalPage: json['totalPage'] ?? 0,
  );

  Map<String, dynamic> toJson() => {
    'page': page,
    'limit': limit,
    'total': total,
    'totalPage': totalPage,
  };
}

class AddressData {
  final String id;
  final String locationType;
  final String address;
  final String? latitude;
  final String? longitude;
  final String userId;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  AddressData({
    required this.id,
    required this.locationType,
    required this.address,
    this.latitude,
    this.longitude,
    required this.userId,
    this.createdAt,
    this.updatedAt,
  });

  factory AddressData.fromJson(Map<String, dynamic> json) => AddressData(
    id: json['id'] ?? '',
    locationType: json['locationType'] ?? '',
    address: json['address'] ?? '',
    latitude: json['latitude'],
    longitude: json['longitude'],
    userId: json['userId'] ?? '',
    createdAt: json['createdAt'] != null
        ? DateTime.parse(json['createdAt'])
        : null,
    updatedAt: json['updatedAt'] != null
        ? DateTime.parse(json['updatedAt'])
        : null,
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'locationType': locationType,
    'address': address,
    'latitude': latitude,
    'longitude': longitude,
    'userId': userId,
    'createdAt': createdAt?.toIso8601String(),
    'updatedAt': updatedAt?.toIso8601String(),
  };
}
