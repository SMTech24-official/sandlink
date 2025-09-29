
import 'dart:convert';

ForgotPasswordModel forgotPasswordModelFromJson(String str) => ForgotPasswordModel.fromJson(json.decode(str));

String forgotPasswordModelToJson(ForgotPasswordModel data) => json.encode(data.toJson());

class ForgotPasswordModel {
  final bool? success;
  final int? statusCode;
  final String? message;
  final ForgotPasswordData? data;

  ForgotPasswordModel({
    this.success,
    this.statusCode,
    this.message,
    this.data,
  });

  factory ForgotPasswordModel.fromJson(Map<String, dynamic> json) => ForgotPasswordModel(
    success: json["success"],
    statusCode: json["statusCode"],
    message: json["message"],
    data: json["data"] == null ? null : ForgotPasswordData.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "statusCode": statusCode,
    "message": message,
    "data": data?.toJson(),
  };
}

class ForgotPasswordData {
  final String? email;
  final DateTime? otpExpiry;
  final String? resetToken;

  ForgotPasswordData({
    this.email,
    this.otpExpiry,
    this.resetToken,
  });

  factory ForgotPasswordData.fromJson(Map<String, dynamic> json) => ForgotPasswordData(
    email: json["email"],
    otpExpiry: json["otpExpiry"] == null ? null : DateTime.parse(json["otpExpiry"]),
    resetToken: json["resetToken"],
  );

  Map<String, dynamic> toJson() => {
    "email": email,
    "otpExpiry": otpExpiry?.toIso8601String(),
    "resetToken": resetToken,
  };
}
