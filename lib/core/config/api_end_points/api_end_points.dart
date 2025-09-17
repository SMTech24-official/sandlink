class ApiEndPoints {
  ApiEndPoints._internal();

  static final ApiEndPoints _instance = ApiEndPoints._internal();

  static ApiEndPoints get instance => _instance;

  String get _baseApiEndPoint =>
      "https://franklin-rosado-backend.vercel.app/api/v1";

  String get createUserUrl => "$_baseApiEndPoint/users/pending";
}
