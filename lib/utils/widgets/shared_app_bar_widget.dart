import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants/colors.dart';
import 'custom_circle_back_btn_widget.dart';

class SharedAppBarWidget extends StatelessWidget {
  final String appBarTitle;
  final Widget? leadingWidget;
  final VoidCallback onPressed;
  final bool showLeading;

  const SharedAppBarWidget(
      {super.key,
      required this.appBarTitle,
      required this.onPressed,
      required this.showLeading, this.leadingWidget});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: scaffoldPrimary,
      leading: leadingWidget,
      automaticallyImplyLeading: showLeading,
      title: Text(
        appBarTitle,
        style: GoogleFonts.montserrat(
          fontWeight: FontWeight.bold,
          fontSize: 18,
          color: textPrimary,
        ),
      ),
      iconTheme: const IconThemeData(
        size: 30,
        color: secondaryBtnPrimary,
      ),
      actions: [
        IconButton(
          onPressed: onPressed,
          icon: const Icon(
            Icons.notifications_outlined,
          ),
        ),
      ],
    );
  }
}
