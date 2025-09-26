class ApiEndPoints {
  ApiEndPoints._internal();

  static final ApiEndPoints _instance = ApiEndPoints._internal();

  static ApiEndPoints get instance => _instance;

  String get _baseApiEndPoint =>
      "https://franklin-rosado-backend.vercel.app/api/v1";

  String get createUserUrl => "$_baseApiEndPoint/users/pending";


  static const _baseUrl = 'http://206.162.244.143:5000/api/v1';
  static const register = '$_baseUrl/auth/register';
  static const login = '$_baseUrl/auth/login';
   // Account Verify//
  static const verify_otp = '$_baseUrl/auth/verify-otp';
  static const resend_otp = '$_baseUrl/auth/send-otp-email';

  static const verify_user_by_email = '$_baseUrl/auth/verify-user-by-email';




}
