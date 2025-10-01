import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sandlink/core/services/DBServices/local_db_services/storage_service.dart';
import 'package:sandlink/features/user/user_profile/model/address_model.dart';
import '../../../../core/app_colors/app_colors.dart';
import '../../../../core/widgets/custom_app_bar.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../../core/widgets/custom_text_field.dart';
import '../../../../core/wrappers/custom_text.dart';
import '../controller/edit_address_controller.dart';

class EditAddressScreen extends StatelessWidget {
  EditAddressScreen({super.key});
  final AddressData data = Get.arguments as AddressData;
  final controller = Get.put(EditAddressController());

  @override
  Widget build(BuildContext context) {
    // Pre-fill controller fields
    controller.editAddressLocationNameController.text = data.locationType;
    controller.editAddressController.text = data.address;

    return Scaffold(
      appBar: CustomAppBar(
        title: 'Edit Address',
        onLeadingPressed: () => Get.back(),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _addAddressInfo(controller: controller),
              Spacer(),
              _addAddressButton(controller: controller, data: data),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _addAddressInfo({required EditAddressController controller}) {
  return Form(
    child: Column(
      children: [
        CustomInputField(
          textController: controller.editAddressLocationNameController,
          borderSide: BorderSide(color: AppColors.lightGreyD1),
          headerTitle: 'Location Name',
          hintText: 'Home',
        ),
        SizedBox(height: 16.h),
        CustomInputField(
          maxLines: 4,
          textController: controller.editAddressController,
          borderSide: BorderSide(color: AppColors.lightGreyD1),
          headerTitle: 'Address',
          hintText: '456 Business Avenue, City, State',
        ),
        SizedBox(height: 16.h),
      ],
    ),
  );
}

Widget _addAddressButton({
  required EditAddressController controller,
  required AddressData data,
}) {
  return CustomButton(
    onPressed: () {
      var addressId = StorageService().getData('id');
      controller.saveChanges(addressId);
    },
    child: Center(
      child: CustomText(
        text: "Save Changes",
        color: AppColors.whiteColor,
        fontWeight: FontWeight.w500,
        fontSize: 18.sp,
      ),
    ),
  );
}
