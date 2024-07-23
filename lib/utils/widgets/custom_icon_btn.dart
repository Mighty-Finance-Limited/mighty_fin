import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mighty_fin/utils/constants/colors.dart';

class CustomIconBtn extends StatelessWidget {
  final bool showSideMenu;
  final IconData icon;
  final String toolTip;
  final String subText;
  final VoidCallback onPressed;

  const CustomIconBtn({
    super.key,
    required this.icon,
    required this.onPressed,
    required this.toolTip,
    required this.subText,
    required this.showSideMenu,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        IconButton(
          tooltip: toolTip,
          style: ButtonStyle(
            fixedSize: showSideMenu
                ? WidgetStateProperty.all(const Size(55, 55))
                : WidgetStateProperty.all(
                    const Size.fromWidth(
                      double.infinity,
                    ),
                  ),
            shape: WidgetStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
            ),
            backgroundColor: const WidgetStatePropertyAll<Color>(
              bgPrimary,
            ),
          ),
          onPressed: onPressed,
          icon: Icon(
            icon,
            color: Colors.white,
            size: showSideMenu ? 25 : 30,
          ),
          color: Colors.white,
          padding: showSideMenu? const EdgeInsets.all(5): const EdgeInsets.all(20),
        ),
        Text(
          subText,
          style: GoogleFonts.montserrat(
            color:primary,
            fontWeight: FontWeight.w500,
            fontSize: showSideMenu? 11 : 12,
          ),
        ),
      ],
    );
  }
}
