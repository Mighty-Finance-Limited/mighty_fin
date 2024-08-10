import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class InputHeadingTextWidget extends StatelessWidget {
  final String text;
  final Color? textColor;
  final double? textFontSize;
  final double? horizontalPadding;

  const InputHeadingTextWidget({
    super.key,
    required this.text, this.textColor, this.horizontalPadding, this.textFontSize,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 0, horizontal:horizontalPadding ?? 25),
      child: Text(
        text,
        style: GoogleFonts.montserrat(
          fontWeight: FontWeight.bold,
          color: textColor,
          fontSize: textFontSize ?? 13,
        ),
      ),
    );
  }
}
