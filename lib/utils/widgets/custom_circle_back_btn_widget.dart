
import 'package:flutter/material.dart';

import '../constants/colors.dart';

class CustomCircleBackBtnWidget extends StatelessWidget {
  final Color? filledBg;
  final Color? filledIconColor;
  const CustomCircleBackBtnWidget({
    super.key, this.filledBg, this.filledIconColor,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: IconButton(
        style:  ButtonStyle(
            backgroundColor: WidgetStatePropertyAll(
              filledBg ?? secondaryBtnPrimary,
            ),
            shape: const WidgetStatePropertyAll(CircleBorder(
              side: BorderSide(
                color: secondaryBtnPrimary,
              )
            ))),
        icon:  Padding(
          padding: const EdgeInsets.symmetric(horizontal: 3),
          child: Icon(
            Icons.arrow_back_ios,
            size: 15,
            color: filledIconColor ?? white,
          ),
        ),
        onPressed: () => Navigator.pop(context),
      ),
    );
  }
}