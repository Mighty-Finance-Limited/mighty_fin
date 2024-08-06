import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../utils/constants/colors.dart';

class CustomDashboardIconTextBtnWidget extends StatelessWidget {
  final String btnText;
  final Color btnTextColor;
  final Color btnBgColor;
  final Widget btnIcon;
  final double? verticalPadding;
  final VoidCallback onPressed;

  const CustomDashboardIconTextBtnWidget({
    super.key,
    required this.btnText,
    required this.btnTextColor,
    required this.btnBgColor,
    required this.btnIcon,
    required this.onPressed, this.verticalPadding,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style:  ButtonStyle(
          shape: const WidgetStatePropertyAll(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
            ),
          ),
          backgroundColor: WidgetStatePropertyAll(
            btnBgColor,
          ),
          padding: WidgetStatePropertyAll(
            EdgeInsets.symmetric(
              horizontal: 25,
              vertical: verticalPadding?? 15,
            ),
          )),
      child:  Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          btnIcon,
          const SizedBox(
            width: 10,
          ),
          Text(
           btnText,
            style: GoogleFonts.montserrat(
              color: btnTextColor,
              fontWeight: FontWeight.bold,
              fontSize: 11,
            ),
          ),
        ],
      ),
    );
  }
}
