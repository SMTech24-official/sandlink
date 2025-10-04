// class GetUserProfileModel {
//   final bool? success;
//   final int? statusCode;
//   final String? message;
//   final Data? data;

//   GetUserProfileModel({
//     this.success,
//     this.statusCode,
//     this.message,
//     this.data,
//   });

//   factory GetUserProfileModel.fromJson(Map<String, dynamic> json) => GetUserProfileModel(
//     success: json["success"],
//     statusCode: json["statusCode"],
//     message: json["message"],
//     data: json["data"] == null ? null : Data.fromJson(json["data"]),
//   );

//   Map<String, dynamic> toJson() => {
//     "success": success,
//     "statusCode": statusCode,
//     "message": message,
//     "data": data?.toJson(),
//   };
// }

// class Data {
//   final String? id;
//   final String? name;
//   final String? image;
//   final String? email;
//   final String? phoneNumber;
//   final String? role;
//   final String? status;
//   final dynamic stripeCustomerId;
//   final dynamic stripeAccountId;
//   final String? paymentAccountStatus;
//   final String? affiliateAccountStatus;
//   final dynamic stripeSubscriptionId;
//   final dynamic otpExpiry;
//   final bool? isPhoneNumberVerified;
//   final bool? isEmailVerified;
//   final bool? isAgreeTermsAndPrivacyPolicy;
//   final bool? isSubscribed;
//   final bool? isOnline;
//   final bool? isDeleted;
//   final DateTime? createdAt;
//   final DateTime? updatedAt;
//   final dynamic subscriptionPlanId;
//   final dynamic subscriptionTransactionId;

//   Data({
//     this.id,
//     this.name,
//     this.image,
//     this.email,
//     this.phoneNumber,
//     this.role,
//     this.status,
//     this.stripeCustomerId,
//     this.stripeAccountId,
//     this.paymentAccountStatus,
//     this.affiliateAccountStatus,
//     this.stripeSubscriptionId,
//     this.otpExpiry,
//     this.isPhoneNumberVerified,
//     this.isEmailVerified,
//     this.isAgreeTermsAndPrivacyPolicy,
//     this.isSubscribed,
//     this.isOnline,
//     this.isDeleted,
//     this.createdAt,
//     this.updatedAt,
//     this.subscriptionPlanId,
//     this.subscriptionTransactionId,
//   });

//   factory Data.fromJson(Map<String, dynamic> json) => Data(
//     id: json["id"],
//     name: json["name"],
//     image: json["image"],
//     email: json["email"],
//     phoneNumber: json["phoneNumber"],
//     role: json["role"],
//     status: json["status"],
//     stripeCustomerId: json["stripeCustomerId"],
//     stripeAccountId: json["stripeAccountId"],
//     paymentAccountStatus: json["paymentAccountStatus"],
//     affiliateAccountStatus: json["affiliateAccountStatus"],
//     stripeSubscriptionId: json["stripeSubscriptionId"],
//     otpExpiry: json["otpExpiry"],
//     isPhoneNumberVerified: json["isPhoneNumberVerified"],
//     isEmailVerified: json["isEmailVerified"],
//     isAgreeTermsAndPrivacyPolicy: json["isAgreeTermsAndPrivacyPolicy"],
//     isSubscribed: json["isSubscribed"],
//     isOnline: json["isOnline"],
//     isDeleted: json["isDeleted"],
//     createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
//     updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
//     subscriptionPlanId: json["subscriptionPlanId"],
//     subscriptionTransactionId: json["subscriptionTransactionId"],
//   );

//   Map<String, dynamic> toJson() => {
//     "id": id,
//     "name": name,
//     "image": image,
//     "email": email,
//     "phoneNumber": phoneNumber,
//     "role": role,
//     "status": status,
//     "stripeCustomerId": stripeCustomerId,
//     "stripeAccountId": stripeAccountId,
//     "paymentAccountStatus": paymentAccountStatus,
//     "affiliateAccountStatus": affiliateAccountStatus,
//     "stripeSubscriptionId": stripeSubscriptionId,
//     "otpExpiry": otpExpiry,
//     "isPhoneNumberVerified": isPhoneNumberVerified,
//     "isEmailVerified": isEmailVerified,
//     "isAgreeTermsAndPrivacyPolicy": isAgreeTermsAndPrivacyPolicy,
//     "isSubscribed": isSubscribed,
//     "isOnline": isOnline,
//     "isDeleted": isDeleted,
//     "createdAt": createdAt?.toIso8601String(),
//     "updatedAt": updatedAt?.toIso8601String(),
//     "subscriptionPlanId": subscriptionPlanId,
//     "subscriptionTransactionId": subscriptionTransactionId,
//   };
// }

