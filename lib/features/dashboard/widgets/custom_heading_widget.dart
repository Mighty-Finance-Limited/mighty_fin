import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../utils/constants/colors.dart';

class CustomHeadingWidget extends StatelessWidget {
  final String text;
  final Color? textColor;
  final Widget? rightSideWidget;

  const CustomHeadingWidget(
      {super.key, required this.text, this.textColor, this.rightSideWidget});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 8,
          ),
          child: Text(
            text,
            style: TextStyle(
              fontSize: 17,
              color: textColor ?? textAmber,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 8,
          ),
          child:rightSideWidget?? Container(),
        ),
      ],
    );
  }
}
