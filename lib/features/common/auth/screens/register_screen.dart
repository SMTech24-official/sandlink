import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl_phone_field/country_picker_dialog.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:sandlink/core/app_colors/app_colors.dart';
import 'package:sandlink/core/app_routes/app_route_names.dart';
import 'package:sandlink/core/helpers/validations/form_validations.dart';
import 'package:sandlink/core/widgets/custom_button.dart';
import 'package:sandlink/core/widgets/custom_richtext.dart';
import 'package:sandlink/core/widgets/custom_text_field.dart';
import 'package:sandlink/core/wrappers/custom_text.dart';
import 'package:sandlink/features/common/auth/controller/register_controller.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(RegisterController());
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  40.verticalSpace,
                  CustomText(
                    text: 'Register and Get Started',
                    fontSize: 26.spMin,
                    fontWeight: FontWeight.w600,
                  ),
                  5.verticalSpace,
                  CustomText(
                    text: 'Let\'s get started with a free account',
                    fontSize: 16.spMin,
                    fontWeight: FontWeight.w400,
                    color: AppColors.lightGrey,
                    textAlign: TextAlign.center,
                  ),
                  20.verticalSpace,
                  Form(
                    child: Column(
                      children: [
                        CustomInputField(
                          headerTitle: 'Full Name',
                          textController: controller.nameController,
                          hintText: 'Enter your name',
                          prefixIcon: Icons.person,
                          keyboardType: TextInputType.name,
                          formValidator: (value) =>
                              Validation.validateField(value),
                        ),
                        20.verticalSpace,
                        CustomInputField(
                          headerTitle: 'Email',
                          textController: controller.emailController,
                          hintText: 'Enter your email',
                          prefixIcon: Icons.email_outlined,
                          keyboardType: TextInputType.emailAddress,
                          formValidator: (value) =>
                              Validation.validateEmail(value),
                        ),
                        20.verticalSpace,
                        Align(
                          alignment: Alignment.centerLeft,
                          child: CustomText(
                            text: 'Phone Number',
                            fontSize: 16.spMin,
                            fontWeight: FontWeight.w500,
                            color: AppColors.darkGreyColor,
                          ),
                        ),
                        8.verticalSpace,
                        IntlPhoneField(
                          controller: controller.phoneController,

                          decoration: InputDecoration(
                            labelText: 'Phone Number',
                            labelStyle: TextStyle(fontSize: 16.spMin),
                            fillColor: const Color(0xFFF9FAFB),
                            filled: true,

                            floatingLabelBehavior: FloatingLabelBehavior.never,
                            errorBorder: _phoneOutlineInputBorder(),
                            enabledBorder: _phoneOutlineInputBorder(),
                            focusedBorder: _phoneOutlineInputBorder(),
                            border: _phoneOutlineInputBorder(),
                            focusedErrorBorder: _phoneOutlineInputBorder(),
                          ),

                          pickerDialogStyle: PickerDialogStyle(
                            backgroundColor: Colors.white,
                            listTileDivider: Divider(
                              color: const Color(0xFFEEEEEE),
                            ),
                          ),
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          focusNode: FocusNode(canRequestFocus: true),
                          languageCode: "en",
                          initialCountryCode: 'BD',
                          validator: (phone) {
                            if (phone == null) {
                              return "Phone number is required";
                            }
                            if (!phone.isValidNumber()) {
                              return "Enter a valid phone number";
                            }
                            return null;
                          },

                          onChanged: (phone) {
                            controller.fullPhoneNumber.value =
                                phone.completeNumber;
                            debugPrint(phone.completeNumber);
                          },
                          onCountryChanged: (country) {
                            debugPrint('Country changed to: ${country.name}');
                          },
                        ),
                        10.verticalSpace,
                        Obx(
                          () => CustomInputField(
                            headerTitle: 'Password',
                            textController: controller.passController,
                            hintText: 'Enter your password',
                            isObsecure: !controller.isPassVisible.value,
                            prefixIcon: Icons.lock_outline_rounded,
                            formValidator: (value) =>
                                Validation.validatePassword(value),
                            suffixWidget: controller.isPassVisible.value
                                ? GestureDetector(
                                    onTap: controller.togglePasswordVisibility,
                                    child: Icon(
                                      Icons.visibility_outlined,
                                      color: AppColors.lightGrey,
                                    ),
                                  )
                                : GestureDetector(
                                    onTap: controller.togglePasswordVisibility,
                                    child: Icon(
                                      Icons.visibility_off_outlined,
                                      color: AppColors.lightGrey,
                                    ),
                                  ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  15.verticalSpace,
                  Row(
                    children: [
                      Obx(
                        () => Checkbox(
                          activeColor: AppColors.primaryColor,
                          value: controller.isChecked.value,
                          onChanged: (value) {
                            controller.isChecked.value =
                                !controller.isChecked.value;
                          },
                        ),
                      ),
                      Expanded(
                        child: CustomText(
                          text:
                              'Agree to the Terms of service and Privacy policy.',
                          fontSize: 16.spMin,
                          fontWeight: FontWeight.w400,
                          color: AppColors.darkGreyColor,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                        ),
                      ),
                    ],
                  ),
                  20.verticalSpace,
                  CustomButton(
                    onPressed: () {
                      controller.createSignupUser();
                    },

                    text: 'Register',
                  ),
                  15.verticalSpace,
                  CustomRichtext(
                    primaryText: 'Already have an account? ',
                    secondaryText: 'Login',
                    primeFontSize: 14.spMin,
                    secFontSize: 14.spMin,
                    primeFontWeight: FontWeight.w400,
                    secFontWeight: FontWeight.w600,
                    primeTextColor: AppColors.lightGrey,
                    secTextColor: AppColors.primaryColor,
                    onSecPressed: () =>
                        Get.offAllNamed(AppRouteNames.instance.login),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  OutlineInputBorder _phoneOutlineInputBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(10.r),
      borderSide: BorderSide(width: 0.5.w, color: Color(0xFFD1D1D1)),
    );
  }
}
