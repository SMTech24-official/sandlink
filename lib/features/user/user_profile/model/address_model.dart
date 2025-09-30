class AddressResponseModel {
  final bool success;
  final int statusCode;
  final String message;
  final AddressData? data;

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
      data: json['data'] != null ? AddressData.fromJson(json['data']) : null,
    );
  }
}

class AddressData {
  final String id;
  final String locationType;
  final String address;
  final String? latitude;
  final String? longitude;
  final String userId;

  AddressData({
    required this.id,
    required this.locationType,
    required this.address,
    this.latitude,
    this.longitude,
    required this.userId,
  });

  factory AddressData.fromJson(Map<String, dynamic> json) {
    return AddressData(
      id: json['id'] ?? '',
      locationType: json['locationType'] ?? '',
      address: json['address'] ?? '',
      latitude: json['latitude'],
      longitude: json['longitude'],
      userId: json['userId'] ?? '',
    );
  }
}
