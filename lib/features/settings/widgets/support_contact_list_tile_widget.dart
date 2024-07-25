import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../utils/constants/colors.dart';

class SupportContactListTileWidget extends StatelessWidget {
  final String text;
  final IconData icon;
  final VoidCallback onTap;
  const SupportContactListTileWidget({
    super.key, required this.text, required this.icon, required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: ListTile(
        onTap: onTap,
        leading:  CircleAvatar(
          radius: 17,
          backgroundColor: primary,
          child: Icon(
            icon,
            color: white,
          ),
        ),
        title: Text(
          text,
          style: GoogleFonts.montserrat(
            fontSize: 12,
            fontWeight: FontWeight.bold,
            color: textPrimary,
          ),
        ),
      ),
    );
  }
}