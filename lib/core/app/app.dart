import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sandlink/core/app_routes/app_route_names.dart';
import 'package:sandlink/core/app_routes/app_route_pages.dart';


class SandLink extends StatelessWidget {
  const SandLink({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            scaffoldBackgroundColor: Colors.white,
            appBarTheme: AppBarTheme(
              surfaceTintColor: Colors.white,
              backgroundColor: Colors.white,
            ),
            dialogTheme: DialogThemeData(backgroundColor: Colors.white),
            bottomSheetTheme: BottomSheetThemeData(
              backgroundColor: Colors.white,
            ),
            fontFamily: 'Inter',
          ),
          initialRoute: AppRouteNames.instance.splash,
          getPages: AppRoutePages.appRoutePages(),
          // home: UserNavBar(),
          builder: EasyLoading.init(),
        );
      },
    );
  }
}
