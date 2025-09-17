import 'package:get/get.dart';
import 'package:sandlink/core/app_routes/app_route_names.dart';

class SplashController extends GetxController {
  void _moveToNext() async {
    // final String? role = StorageService().getData('role');
    // log("===============ROLE================$role");

    await Future.delayed(Duration(seconds: 2), () {
      // String? accessToken = StorageService().getData(
      //   AuthConstants.instance.accessToken,
      // );
      // if (accessToken != null) {
      //   if (role == 'USER') {
      //     Get.offAll(() => UserNavBar());
      //   } else {
      //     Get.offAll(() => SpNavBar());
      //   }
      // } else {
      Get.offAllNamed(AppRouteNames.instance.chooseRole);
      // }
    });
  }

  @override
  void onInit() {
    super.onInit();
    _moveToNext();
  }
}
