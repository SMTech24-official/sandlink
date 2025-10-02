// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

// import '../../../../core/app_colors/app_colors.dart';
// import '../../../../core/config/constants/assets_paths/icons_assets_paths.dart';
// import '../../../../core/wrappers/custom_text.dart';

// class ReviewYourInformationScreen extends StatelessWidget {
//   const ReviewYourInformationScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: AppColors.backgroundColor,
//       body: SafeArea(
//         child: Padding(
//           padding: EdgeInsets.symmetric(horizontal: 16.w),
//           child: SingleChildScrollView(
//             scrollDirection: Axis.vertical,
//             child: Column(
//               children: [
//                 SizedBox(height: 50.h),
//                 Container(
//                   width: double.infinity.w,
//                   decoration: BoxDecoration(
//                     border: Border.all(color: AppColors.lightGreyD1),
//                     borderRadius: BorderRadius.all(Radius.circular(8.r)),
//                   ),
//                   child: Padding(
//                     padding: EdgeInsets.symmetric(horizontal: 16.w),
//                     child: Column(
//                       children: [
//                         SizedBox(height: 16.h),
//                         CustomText(
//                           text: 'Review Your Information',
//                           color: AppColors.blackColor,
//                           fontSize: 18.sp,
//                           fontWeight: FontWeight.w600,
//                         ),
//                         SizedBox(height: 8.h),
//                         CustomText(
//                           text: 'Setup your payment method for withdrawals',
//                           color: AppColors.lightGrey,
//                           fontSize: 14.sp,
//                           fontWeight: FontWeight.w500,
//                         ),
//                         SizedBox(height: 20.h),

//                         Column(
//                           children: [
//                             _personalInformation(),
//                             SizedBox(height: 16.h),
//                             _identityVerification(),
//                             SizedBox(height: 16.h),
//                             // _paymentVerification(),
//                             // SizedBox(height: 16.h),
//                             _allDocuments(),
//                             SizedBox(height: 20.h),
//                           ],
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//                 SizedBox(height: 35.h),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// Widget _personalInformation() {
//   return Column(
//     children: [
//       Row(
//         children: [
//           Icon(Icons.person_2_outlined, size: 20, color: AppColors.blackColor),
//           SizedBox(width: 8.w),
//           CustomText(
//             text: 'Personal Information',
//             color: AppColors.blackColor,
//             fontSize: 18.sp,
//             fontWeight: FontWeight.w500,
//           ),
//         ],
//       ),
//       SizedBox(height: 8.h),
//       Container(
//         width: double.infinity.w,
//         decoration: BoxDecoration(
//           border: Border.all(color: AppColors.lightGreyD1),
//           borderRadius: BorderRadius.all(Radius.circular(8.r)),
//         ),
//         child: Padding(
//           padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               CustomText(
//                 text: 'Full Name',
//                 color: AppColors.lightGrey,
//                 fontSize: 12.sp,
//                 fontWeight: FontWeight.w500,
//               ),
//               SizedBox(height: 6.h),
//               CustomText(
//                 text: 'Cameron Williamson',
//                 color: AppColors.blackColor,
//                 fontSize: 14.sp,
//                 fontWeight: FontWeight.w500,
//               ),

//               SizedBox(height: 12.h),
//               CustomText(
//                 text: 'Phone Number',
//                 color: AppColors.lightGrey,
//                 fontSize: 12.sp,
//                 fontWeight: FontWeight.w500,
//               ),
//               SizedBox(height: 6.h),
//               CustomText(
//                 text: '+880 IX XXX XXXXX',
//                 color: AppColors.blackColor,
//                 fontSize: 14.sp,
//                 fontWeight: FontWeight.w500,
//               ),

//               SizedBox(height: 12.h),
//               CustomText(
//                 text: 'Email',
//                 color: AppColors.lightGrey,
//                 fontSize: 14.sp,
//                 fontWeight: FontWeight.w500,
//               ),
//               SizedBox(height: 6.h),
//               CustomText(
//                 text: 'tim.jennings@example.com',
//                 color: AppColors.blackColor,
//                 fontSize: 14.sp,
//                 fontWeight: FontWeight.w500,
//               ),
//               SizedBox(height: 12.h),
//             ],
//           ),
//         ),
//       ),
//     ],
//   );
// }

