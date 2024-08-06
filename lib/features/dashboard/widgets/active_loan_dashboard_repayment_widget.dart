import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../utils/constants/colors.dart';

class ActiveLoanDashboardRepaymentWidget extends StatelessWidget {
  const ActiveLoanDashboardRepaymentWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
      const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Container(
        padding: const EdgeInsets.symmetric(
            horizontal: 10, vertical: 20),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(
              25,
            ),
          ),
          color: secondaryAmber,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Repayment",
                    style: GoogleFonts.montserrat(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(
                    height: 2,
                  ),
                  Text(
                    "K39,702,00",
                    style: GoogleFonts.montserrat(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 2,
                  ),
                  Text(
                    "Due 01/02/2024",
                    style: GoogleFonts.montserrat(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            ElevatedButton(
              style: ButtonStyle(
                elevation: const WidgetStatePropertyAll(4),
                shape: WidgetStatePropertyAll(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                ),
                padding: const WidgetStatePropertyAll(
                  EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 15,
                  ),
                ),
                backgroundColor: const WidgetStatePropertyAll(
                  white,
                ),
              ),
              onPressed: () {},
              child: Row(
                children: [
                  Text(
                    'Repay Now',
                    style: GoogleFonts.montserrat(
                      color: secondaryBtnPrimary,
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                    ),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  const Icon(
                    Icons.gpp_good_outlined,
                    size: 15,
                    color: secondaryBtnPrimary,
                  )
                ],
              ),
            ),
            // CustomDashboardIconTextBtnWidget(
            //   btnText: "Repay Now",
            //   btnTextColor: textPrimary,
            //   btnBgColor: white,
            //   btnIcon: const Icon(
            //     Icons.gpp_bad,
            //     color: secondaryBtnPrimary,
            //   ),
            //   onPressed: () {},
            // ),
          ],
        ),
      ),
    );
  }
}