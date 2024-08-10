import 'package:flutter/material.dart';
import './step_three_credentials.dart';
import 'package:provider/provider.dart';

import '../../../../utils/utils.dart';
import '../../repository/loan_repo.dart';
import '../widgets/widgets_export.dart';

class StepTwoGetStartedScreen extends StatefulWidget {
  const StepTwoGetStartedScreen({
    super.key,
  });

  @override
  State<StepTwoGetStartedScreen> createState() =>
      _StepTwoGetStartedScreenState();
}

class _StepTwoGetStartedScreenState extends State<StepTwoGetStartedScreen> {
  double _currentSliderValue = 1000;

  @override
  Widget build(BuildContext context) {
    final loanProvider = Provider.of<LoanProvider>(context);
    final ThemeData theme = ThemeData();
    return Scaffold(
      // backgroundColor: const Color(0xFF6A1B9A), // Purple background
      appBar: AppBar(
        toolbarHeight: 62,
        backgroundColor: theme.scaffoldBackgroundColor,
        leading: CustomCircleBackBtnWidget(
          filledIconColor: secondaryBtnPrimary,
          filledBg: theme.scaffoldBackgroundColor,
        ),
        actions: const [
          AppBarLoanWizardStepCountWidget(
            stepCount: 2,
          ),
        ],
      ),
      body: ListView(
        children: [
          const ApplyForLoanHeadingTextWidget(
            purpleText: 'Lets Get ',
            amberText: "Started! ",
          ),
          const ApplyForLoanSubHeadingTextWidget(
            subText: 'Fill in the form to get instant access',
          ),

          /// Refactored into its own class
          LoanTypeSelectionWidget(
            loanProvider: loanProvider,
            theme: theme,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 25),
              width: double.infinity,
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(
                      25,
                    ),
                  ),
                  color: primary),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Text.rich(
                    TextSpan(text: "How much do you ", children: [
                      TextSpan(
                        text: "need",
                        style: TextStyle(
                          color: textAmber,
                        ),
                      ),
                      TextSpan(
                        text: "?",
                        style: TextStyle(
                          color: textWhite,
                        ),
                      ),
                    ]),
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: textWhite,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 5),
                    child: Text(
                      "K${_currentSliderValue.toStringAsFixed(2)}",
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Slider(
                    activeColor: secondaryBtnAmber,
                    // divisions: 15,
                    value: _currentSliderValue,
                    max: 15000,
                    min: 500,
                    // label: _currentSliderValue.round().toString(),
                    onChanged: (double value) {
                      setState(() {
                        _currentSliderValue = value;
                      });
                    },
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 20),
                        child: Text.rich(
                          TextSpan(
                            children: [
                              WidgetSpan(
                                child: Icon(
                                  Icons.info_outline,
                                  size: 13,
                                  color: secondaryBtnAmber,
                                ),
                              ),
                              TextSpan(
                                text: " Min:500",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  fontSize: 10,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: 20),
                        child: Text(
                          "Max:15000",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 10,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
          const Center(
            child: Text(
              "Duration",
              style: TextStyle(
                fontWeight: FontWeight.w500,
                color: textPrimary,
              ),
            ),
          ),
          const LoanDurationCounterWidget(),
          const Center(
            child: Text.rich(
              TextSpan(children: [
                WidgetSpan(
                  child: Icon(
                    Icons.info_outline,
                    size: 13,
                    color: secondaryBtnAmber,
                  ),
                ),
                TextSpan(
                  text: " The maximum duration is 6 months",
                )
              ]),
              style: TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w500,
                color: textAmber,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 25),
              width: double.infinity,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(
                    25,
                  ),
                ),
                color: primary,
              ),
              child: const Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text.rich(
                    TextSpan(text: "     Total ", children: [
                      TextSpan(
                        text: "\nRepayment",
                        style: TextStyle(
                          color: textAmber,
                        ),
                      ),
                      TextSpan(
                        text: "\nK51000.00",
                        style: TextStyle(
                          color: textWhite,
                        ),
                      ),
                    ]),
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: textWhite,
                      fontSize: 11,
                    ),
                  ),
                  Text.rich(
                    TextSpan(text: "   Monthly ", children: [
                      TextSpan(
                        text: "\n Repayment",
                        style: TextStyle(
                          color: textAmber,
                        ),
                      ),
                      TextSpan(
                        text: "\n K51000.00",
                        style: TextStyle(
                          color: textWhite,
                        ),
                      ),
                    ]),
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: textWhite,
                      fontSize: 11,
                    ),
                  ),
                  Text.rich(
                    TextSpan(text: "Next Repayment ", children: [
                      TextSpan(
                        text: "\n         Date",
                        style: TextStyle(
                          color: textAmber,
                        ),
                      ),
                      TextSpan(
                        text: "\n   02/05/2024",
                        style: TextStyle(
                          color: textWhite,
                        ),
                      ),
                    ]),
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: textWhite,
                      fontSize: 11,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Checkbox(
                  value: false,
                  onChanged: (value) {},
                ),
                const Text.rich(
                  TextSpan(
                    text: "I agree to the following",
                  ),
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: textPrimary,
                    fontSize: 12,
                  ),
                ),
                TextButton(
                  style: ButtonStyle(
                    shape: WidgetStatePropertyAll(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                          10,
                        ),
                      ),
                    ),
                    padding: const WidgetStatePropertyAll(
                      EdgeInsets.symmetric(
                        horizontal: 2,
                      ),
                    ),
                  ),
                  onPressed: () =>
                      Navigator.pushNamed(context, "/termsAndConditions"),
                  child: const Text(
                    "Terms and Conditions",
                    style: TextStyle(
                      color: textAmber,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
          CustomLongBtnWidget(
            btnText: "Next",
            bgColor: secondaryBtnAmber,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const StepThreeCredentialsScreen(),
                ),
              );
              // if (loanProvider.loanTypes.isEmpty) {
              //   loanProvider.fetchLoanTypes();
              // }
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(
              //     builder: (context) => const StepTwoGetStartedScreen(),
              //   ),
              // );
            },
          ),
        ],
      ),
    );
  }
}
