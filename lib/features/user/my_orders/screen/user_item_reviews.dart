import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sandlink/core/app_colors/app_colors.dart';
import 'package:sandlink/core/widgets/custom_app_bar.dart';
import 'package:sandlink/core/widgets/custom_button.dart';
import 'package:sandlink/core/wrappers/custom_text.dart';

import '../../../../core/widgets/custom_text_field.dart';
import '../controllers/my_orders_controllers.dart';

class UserItemReviewsScreen extends StatelessWidget {
  final controller = Get.put(MyOrdersController());

  UserItemReviewsScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Review',
        onLeadingPressed: () => Get.back(),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16.r),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(
                text: 'Rate your experience',
                color: AppColors.blackColor,
                fontWeight: FontWeight.w500,
                fontSize: 16.sp,
              ),

              SizedBox(height: 10.h),

              CustomText(
                maxLines: 2,
                text: 'Share your experience on the comment field below.',
                color: AppColors.lightGrey,
                fontWeight: FontWeight.w400,
                fontSize: 14.sp,
              ),

              SizedBox(height: 24.h),

              Center(
                child: RatingBar.builder(
                  initialRating: 4,
                  minRating: 1,
                  direction: Axis.horizontal,
                  allowHalfRating: false,
                  itemCount: 5,
                  itemSize: 28.h,
                  itemPadding: EdgeInsets.symmetric(horizontal: 1.0.r),
                  itemBuilder: (context, _) =>
                      Icon(Icons.star, color: AppColors.orangeColor),
                  onRatingUpdate: (rating) {
                    if (kDebugMode) {
                      print(rating);
                    }
                  },
                ),
              ),

              SizedBox(height: 24.h),

              CustomInputField(
                maxLines: 5,
                hintText: 'Write your reviews',
                //textController: controller.userReviewFeedbackController,
                borderSide: BorderSide(width: 1, color: AppColors.lightGreyD1),
              ),
              Spacer(),
              _submitButton(),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _submitButton() {
  return CustomButton(
    onPressed: () {},
    text: 'Submit',
    textColor: AppColors.whiteColor,
    fontSize: 18.sp,
    fontWeight: FontWeight.w500,
  );
}
