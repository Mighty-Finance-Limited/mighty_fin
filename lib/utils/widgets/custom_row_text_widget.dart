
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants/colors.dart';

class CustomRowTextWidget extends StatelessWidget {
  final String? leftText;
  final String? rightText;
  const CustomRowTextWidget({super.key, this.leftText, this.rightText});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 8,
          ),
          child: Text(
            leftText??"",
            style: GoogleFonts.montserrat(
              fontSize: 16,
              color: textAmber,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 8,
          ),
          child: Text(
            rightText?? "",
            style: GoogleFonts.montserrat(
              fontSize: 15,
              color: textPrimary,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }
}
