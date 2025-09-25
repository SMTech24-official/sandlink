import 'package:get/get.dart';
import 'package:sandlink/features/common/splash/screens/splash_screen%20_tow.dart';

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
      Get.to(SplashScreentow());
      // }
    });
  }

  @override
  void onInit() {
    super.onInit();
    _moveToNext();
  }
}