// Widget _identityVerification() {
//   return Column(
//     children: [
//       Row(
//         children: [
//           Image.asset(
//             IconsAssetsPaths.instance.rightcircleicon,
//             color: AppColors.blackColor,
//           ),
//           SizedBox(width: 8.w),
//           CustomText(
//             text: 'Identity Verification',
//             color: AppColors.blackColor,
//             fontSize: 18.sp,
//             fontWeight: FontWeight.w500,
//           ),
//         ],
//       ),
//       SizedBox(height: 8.h),
//       Container(
//         width: double.infinity.w,
//         decoration: BoxDecoration(
//           border: Border.all(color: AppColors.lightGreyD1),
//           borderRadius: BorderRadius.all(Radius.circular(8.r)),
//         ),
//         child: Padding(
//           padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Row(
//                 children: [
//                   Image.asset(
//                     IconsAssetsPaths.instance.gellaryicon,
//                     height: 24.h,
//                     width: 24.w,
//                   ),

//                   SizedBox(width: 5.w),
//                   CustomText(
//                     text: 'National ID / Passport (Front)',
//                     color: AppColors.blackColor,
//                     fontSize: 14.sp,
//                     fontWeight: FontWeight.w500,
//                   ),
//                 ],
//               ),
//               SizedBox(height: 6.h),
//               Row(
//                 children: [
//                   Image.asset(
//                     IconsAssetsPaths.instance.gellaryicon,
//                     height: 24.h,
//                     width: 24.w,
//                   ),

//                   SizedBox(width: 5.w),
//                   CustomText(
//                     text: 'National ID / Passport (Back)',
//                     color: AppColors.blackColor,
//                     fontSize: 14.sp,
//                     fontWeight: FontWeight.w500,
//                   ),
//                 ],
//               ),
//               SizedBox(height: 6.h),
//               Row(
//                 children: [
//                   Image.asset(
//                     IconsAssetsPaths.instance.pdficon,
//                     height: 24.h,
//                     width: 24.w,
//                   ),

//                   SizedBox(width: 5.w),
//                   CustomText(
//                     text: 'Trade License',
//                     color: AppColors.blackColor,
//                     fontSize: 14.sp,
//                     fontWeight: FontWeight.w500,
//                   ),
//                 ],
//               ),
//               SizedBox(height: 6.h),
//               Row(
//                 children: [
//                   Image.asset(
//                     IconsAssetsPaths.instance.pdficon,
//                     height: 24.h,
//                     width: 24.w,
//                   ),

//                   SizedBox(width: 5.w),
//                   CustomText(
//                     text: 'National ID / Passport (Back)',
//                     color: AppColors.blackColor,
//                     fontSize: 14.sp,
//                     fontWeight: FontWeight.w500,
//                   ),
//                 ],
//               ),
//               SizedBox(height: 6.h),
//             ],
//           ),
//         ),
//       ),
//     ],
//   );
// }

// Widget _paymentVerification() {
//   return Column(
//     children: [
//       Row(
//         children: [
//           Image.asset(
//             IconsAssetsPaths.instance.wallet,
//             color: AppColors.blackColor,
//             height: 20.h,
//             width: 20.w,
//           ),
//           SizedBox(width: 8.w),
//           CustomText(
//             text: 'Payment Verification',
//             color: AppColors.blackColor,
//             fontSize: 18.sp,
//             fontWeight: FontWeight.w500,
//           ),
//         ],
//       ),
//       SizedBox(height: 8.h),
//       Container(
//         width: double.infinity.w,
//         decoration: BoxDecoration(
//           border: Border.all(color: AppColors.lightGreyD1),
//           borderRadius: BorderRadius.all(Radius.circular(8.r)),
//         ),
//         child: Padding(
//           padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Row(
//                 children: [
//                   Image.asset(
//                     IconsAssetsPaths.instance.stripicon,
//                     height: 32.h,
//                     width: 32.w,
//                     fit: BoxFit.cover,
//                   ),

