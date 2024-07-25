import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';

class CustomHeadingWidget extends StatelessWidget {
  final String text;
  final Color? textColor;
  const CustomHeadingWidget({super.key, required this.text, this.textColor});

  @override
  Widget build(BuildContext context) {
    return   Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 8,
      ),
      child: Text(
        text,
        style:  TextStyle(
          fontSize: 17,
          color: textColor ?? textAmber,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
