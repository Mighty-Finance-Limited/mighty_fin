import 'package:flutter/material.dart';

import '../../../../utils/constants/colors.dart';

class ApplyForLoanHeadingTextWidget extends StatelessWidget {
  final String purpleText;
  final String amberText;
  const ApplyForLoanHeadingTextWidget({
    super.key, required this.purpleText, required this.amberText,
  });

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 15,
        vertical: 6,
      ),
      child: Text.rich(
        TextSpan(
          text: purpleText ,
          children: [
            TextSpan(
              text: amberText ,
              style: const TextStyle(
                color: textAmber,
              ),
            )
          ],
        ),
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: textPrimary,
        ),
      ),
    );
  }
}