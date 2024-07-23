import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'custom_icon_btn.dart';

class QuickActions extends StatelessWidget {
  final bool showSideMenu;
  const QuickActions({super.key, required this.showSideMenu});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: showSideMenu? 90: 120,
        // color: Colors.red,
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          // scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CustomIconBtn(
                showSideMenu: showSideMenu,
                subText: "My Loans",
                toolTip: "Loan Information",
                icon: Icons.track_changes_outlined,
                onPressed: () {
                  // Get.to(LoanHistoryScreen(isNested: true));
                },
              ),
              CustomIconBtn(
                showSideMenu: showSideMenu,
                subText: "Pay Bills",
                toolTip: "Make Bill Payments",
                icon: CupertinoIcons.doc_plaintext,
                onPressed: () {
                  // Get.to(const PayBillScreen());
                },
              ),
              CustomIconBtn(
                showSideMenu: showSideMenu,
                subText: "KYC",
                toolTip: "Know Ypur Customer Information",
                icon: Icons.electric_bolt_outlined,
                onPressed: () {
                  // Get.to(KYCIntroScreen());
                },
              ),
              CustomIconBtn(
                showSideMenu: showSideMenu,
                subText: "Support",
                toolTip: "Help and Support",
                icon: Icons.support_agent_outlined,
                onPressed: () {
                  // Get.to(const SupportScreen());
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}