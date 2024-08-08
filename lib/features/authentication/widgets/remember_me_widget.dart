import 'package:flutter/material.dart';

import '../../../utils/utils.dart';

class RememberMeWidget extends StatelessWidget {
  final String? text;
  final String? btnText;
  final double? horizontalPadding;
  final VoidCallback onPressed;
  const RememberMeWidget({
    super.key, this.text, this.btnText, required this.onPressed, this.horizontalPadding,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 0, horizontal:horizontalPadding?? 18),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Checkbox(
                value: false,
                onChanged: (value) {},
              ),
               Text(
                text??"Remember Me",
                style: const TextStyle(
                    color: primary,
                    fontWeight: FontWeight.bold,
                    fontSize: 13
                ),
              ),
            ],
          ),
          TextButton(
            onPressed: onPressed,
            child:  Text(
              btnText??"Forgot Password",
              style: const TextStyle(
                color: textAmber,
                fontSize: 13,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}