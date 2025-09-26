class RegisterResponse {
  final bool success;
  final int statusCode;
  final String message;
  final String id;
  final String email;
  final DateTime otpExpiry;

  RegisterResponse({
    required this.success,
    required this.statusCode,
    required this.message,
    required this.id,
    required this.email,
    required this.otpExpiry,
  });

  factory RegisterResponse.fromJson(Map<String, dynamic> json) {
    return RegisterResponse(
      success: json['success'],
      statusCode: json['statusCode'],
      message: json['message'],
      id: json['data']['id'],
      email: json['data']['email'],
      otpExpiry: DateTime.parse(json['data']['otpExpiry']),
    );
  }
}
