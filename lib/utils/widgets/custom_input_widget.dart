import 'package:flutter/material.dart';

import '../constants/colors.dart';

class CustomInputWidget extends StatelessWidget {
  final TextEditingController controller;
  final String? hintText;
  final String? Function(String?) validator;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final bool obscuredText;
  final bool? filledInput;
  final TextInputType keyboardType;
  final double? horizontalPadding;
  final int?  maxLines;

  const CustomInputWidget({
    super.key,
    required this.controller,
    required this.validator,
    this.suffixIcon,
    this.prefixIcon,
    required this.obscuredText,
    required this.keyboardType, this.hintText, this.horizontalPadding, this.filledInput, this.maxLines,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5, horizontal: horizontalPadding ?? 25),
      child: TextFormField(
        maxLines: maxLines,
        keyboardType: keyboardType,
        obscureText: obscuredText,
        validator: validator,
        controller: controller,
        decoration: InputDecoration(
          enabledBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
            borderSide: BorderSide(
              color: borderGrey,
              width: 2,
            ),
          ),
          hintText: hintText,
          errorStyle: const TextStyle(
            color: errorColor,
          ),
          constraints: const BoxConstraints(
            maxWidth: 400,
            minWidth: 200,
          ),
          focusColor: primary,
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(5),
            ),
            borderSide: BorderSide(
              color: primary,
            ),
          ),
          prefixIcon: prefixIcon,
          // labelStyle: const TextStyle(
          //   color: textBlack,
          // ),
          filled: filledInput?? false,
          fillColor: textWhite,
          suffixIcon: suffixIcon,
        ),
      ),
    );
  }
}
