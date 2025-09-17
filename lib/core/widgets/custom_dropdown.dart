import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../app_colors/app_colors.dart';

class CustomDropdown extends StatelessWidget {
  final double? width;
  final Widget? prefixIcon;
  final String? hintText;
  final String selectedValue;
  final List<String> items;
  final Function(String?) onChanged;
  final TextStyle? textStyle;
  final double? borderWidth;
  final double? borderRadius;
  final Color? backgroundColor;

  const CustomDropdown({
    super.key,
    this.hintText,
    required this.selectedValue,
    this.textStyle,
    required this.items,
    required this.onChanged,
    this.prefixIcon,
    this.width,
    this.borderWidth,
    this.backgroundColor,
    this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            border: Border.all(
              color: const Color(0xFFE2E8F0),
              width: borderWidth ?? 1.w,
            ),
            borderRadius: BorderRadius.circular(borderRadius ?? 10.r),
            color: backgroundColor ?? const Color(0xFFF9F9FB),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 2.h),
            child: Row(
              children: [
                if (prefixIcon != null) ...[prefixIcon!, SizedBox(width: 15.w)],
                Expanded(
                  child: DropdownButtonFormField<String>(
                    decoration: const InputDecoration(
                      contentPadding: EdgeInsets.zero,
                      border: InputBorder.none,
                    ),
                    dropdownColor: const Color(0xFFF9F9FB),
                    initialValue: selectedValue.isNotEmpty
                        ? selectedValue
                        : null,
                    hint: Text(
                      hintText ?? 'Select an option',
                      style:
                          textStyle ??
                          TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400,
                            color: AppColors.lightGrey,
                          ),
                    ),
                    items: items.map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(
                          value,
                          style:
                              textStyle ??
                              TextStyle(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w400,
                                color: AppColors.lightGrey,
                              ),
                        ),
                      );
                    }).toList(),
                    onChanged: onChanged,
                    icon: Icon(
                      Icons.keyboard_arrow_down_outlined,
                      color: Color(0xFF718096),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
// import 'package:flutter/material.dart';

// class CustomDropdown<T> extends StatelessWidget {
//   final String? hintText;
//   final T? value;
//   final List<T> items;
//   final String Function(T)? itemLabel; // how to display the item
//   final ValueChanged<T?>? onChanged;
//   final FormFieldValidator<T>? validator;
//   final bool isExpanded;
//   final double borderRadius;
//   final EdgeInsetsGeometry contentPadding;

//   const CustomDropdown({
//     super.key,
//     this.hintText,
//     required this.items,
//     this.value,
//     this.itemLabel,
//     this.onChanged,
//     this.validator,
//     this.isExpanded = true,
//     this.borderRadius = 12,
//     this.contentPadding = const EdgeInsets.symmetric(
//       horizontal: 12,
//       vertical: 14,
//     ),
//   });

//   @override
//   Widget build(BuildContext context) {
//     return DropdownButtonFormField<T>(
//       initialValue: value,
//       validator: validator,
//       isExpanded: isExpanded,
//       decoration: InputDecoration(
//         hintText: hintText,
//         contentPadding: contentPadding,
//         border: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(borderRadius),
//         ),
//       ),
//       items: items.map((T item) {
//         return DropdownMenuItem<T>(
//           value: item,
//           child: Text(
//             itemLabel != null ? itemLabel!(item) : item.toString(),
//             style: const TextStyle(fontSize: 14),
//           ),
//         );
//       }).toList(),
//       onChanged: onChanged,
//     );
//   }
// }

// class CustomDropdown<T> extends StatelessWidget {
//   final double? width;
//   final Widget? prefixIcon;
//   final String? hintText;
//   final T? selectedValue;
//   final List<T> items;
//   final ValueChanged<T?> onChanged;
//   final String Function(T)? itemLabel;
//   final TextStyle? textStyle;
//   final double? borderWidth;
//   final double? borderRadius;
//   final Color? backgroundColor;
//   final Color? borderColor;
//   final EdgeInsetsGeometry? padding;
//   final Color? iconColor;

//   const CustomDropdown({
//     super.key,
//     this.width,
//     this.prefixIcon,
//     this.hintText,
//     required this.selectedValue,
//     required this.items,
//     required this.onChanged,
//     this.itemLabel,
//     this.textStyle,
//     this.borderWidth,
//     this.borderRadius,
//     this.backgroundColor,
//     this.borderColor,
//     this.padding,
//     this.iconColor,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: width ?? double.infinity,
//       decoration: BoxDecoration(
//         border: Border.all(
//           color: borderColor ?? const Color(0xFFE2E8F0),
//           width: borderWidth ?? 1,
//         ),
//         borderRadius: BorderRadius.circular(borderRadius ?? 10),
//         color: backgroundColor ?? const Color(0xFFF9F9FB),
//       ),
//       child: DropdownButtonFormField<T>(
//         initialValue: selectedValue,
//         decoration: const InputDecoration(
//           border: InputBorder.none,
//           isDense: true,
//           contentPadding: EdgeInsets.zero,
//         ),
//         hint: Text(
//           hintText ?? "Select an option",
//           style:
//               textStyle ??
//               const TextStyle(
//                 fontSize: 14,
//                 fontWeight: FontWeight.w400,
//                 color: Color(0xFF718096),
//               ),
//         ),
//         items: items.map((T item) {
//           return DropdownMenuItem<T>(
//             value: item,
//             child: Text(
//               itemLabel != null ? itemLabel!(item) : item.toString(),
//               style:
//                   textStyle ??
//                   const TextStyle(
//                     fontSize: 14,
//                     fontWeight: FontWeight.w400,
//                     color: Colors.black,
//                   ),
//             ),
//           );
//         }).toList(),
//         onChanged: onChanged,
//         icon: Icon(
//           Icons.keyboard_arrow_down_outlined,
//           color: iconColor ?? const Color(0xFF718096),
//         ),
//         dropdownColor: backgroundColor ?? const Color(0xFFF9F9FB),
//       ),
//     );
//   }
// }
