import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mighty_fin/features/loan/loanWizard/apply/step_two_getstarted.dart';
import 'package:mighty_fin/utils/utils.dart';
import 'package:provider/provider.dart';
import '../../repository/loan_repo.dart';
import '../widgets/app_bar_loan_wizard_step_count.dart';

class StepOneIntroScreen extends StatelessWidget {
  const StepOneIntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final loanProvider = Provider.of<LoanProvider>(context);
    final ThemeData theme = ThemeData();
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 62,
        backgroundColor: theme.scaffoldBackgroundColor,
        leading: CustomCircleBackBtnWidget(
          filledIconColor: secondaryBtnPrimary,
          filledBg: theme.scaffoldBackgroundColor,
        ),
        actions: const [
          AppBarLoanWizardStepCountWidget(
            stepCount: 1,
          ),
        ],
      ),
      bottomNavigationBar: CustomLongBtnWidget(
        btnText: "Next",
        bgColor: secondaryBtnAmber,
        onPressed: () {
          if (loanProvider.loanTypes.isEmpty){
          loanProvider.fetchLoanTypes();
          }
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const StepTwoGetStartedScreen(),
            ),
          );
        },
      ),
      body: ListView(
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 6),
            child: Text.rich(
              TextSpan(
                text: 'Ready, get set, ',
                children: [
                  TextSpan(
                    text: "Go! ",
                    style: TextStyle(
                      color: textAmber,
                    ),
                    children: [
                      WidgetSpan(
                        child: Icon(
                          Icons.info_outline,
                          color: secondaryAmber,
                        ),
                      ),
                    ],
                  )
                ],
              ),
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: textPrimary,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 6),
            child: RichText(
              text: const TextSpan(
                text:
                    'Before we start, there are a few things you have to know!.',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                  color: textPrimary,
                ),
                children: [
                  TextSpan(
                      text:
                          "\nMake sure you have the following made available.")
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Container(
              padding: const EdgeInsets.all(10),
              height: 360,
              // color: Colors.red,
              child: Stack(
                alignment: AlignmentDirectional.center,
                children: [
                  Container(
                    height: 270,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: primary,
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  const Positioned(
                    top: 0,
                    child: CircleAvatar(
                      radius: 35,
                      backgroundColor: white,
                      child: Icon(
                        CupertinoIcons.doc_plaintext,
                        color: secondaryBtnPrimary,
                      ),
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ListTile(
                        leading: const Icon(
                          Icons.card_giftcard,
                          color: white,
                        ),
                        title: Text(
                          "National ID OR Any Other Identification Card"
                              .toUpperCase(),
                          style: const TextStyle(
                              color: textWhite,
                              fontWeight: FontWeight.bold,
                              fontSize: 12),
                        ),
                      ),
                      ListTile(
                        leading: const Icon(
                          CupertinoIcons.building_2_fill,
                          color: white,
                        ),
                        title: Text(
                          "3 MONTHS BANK STATEMENT"
                              .toUpperCase(),
                          style: const TextStyle(
                              color: textWhite,
                              fontWeight: FontWeight.bold,
                              fontSize: 12),
                        ),
                      ),
                      ListTile(
                        leading: const Icon(
                          CupertinoIcons.doc,
                          color: white,
                        ),
                        title: Text(
                          "LATEST UPDATED PAYSLIP"
                              .toUpperCase(),
                          style: const TextStyle(
                            color: textWhite,
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
