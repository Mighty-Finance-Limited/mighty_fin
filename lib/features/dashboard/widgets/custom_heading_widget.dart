import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';

class CustomHeadingWidget extends StatelessWidget {
  final String text;
  const CustomHeadingWidget({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return   Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 8,
      ),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 17,
          color: textAmber,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
