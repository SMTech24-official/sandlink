import 'assets_base_path.dart';

class SvgAssetsPaths {
  SvgAssetsPaths._internal();

  static final SvgAssetsPaths _instance = SvgAssetsPaths._internal();

  static SvgAssetsPaths get instance => _instance;

  String get _imagesAssetsPaths => "${AssetsBasePaths.basePaths}/svg";

  String get successBack => "$_imagesAssetsPaths/success_back.svg";
  String get home => "$_imagesAssetsPaths/home.svg";
  String get cart => "$_imagesAssetsPaths/cart.svg";
  String get notification => "$_imagesAssetsPaths/notification.svg";
  String get person => "$_imagesAssetsPaths/person.svg";
  String get homeSelected => "$_imagesAssetsPaths/home_selected.svg";
  String get cartSelected => "$_imagesAssetsPaths/cart_selected.svg";
  String get notificationSelected =>
      "$_imagesAssetsPaths/notification_selected.svg";
  String get personSelected => "$_imagesAssetsPaths/person_selected.svg";
  String get location => "$_imagesAssetsPaths/location.svg";
  String get search => "$_imagesAssetsPaths/search.svg";
}
