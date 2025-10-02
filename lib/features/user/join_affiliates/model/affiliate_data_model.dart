import 'dart:io';

class AffiliateDataModel {
  String? fullName;
  String? phoneNumber;
  String? email;
  String? companyName;
  String? address;
  double? latitude;
  double? longitude;
  String? otp;
  File? nidFrontImage;
  File? nidBackImage;
  File? licenceImage;
  File? tinImage;
  File? addressImage;

  AffiliateDataModel({
    this.fullName,
    this.phoneNumber,
    this.email,
    this.companyName,
    this.address,
    this.latitude,
    this.longitude,
    this.otp,
    this.nidFrontImage,
    this.nidBackImage,
    this.licenceImage,
    this.tinImage,
    this.addressImage,
  });

  Map<String, dynamic> toJson() {
    return {
      'fullName': fullName,
      'phoneNumber': phoneNumber,
      'email': email,
      'companyName': companyName,
      'address': address,
      'latitude': latitude,
      'longitude': longitude,
      'otp': otp,
    };
  }

  // Check if required documents are uploaded
  bool get hasRequiredDocuments {
    return nidFrontImage != null && nidBackImage != null;
  }
}
