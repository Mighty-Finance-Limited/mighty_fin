import 'package:flutter/material.dart';

import '../../../../utils/constants/colors.dart';

class ApplyForLoanSubHeadingTextWidget extends StatelessWidget {
  final String subText;
  const ApplyForLoanSubHeadingTextWidget({
    super.key, required this.subText,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 6),
      child: RichText(
        text:  TextSpan(
          text: subText,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w300,
            color: textPrimary,
          ),
        ),
      ),
    );
  }
}