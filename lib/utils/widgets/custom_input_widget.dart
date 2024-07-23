import 'package:flutter/material.dart';

import '../constants/colors.dart';

class CustomInputWidget extends StatelessWidget {
  final TextEditingController controller;
  final String? hintText;
  final String? Function(String?) validator;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final bool obscuredText;
  final TextInputType keyboardType;

  const CustomInputWidget({
    super.key,
    required this.controller,
    required this.validator,
    this.suffixIcon,
    this.prefixIcon,
    required this.obscuredText,
    required this.keyboardType, this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 25),
      child: TextFormField(
        keyboardType: keyboardType,
        obscureText: obscuredText,
        validator: validator,
        controller: controller,
        decoration: InputDecoration(
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
              style: BorderStyle.solid,
              width: 3,
            ),
          ),
          prefixIcon: prefixIcon,
          // labelStyle: const TextStyle(
          //   color: textBlack,
          // ),
          filled: false,
          // fillColor: textWhite,
          suffixIcon: suffixIcon,
        ),
      ),
    );
  }
}
