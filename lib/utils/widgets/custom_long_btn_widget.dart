import 'package:flutter/material.dart';

import '../constants/colors.dart';

class CustomLongBtnWidget extends StatelessWidget {
  final String btnText;
  final Color bgColor;
  final VoidCallback onPressed;

  const CustomLongBtnWidget({
    super.key, required this.btnText, required this.bgColor, required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 30,
        vertical: 10,
      ),
      child: ElevatedButton(
        style:  ButtonStyle(
            padding: const WidgetStatePropertyAll(
              EdgeInsets.symmetric(
                vertical: 15,
              ),
            ),
            backgroundColor: WidgetStatePropertyAll(
              bgColor,
            )),
        onPressed: onPressed,
        child: Text(
          btnText,
          style: const TextStyle(
            color: white,
          ),
        ),
      ),
    );
  }
}