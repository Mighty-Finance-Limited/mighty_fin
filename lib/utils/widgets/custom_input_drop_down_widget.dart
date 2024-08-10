import 'package:flutter/material.dart';
import 'package:mighty_fin/utils/utils.dart';

class CustomInputDropDownField<T> extends StatelessWidget {
  final T? value;
  final List<T> items;
  final void Function(T?) onChanged;
  final String Function(T?) getText;
  final String hintText;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final String? Function(T?) validator;

  const CustomInputDropDownField({
    super.key,
    required this.value,
    required this.items,
    required this.onChanged,
    required this.getText,
    required this.hintText,
    required this.validator, this.suffixIcon, this.prefixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<T?>(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      validator: validator,
      decoration:  InputDecoration(
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        fillColor: white,
        filled: false,
        enabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
          borderSide: BorderSide(
            color: borderGrey,
            width: 2,
          ),
        ),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(
              5,
            ),
          ),
        ),
      ),
      value: value,
      // autofocus: true,
      icon: const Icon(
        Icons.keyboard_arrow_down,
        color: primary,
        size: 35,
      ),
      elevation: 1,
      hint: Text(
        hintText,
        style: const TextStyle(
          color: textGrey,
          fontWeight: FontWeight.w600,
        ),
      ),
      borderRadius: BorderRadius.circular(
        5,
      ),
      style: const TextStyle(
        color: primary,
        fontWeight: FontWeight.w600,
      ),
      onChanged: onChanged,
      items: items.map<DropdownMenuItem<T?>>((T value) {
        return DropdownMenuItem<T?>(
          value: value,
          child: Text(getText(value)),
        );
      }).toList(),
    );
  }
}
