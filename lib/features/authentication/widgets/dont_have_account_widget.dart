import 'package:flutter/material.dart';

import '../../../utils/utils.dart';

class DontHaveAccountWidget extends StatelessWidget {
  final String text;
  final String btnText;
  final VoidCallback onPressed;

  const DontHaveAccountWidget({
    super.key,
    required this.text,
    required this.btnText,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 18),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            text,
            style: const TextStyle(
              color: primary,
              fontWeight: FontWeight.bold,
              fontSize: 11,
            ),
          ),
          TextButton(
            onPressed: onPressed,
            child:  Text(
              btnText,
              style: const TextStyle(
                color: textAmber,
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
