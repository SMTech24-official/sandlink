import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:sandlink/core/services/DBServices/local_db_services/storage_service.dart';
import 'package:sandlink/core/widgets/custom_button.dart';
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
                  final address = controller.addressResponse.value;
                  if (address == null) {
                    return const Center(child: Text('No saved address'));
                  }
                  return ListView.builder(
                    itemCount: 1, // replace with address list if multiple
                    itemBuilder: (context, index) {
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

Widget _addressTile(AddressController controller, address) {
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
                text: address.locationType ?? 'Home',
                color: AppColors.blackColor,
                fontWeight: FontWeight.w500,
                fontSize: 16.sp,
              ),
              CustomText(
                text: address.address ?? '123 Main Street, City, State',
                color: AppColors.lightGrey,
                fontWeight: FontWeight.w400,
                fontSize: 14.sp,
              ),
            ],
          ),
        ),
        GestureDetector(
          onTap: () {
            Get.to(() => EditAddressScreen());
          },
          child: Image.asset(
            IconsAssetsPaths.instance.edit_icon,
            height: 20.h,
            width: 20.w,
            color: AppColors.blackColor,
          ),
        ),
        SizedBox(width: 12.w),
        GestureDetector(
          onTap: () {
            final String? addressId = StorageService().getData(
              'id',
            ); // get the stored id
            if (addressId != null) {
              controller.deleteAddress(addressId);
            } else {
              Get.snackbar('Error', 'Address ID not found');
            }
          },

          child: Image.asset(
            IconsAssetsPaths.instance.delete_icon,
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