//                   SizedBox(width: 5.w),
//                   CustomText(
//                     text: 'Stripe',
//                     color: AppColors.blackColor,
//                     fontSize: 14.sp,
//                     fontWeight: FontWeight.w500,
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     ],
//   );
// }

// Widget _allDocuments() {
//   return Column(
//     children: [
//       Container(
//         width: double.infinity.w,
//         decoration: BoxDecoration(
//           color: AppColors.whiteColor,
//           borderRadius: BorderRadius.all(Radius.circular(8.r)),
//         ),
//         child: Padding(
//           padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Row(
//                 children: [
//                   Image.asset(
//                     IconsAssetsPaths.instance.tickcircleicon,
//                     height: 24.h,
//                     width: 24.w,
//                     fit: BoxFit.cover,
//                   ),

//                   SizedBox(width: 10.w),
//                   CustomText(
//                     maxLines: 2,
//                     text: 'All documents are ready for\nverification',
//                     color: AppColors.greenColor,
//                     fontSize: 16.sp,
//                     fontWeight: FontWeight.w500,
//                   ),
//                 ],
//               ),
//               SizedBox(height: 12.w),
//               CustomText(
//                 maxLines: 5,
//                 text:
//                     '''Once submitted, you won't be able to make changes to your documents. Our team will review them within 24-48 hours.''',
//                 color: AppColors.lightGrey,
//                 fontSize: 13.sp,
//                 fontWeight: FontWeight.w500,
//               ),
//             ],
//           ),
//         ),
//       ),
//     ],
//   );
// }

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sandlink/core/app_colors/app_colors.dart';
import 'package:sandlink/core/config/constants/assets_paths/icons_assets_paths.dart';
import 'package:sandlink/core/wrappers/custom_text.dart';
import 'package:sandlink/features/user/join_affiliates/model/affiliate_data_model.dart';
import '../controllers/steps_controllers.dart';

