class AppConstants {
  AppConstants._internal();

  static final AppConstants _instance = AppConstants._internal();

  static AppConstants get instance => _instance;

  final stripePublishKey =
      "pk_test_51REjfrBQKf135iFsUrQuBxEM080ZSKcU77jUaEEZdUn58l69NRs6HyFWTpeXsx3I04pXX5nf5imcmvHT3PMbBW4i00K3yeJhLI";
  final stripeSecretKey =
      "sk_test_51REjfrBQKf135iFssyf5MZoLKqAwYhulhumIVUHz7nydp6Mu1LFJIwBJWe26YgFQcPvCqrPaJaS24oEVO6mnjWhE00zvX06AMw";
}
