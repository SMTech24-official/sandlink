import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:sandlink/core/widgets/custom_button.dart';
import 'package:sandlink/features/user/user_profile/model/address_model.dart';
import '../../../../core/app_colors/app_colors.dart';
import '../../../../core/config/constants/assets_paths/icons_assets_paths.dart';
import '../../../../core/config/constants/assets_paths/svg_assets_paths.dart';
import '../../../../core/widgets/custom_app_bar.dart';
import '../../../../core/wrappers/custom_text.dart';
import '../controller/save_address_controller.dart';
import 'add_address_screen.dart';
import 'edit_address_screen.dart';

class SaveAddressScreen extends StatelessWidget {
  SaveAddressScreen({super.key});

  final controller = Get.put(AddressController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Saved Address',
        onLeadingPressed: () => Get.back(),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            children: [
              Expanded(
                child: Obx(() {
                  final addressList = controller.addresses;

                  if (addressList.isEmpty) {
                    return const Center(child: Text('No saved address'));
                  }

                  return ListView.builder(
                    itemCount: addressList.length,
                    itemBuilder: (context, index) {
                      final address = addressList[index];
                      return _addressTile(controller, address);
                    },
                  );
                }),
              ),
              _addAddressButton(),
              SizedBox(height: 16.h),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _addressTile(AddressController controller, AddressData address) {
  return Container(
    margin: EdgeInsets.only(bottom: 12.h),
    padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
    decoration: BoxDecoration(
      color: AppColors.whiteColor,
      border: Border.all(color: const Color(0xff0A2833)),
      borderRadius: BorderRadius.circular(8.r),
    ),
    child: Row(
      children: [
        SvgPicture.asset(SvgAssetsPaths.instance.location),
        SizedBox(width: 8.w),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(
                text: address.locationType,
                color: AppColors.blackColor,
                fontWeight: FontWeight.w500,
                fontSize: 16.sp,
              ),
              CustomText(
                text: address.address,
                color: AppColors.lightGrey,
                fontWeight: FontWeight.w400,
                fontSize: 14.sp,
              ),
            ],
          ),
        ),
        GestureDetector(
          onTap: () {
            Get.to(() => EditAddressScreen(), arguments: address);
          },
          child: Image.asset(
            IconsAssetsPaths.instance.editicon,
            height: 20.h,
            width: 20.w,
            color: AppColors.blackColor,
          ),
        ),
        SizedBox(width: 12.w),
        GestureDetector(
          onTap: () {
            controller.deleteAddress(address.id);
          },
          child: Image.asset(
            IconsAssetsPaths.instance.deleteicon,
            height: 20.h,
            width: 20.w,
            color: AppColors.redColor,
          ),
        ),
      ],
    ),
  );
}

Widget _addAddressButton() {
  return CustomButton(
    onPressed: () => Get.to(() => AddAddressScreen()),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(Icons.add, size: 24.h, color: AppColors.whiteColor),
        SizedBox(width: 5.h),
        CustomText(
          text: "Add Address",
          color: AppColors.whiteColor,
          fontWeight: FontWeight.w500,
          fontSize: 18.sp,
        ),
      ],
    ),
  );
}