// To parse this JSON data, do
//
//     final profileResponseModel = profileResponseModelFromJson(jsonString);

class ProfileResponseModel {
  bool? success;
  int? statusCode;
  String? message;
  Data? data;

  ProfileResponseModel({
    this.success,
    this.statusCode,
    this.message,
    this.data,
  });

  factory ProfileResponseModel.fromJson(Map<String, dynamic> json) =>
      ProfileResponseModel(
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
  String? id;
  String? name;
  dynamic image;
  String? email;
  String? phoneNumber;
  String? role;
  String? status;
  String? stripeCustomerId;
  String? stripeAccountId;
  String? paymentAccountStatus;
  String? affiliateAccountStatus;
  dynamic stripeSubscriptionId;
  DateTime? otpExpiry;
  bool? isPhoneNumberVerified;
  bool? isEmailVerified;
  bool? isAgreeTermsAndPrivacyPolicy;
  bool? isSubscribed;
  bool? isOnline;
  bool? isDeleted;
  DateTime? createdAt;
  DateTime? updatedAt;
  dynamic subscriptionPlanId;
  dynamic subscriptionTransactionId;

  Data({
    this.id,
    this.name,
    this.image,
    this.email,
    this.phoneNumber,
    this.role,
    this.status,
    this.stripeCustomerId,
    this.stripeAccountId,
    this.paymentAccountStatus,
    this.affiliateAccountStatus,
    this.stripeSubscriptionId,
    this.otpExpiry,
    this.isPhoneNumberVerified,
    this.isEmailVerified,
    this.isAgreeTermsAndPrivacyPolicy,
    this.isSubscribed,
    this.isOnline,
    this.isDeleted,
    this.createdAt,
    this.updatedAt,
    this.subscriptionPlanId,
    this.subscriptionTransactionId,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["id"],
    name: json["name"],
    image: json["image"],
    email: json["email"],
    phoneNumber: json["phoneNumber"],
    role: json["role"],
    status: json["status"],
    stripeCustomerId: json["stripeCustomerId"],
    stripeAccountId: json["stripeAccountId"],
    paymentAccountStatus: json["paymentAccountStatus"],
    affiliateAccountStatus: json["affiliateAccountStatus"],
    stripeSubscriptionId: json["stripeSubscriptionId"],
    otpExpiry: json["otpExpiry"] == null
        ? null
        : DateTime.parse(json["otpExpiry"]),
    isPhoneNumberVerified: json["isPhoneNumberVerified"],
    isEmailVerified: json["isEmailVerified"],
    isAgreeTermsAndPrivacyPolicy: json["isAgreeTermsAndPrivacyPolicy"],
    isSubscribed: json["isSubscribed"],
    isOnline: json["isOnline"],
    isDeleted: json["isDeleted"],
    createdAt: json["createdAt"] == null
        ? null
        : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null
        ? null
        : DateTime.parse(json["updatedAt"]),
    subscriptionPlanId: json["subscriptionPlanId"],
    subscriptionTransactionId: json["subscriptionTransactionId"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "image": image,
    "email": email,
    "phoneNumber": phoneNumber,
    "role": role,
    "status": status,
    "stripeCustomerId": stripeCustomerId,
    "stripeAccountId": stripeAccountId,
    "paymentAccountStatus": paymentAccountStatus,
    "affiliateAccountStatus": affiliateAccountStatus,
    "stripeSubscriptionId": stripeSubscriptionId,
    "otpExpiry": otpExpiry?.toIso8601String(),
    "isPhoneNumberVerified": isPhoneNumberVerified,
    "isEmailVerified": isEmailVerified,
    "isAgreeTermsAndPrivacyPolicy": isAgreeTermsAndPrivacyPolicy,
    "isSubscribed": isSubscribed,
    "isOnline": isOnline,
    "isDeleted": isDeleted,
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
    "subscriptionPlanId": subscriptionPlanId,
    "subscriptionTransactionId": subscriptionTransactionId,
  };
}
