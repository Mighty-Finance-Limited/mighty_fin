import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AuthHeadingTextWidget extends StatelessWidget {
  final String text;

  const AuthHeadingTextWidget({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 25),
      child: Text(
        text,
        style: GoogleFonts.montserrat(
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
