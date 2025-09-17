import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sandlink/core/widgets/custom_app_bar.dart';
import 'package:sandlink/core/widgets/custom_text_field.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Search'),
      body: Padding(
        padding: EdgeInsets.all(20.w),
        child: Column(
          children: [
            CustomInputField(
              hintText: 'Search here...',
              prefixIcon: Icons.search_outlined,
            ),
          ],
        ),
      ),

      ///
    );
  }
}
