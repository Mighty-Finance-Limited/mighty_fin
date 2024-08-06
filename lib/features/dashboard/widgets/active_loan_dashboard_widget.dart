import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../utils/utils.dart';
import 'active_loan_dashboard_repayment_widget.dart';
import 'custom_dashboard_text_icon_btn.dart';
import 'custom_heading_widget.dart';


class ActiveLoanDashboardWidget extends StatelessWidget {
  const ActiveLoanDashboardWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      // color: Colors.red,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CustomDashboardIconTextBtnWidget(
                verticalPadding: 20,
                btnText: "Transfer",
                btnTextColor: textWhite,
                btnBgColor: secondaryBtnPrimary,
                btnIcon: const Icon(
                  Icons.sync_alt_outlined,
                  color: white,
                ),
                onPressed: () {},
              ),
              CustomDashboardIconTextBtnWidget(
                btnText: "Fund \nAccount",
                btnTextColor: Colors.deepPurple,
                btnBgColor: primaryBtnLightPrimary,
                btnIcon: const CircleAvatar(
                  radius: 15,
                  backgroundColor: Colors.deepPurple,
                  child: Icon(
                    Icons.upload,
                    color: white,
                  ),
                ),
                onPressed: () {},
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          CustomHeadingWidget(
              text: "Business Loan",
              textColor: textPrimary,
              rightSideWidget: TextButton(
                onPressed: () {},
                child: Text(
                  "See More",
                  style: GoogleFonts.montserrat(
                    fontSize: 15,
                    color: textPrimary,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              )),
          const ActiveLoanDashboardRepaymentWidget(),
        ],
      ),
    );
  }
}
