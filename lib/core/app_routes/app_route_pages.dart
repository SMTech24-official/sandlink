import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sandlink/features/common/auth/screens/forgot_pass_verify_screen.dart';
import 'package:sandlink/features/common/auth/screens/forgot_password_screen.dart';
import 'package:sandlink/features/common/auth/screens/login_screen.dart';
import 'package:sandlink/features/common/auth/screens/register_screen.dart';
import 'package:sandlink/features/common/auth/screens/register_verify_screen.dart';
import 'package:sandlink/features/common/auth/screens/reset_pass_screen.dart';
import 'package:sandlink/features/user/nav_bar/screens/user_nav_bar.dart';
import 'package:sandlink/features/common/onboarding/screens/rider_onboarding_screen.dart';
import 'package:sandlink/features/common/onboarding/screens/user_onboarding_screen.dart';
import 'package:sandlink/features/user/search/screens/search_screen.dart';
import 'package:sandlink/features/common/splash/screens/choose_role_screen.dart';
import 'package:sandlink/features/common/splash/screens/splash_screen.dart';
import 'app_route_names.dart';

class AppRoutePages {
  static List<GetPage<dynamic>> appRoutePages() {
    return [
      _getPage(name: AppRouteNames.instance.splash, page: SplashScreen()),
      _getPage(
        name: AppRouteNames.instance.chooseRole,
        page: ChooseRoleScreen(),
      ),
      _getPage(
        name: AppRouteNames.instance.userOnboarding,
        page: UserOnboardingScreen(),
      ),
      _getPage(
        name: AppRouteNames.instance.riderOnboarding,
        page: RiderOnboardingScreen(),
      ),
      _getPage(name: AppRouteNames.instance.login, page: LoginScreen()),
      _getPage(name: AppRouteNames.instance.register, page: RegisterScreen()),
      _getPage(
        name: AppRouteNames.instance.forgotPassword,
        page: ForgotPasswordScreen(),
      ),
      _getPage(
        name: AppRouteNames.instance.forgotPasswordVerify,
        page: ForgotPassVerifyScreen(),
      ),
      _getPage(
        name: AppRouteNames.instance.registerVerify,
        page: RegisterVerifyScreen(),
      ),
      _getPage(
        name: AppRouteNames.instance.resetPassword,
        page: ResetPassScreen(),
      ),
      _getPage(name: AppRouteNames.instance.userHome, page: UserNavBar()),
      _getPage(name: AppRouteNames.instance.search, page: SearchScreen()),
    ];
  }

  static GetPage<dynamic> _getPage({
    required String name,
    required Widget page,
  }) => GetPage(name: name, page: () => page);
}
