class AuthConstants {
  AuthConstants._internal();

  static final AuthConstants _instance = AuthConstants._internal();

  static AuthConstants get instance => _instance;

  String get _accessToken => "access_token";
  String get _verifyToken => "verify_token";

  String get accessToken => _accessToken;
  String get verifyToken => _verifyToken;
}
