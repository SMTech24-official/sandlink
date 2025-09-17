import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomDropdown2<T> extends StatelessWidget {
  final String? hintText;
  final T? value;
  final List<T> items;
  final String Function(T)? itemLabel; // how to display the item
  final ValueChanged<T?>? onChanged;
  final FormFieldValidator<T>? validator;
  final bool isExpanded;
  final double borderRadius;
  final EdgeInsetsGeometry contentPadding;
  final Color? backgroundColor;

  const CustomDropdown2({
    super.key,
    this.hintText,
    required this.items,
    this.value,
    this.itemLabel,
    this.onChanged,
    this.validator,
    this.isExpanded = true,
    this.borderRadius = 12,
    this.contentPadding = const EdgeInsets.symmetric(
      horizontal: 12,
      vertical: 14,
    ),
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: backgroundColor ?? Color(0xFFF9F9FB),
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: DropdownButtonFormField<T>(
        initialValue: value,
        validator: validator,
        isExpanded: isExpanded,
        dropdownColor: Colors.white,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: const TextStyle(color: Colors.white),
          contentPadding: contentPadding,
          border: InputBorder.none,
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
          disabledBorder: InputBorder.none,
          errorBorder: InputBorder.none,
        ),
        items: items.map((T item) {
          return DropdownMenuItem<T>(
            value: item,
            child: Text(
              itemLabel != null ? itemLabel!(item) : item.toString(),
              style: TextStyle(fontSize: 14.spMin),
            ),
          );
        }).toList(),
        onChanged: onChanged,
      ),
    );
  }
}
