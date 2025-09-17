import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:sandlink/core/config/constants/assets_paths/svg_assets_paths.dart';
import 'package:sandlink/features/user/cart/screens/cart_screen.dart';
import 'package:sandlink/features/user/home/screens/user_home_screen.dart';

import '../../../../core/app_colors/app_colors.dart';

class UserNavBar extends StatelessWidget {
  final RxInt _selectedIndex;
  UserNavBar({super.key, int initialIndex = 0})
    : _selectedIndex = initialIndex.obs;

  final List<String> selectedItems = [
    SvgAssetsPaths.instance.homeSelected,
    SvgAssetsPaths.instance.cartSelected,
    SvgAssetsPaths.instance.notificationSelected,
    SvgAssetsPaths.instance.personSelected,
  ];

  final List<String> unselectedItems = [
    SvgAssetsPaths.instance.home,
    SvgAssetsPaths.instance.cart,
    SvgAssetsPaths.instance.notification,
    SvgAssetsPaths.instance.person,
  ];

  final List<Widget> _screens = [
    UserHomeScreen(),
    CartScreen(),
    UserHomeScreen(),
    UserHomeScreen(),
  ];

  String _getLabel(int index) {
    switch (index) {
      case 0:
        return 'Home';
      case 1:
        return 'Cart';
      case 2:
        return 'Notification';
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
