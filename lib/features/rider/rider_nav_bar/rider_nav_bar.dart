

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../core/app_colors/app_colors.dart';
import '../../../core/config/constants/assets_paths/svg_assets_paths.dart';
import '../home/screen/rider_home_screen.dart';
import '../order/rider_order_screen/rider_order_screen.dart';
import '../rider_earnings/screen/rider_earnings_screen.dart';
import '../rider_user_profile/screen/rider_user_profile_screen.dart';

class RiderNavBar extends StatelessWidget {
  final RxInt _selectedIndex;
  RiderNavBar({super.key, int initialIndex = 0})
      : _selectedIndex = initialIndex.obs;

  final List<String> selectedItems = [
    SvgAssetsPaths.instance.homeSelected,
    SvgAssetsPaths.instance.boldorder,
    SvgAssetsPaths.instance.boldoearning,
    SvgAssetsPaths.instance.personSelected,
  ];

  final List<String> unselectedItems = [
    SvgAssetsPaths.instance.home,
    SvgAssetsPaths.instance.outlineorder,
    SvgAssetsPaths.instance.outlineearning,
    SvgAssetsPaths.instance.person,
  ];

  final List<Widget> _screens = [
    RiderHomeScreen(),
    RiderOrderScreen(),
    RiderEarningsScreen(),
    RiderUserProfileScreen(),
  ];

  String _getLabel(int index) {
    switch (index) {
      case 0:
        return 'Home';
      case 1:
        return 'Order';
      case 2:
        return 'Earnings';
      case 3:
        return 'Profile';
      default:
        return '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        return _screens[_selectedIndex.value];
      }),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withValues(alpha: 0.2),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(0, -2),
            ),
          ],
        ),
        child: SafeArea(
          child: Obx(
                () => Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: List.generate(selectedItems.length, (index) {
                bool isSelected = _selectedIndex.value == index;
                return InkWell(
                  onTap: () {
                    _selectedIndex.value = index;
                  },
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Padding(
                        padding: EdgeInsets.all(8.w),
                        child: SvgPicture.asset(
                          isSelected
                              ? selectedItems[index]
                              : unselectedItems[index],
                          height: 24.h,
                          width: 24.w,
                          colorFilter: ColorFilter.mode(
                            isSelected
                                ? AppColors.primaryColor
                                : AppColors.lightGrey,
                            BlendMode.srcIn,
                          ),
                        ),
                      ),
                      Text(
                        _getLabel(index),
                        style: TextStyle(
                          fontSize: 14.spMin,
                          fontWeight: isSelected
                              ? FontWeight.w600
                              : FontWeight.w400,
                          color: isSelected
                              ? AppColors.primaryColor
                              : AppColors.lightGrey,
                        ),
                      ),
                    ],
                  ),
                );
              }),
            ),
          ),
        ),
      ),
    );
  }
}
