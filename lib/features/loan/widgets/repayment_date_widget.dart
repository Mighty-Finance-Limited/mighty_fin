
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../utils/constants/colors.dart';

class RepaymentDateWIdget extends StatelessWidget {
  final double? horizontalPadding;
  final Color? color;
  const RepaymentDateWIdget({
    super.key, this.horizontalPadding, this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal:horizontalPadding ?? 20,vertical: 5),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
           Icon(
            Icons.schedule_outlined,
            color: color?? primary,
          ),
          const SizedBox(
            width: 5,
          ),
          Text(
            "30 days Remaining",
            style: GoogleFonts.montserrat(
              fontWeight: FontWeight.bold,
              fontSize: 11,
              color: color?? textPrimary,
            ),
          ),
        ],
      ),
    );
  }
}