class ReviewYourInformationScreen extends StatelessWidget {
  const ReviewYourInformationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final StepsController stepsController = Get.find<StepsController>();

    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                SizedBox(height: 50.h),
                Container(
                  width: double.infinity.w,
                  decoration: BoxDecoration(
                    border: Border.all(color: AppColors.lightGreyD1),
                    borderRadius: BorderRadius.all(Radius.circular(8.r)),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    child: Column(
                      children: [
                        SizedBox(height: 16.h),
                        CustomText(
                          text: 'Review Your Information',
                          color: AppColors.blackColor,
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w600,
                        ),
                        SizedBox(height: 8.h),
                        CustomText(
                          text: 'Review all your information before submission',
                          color: AppColors.lightGrey,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                        ),
                        SizedBox(height: 20.h),

                        Obx(() {
                          final data = stepsController.affiliateData.value;
                          return Column(
                            children: [
                              _personalInformation(data),
                              SizedBox(height: 16.h),
                              _identityVerification(data),
                              SizedBox(height: 16.h),
                              _allDocuments(data),
                              SizedBox(height: 20.h),
                            ],
                          );
                        }),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 35.h),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _personalInformation(AffiliateDataModel data) {
    return Column(
      children: [
        Row(
          children: [
            Icon(
              Icons.person_2_outlined,
              size: 20,
              color: AppColors.blackColor,
            ),
            SizedBox(width: 8.w),
            CustomText(
              text: 'Personal Information',
              color: AppColors.blackColor,
              fontSize: 18.sp,
              fontWeight: FontWeight.w500,
            ),
          ],
        ),
        SizedBox(height: 8.h),
        Container(
          width: double.infinity.w,
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.lightGreyD1),
            borderRadius: BorderRadius.all(Radius.circular(8.r)),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _infoRow('Full Name', data.fullName ?? 'Not provided'),
                _infoRow('Phone Number', data.phoneNumber ?? 'Not provided'),
                _infoRow('Email', data.email ?? 'Not provided'),
                _infoRow('Company Name', data.companyName ?? 'Not provided'),
                _infoRow('Address', data.address ?? 'Not provided'),
                _infoRow(
                  'Location',
                  data.latitude != null && data.longitude != null
                      ? 'Lat: ${data.latitude!.toStringAsFixed(4)}, Lng: ${data.longitude!.toStringAsFixed(4)}'
                      : 'Not provided',
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _infoRow(String label, String value) {
    return Padding(
      padding: EdgeInsets.only(bottom: 12.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomText(
            text: label,
            color: AppColors.lightGrey,
            fontSize: 12.sp,
            fontWeight: FontWeight.w500,
          ),
          SizedBox(height: 6.h),
          CustomText(
            text: value,
            color: AppColors.blackColor,
            fontSize: 14.sp,
            fontWeight: FontWeight.w500,
          ),
        ],
      ),
    );
  }

  Widget _identityVerification(AffiliateDataModel data) {
    return Column(
      children: [
        Row(
          children: [
            Image.asset(
              IconsAssetsPaths.instance.rightcircleicon,
              color: AppColors.blackColor,
            ),
            SizedBox(width: 8.w),
            CustomText(
              text: 'Identity Verification',
              color: AppColors.blackColor,
              fontSize: 18.sp,
              fontWeight: FontWeight.w500,
            ),
          ],
        ),
        SizedBox(height: 8.h),
        Container(
          width: double.infinity.w,
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.lightGreyD1),
            borderRadius: BorderRadius.all(Radius.circular(8.r)),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _documentRow(
                  'National ID / Passport (Front)',
                  data.nidFrontImage,
                ),
                _documentRow(
                  'National ID / Passport (Back)',
                  data.nidBackImage,
                ),
                _documentRow('Trade License', data.licenceImage),
                _documentRow('TIN Certificate', data.tinImage),
                _documentRow(
                  'Address Verification Document',
                  data.addressImage,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _documentRow(String title, File? file) {
    bool isUploaded = file != null;

    return Padding(
      padding: EdgeInsets.only(bottom: 12.h),
      child: Row(
        children: [
          Image.asset(
            isUploaded
                ? IconsAssetsPaths.instance.gellaryicon
                : IconsAssetsPaths.instance.pdficon,
            height: 24.h,
            width: 24.w,
            color: isUploaded ? AppColors.greenColor : AppColors.lightGrey,
          ),
          SizedBox(width: 8.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                  text: title,
                  color: isUploaded
                      ? AppColors.blackColor
                      : AppColors.lightGrey,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                ),
                SizedBox(height: 2.h),
                CustomText(
                  text: isUploaded ? '✓ Uploaded' : '✗ Not uploaded',
                  color: isUploaded ? AppColors.greenColor : AppColors.redColor,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w500,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _allDocuments(AffiliateDataModel data) {
    bool allRequiredDocsUploaded = data.hasRequiredDocuments;

    return Column(
      children: [
        Container(
          width: double.infinity.w,
          decoration: BoxDecoration(
            color: allRequiredDocsUploaded
                ? AppColors.greenColor.withOpacity(0.1)
                : AppColors.orangeColor.withOpacity(0.1),
            borderRadius: BorderRadius.all(Radius.circular(8.r)),
            border: Border.all(
              color: allRequiredDocsUploaded
                  ? AppColors.greenColor
                  : AppColors.orangeColor,
            ),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(
                      allRequiredDocsUploaded
                          ? Icons.check_circle
                          : Icons.warning,
                      color: allRequiredDocsUploaded
                          ? AppColors.greenColor
                          : AppColors.orangeColor,
                      size: 24.sp,
                    ),
                    SizedBox(width: 10.w),
                    Expanded(
                      child: CustomText(
                        maxLines: 2,
                        text: allRequiredDocsUploaded
                            ? 'All required documents are uploaded'
                            : 'Required documents are missing',
                        color: allRequiredDocsUploaded
                            ? AppColors.greenColor
                            : AppColors.orangeColor,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 12.h),
                CustomText(
                  maxLines: 5,
                  text: allRequiredDocsUploaded
                      ? '''Once submitted, you won't be able to make changes to your documents. Our team will review them within 24-48 hours.'''
                      : '''Please upload National ID Front & Back (required) before submission. Other documents are optional but recommended.''',
                  color: AppColors.lightGrey,
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w500,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
