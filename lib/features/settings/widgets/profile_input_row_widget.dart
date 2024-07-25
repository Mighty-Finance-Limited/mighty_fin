import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mighty_fin/features/authentication/authentication.dart';

import '../../../utils/constants/colors.dart';

class ProfileInputRowWidget extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final String? hintText;
  final String? Function(String?) validator;
  final Widget? suffixIcon;
  final Widget? prefixIcon;

  // final bool obscuredText;
  final TextInputType keyboardType;

  const ProfileInputRowWidget(
      {super.key,
      required this.controller,
      this.hintText,
      required this.validator,
      this.suffixIcon,
      this.prefixIcon,
      required this.keyboardType,
      required this.labelText});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InputHeadingTextWidget(
          text: labelText,
          horizontalPadding: 15,
          textColor: textPrimary,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
          child: TextFormField(
            keyboardType: keyboardType,
            // obscureText: obscuredText,
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
              enabledBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(5),
                ),
                borderSide: BorderSide(
                  color: borderGrey,
                  width: 2,
                ),
              ),
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
              filled: true,
              fillColor: textWhite,
              suffixIcon: suffixIcon,
            ),
          ),
        ),
      ],
    );
  }
}
