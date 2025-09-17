class AppRouteNames {
  AppRouteNames._internal();

  static final AppRouteNames _instance = AppRouteNames._internal();
  static AppRouteNames get instance => _instance;

  final String splash = "/";
  final String chooseRole = "/choose-role";
  final String userHome = "/user-home";
  final String navbar = "/navbar";
  final String userOnboarding = "/user-onboarding";
  final String riderOnboarding = "/rider-onboarding";
  final String login = "/login";
  final String register = "/register";
  final String forgotPassword = "/forgot-password";
  final String forgotPasswordVerify = "/forgot-password-verify";
  final String registerVerify = "/register-verify";
  final String resetPassword = "/reset-password";
  final String search = "/search";
}
