import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sandlink/core/app_colors/app_colors.dart';
import 'package:sandlink/core/config/constants/assets_paths/icons_assets_paths.dart';
import 'package:sandlink/core/widgets/custom_button.dart';
import 'package:sandlink/core/wrappers/custom_text.dart';
import 'package:sandlink/features/common/splash/controller/spash_controller.dart';
import 'package:sandlink/features/common/splash/screens/choose_role_screen.dart';

class SplashScreentow extends StatelessWidget {
  const SplashScreentow({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SplashController());
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 20.h),
            Image.asset(
              IconsAssetsPaths.instance.appLogos,
              width: 120.w,
              height: 120.h,
            ),
            SizedBox(height: 20.h),
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                child: CustomText(
                  textAlign: TextAlign.start,
                  text: """
Welcome to SandLink Marketplace - where every grain builds a legacy.

SandLink isn't just about sourcing aggregates. It's about shifting mindsets. In a world where extraction often ignores consequence, we choose intention over exploitation, stewardship over shortcuts.

Mine over matter means ethical excavation every grain is traced, every source verified. We mine with respect for land, labor, and legacy. It means putting community first empowering local voices, uplifting livelihoods, and ensuring that communities benefit from the resources beneath their feet. It means transparency as standard no hidden deals, no blind sourcing, just clear, accountable transactions that build trust across the supply chain. And it means sustainability in action prioritizing long-term impact over short-term gain, because what we mine today shapes the world we build tomorrow.

SandLink is where mine over matter becomes a movement. A platform where contractors, communities, and changemakers converge to build with integrity grain by grain, brick by brick, project by project.
""",
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                  color: AppColors.blackColor,
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
        child: CustomButton(
          onPressed: () {
            Get.to(() => const ChooseRoleScreen());
          },
          text: "Get Started",
        ),
      ),
    );
  }
}
