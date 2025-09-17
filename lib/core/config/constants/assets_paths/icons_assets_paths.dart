import 'assets_base_path.dart';

class IconsAssetsPaths {
  IconsAssetsPaths._internal();

  static final IconsAssetsPaths _instance = IconsAssetsPaths._internal();

  static IconsAssetsPaths get instance => _instance;

  String get _iconsAssetsPaths => "${AssetsBasePaths.basePaths}/images";

  String get appLogo => "$_iconsAssetsPaths/app_logo.png";
  String get onboarding1 => "$_iconsAssetsPaths/onboarding_1.jpg";
  String get onboarding2 => "$_iconsAssetsPaths/onboarding_2.jpg";
  String get onboarding3 => "$_iconsAssetsPaths/onboarding_3.jpg";
  String get onboarding4 => "$_iconsAssetsPaths/onboarding_4.jpg";
  String get onboarding5 => "$_iconsAssetsPaths/onboarding_5.jpg";
  String get onboarding6 => "$_iconsAssetsPaths/onboarding_6.jpg";
  String get onboarding7 => "$_iconsAssetsPaths/onboarding_7.jpg";
}
