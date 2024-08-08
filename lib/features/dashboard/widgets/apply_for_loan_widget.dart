import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mighty_fin/features/loan/loanWizard/apply/step_one_intro.dart';
import 'package:mighty_fin/utils/constants/colors.dart';

class ApplyForLoanWidget extends StatelessWidget {
  final Size preferredSize;

  const ApplyForLoanWidget({super.key, required this.preferredSize});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(
        padding: const EdgeInsets.all(
          20,
        ),
        width: preferredSize.height / 2,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(
              30,
            ),
          ),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment(0.8, 1),
            colors: <Color>[
              Color(0xff673296),
              Color(0xff753cad),
              Color(0xff8849cc),
              Color(0xff9c58ee),
            ],
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text.rich(
                  TextSpan(text: "Apply for a ", children: [
                    TextSpan(
                        text: "Loan",
                        style: TextStyle(
                          color: textAmber,
                        ))
                  ]),
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                ElevatedButton(
                  style: const ButtonStyle(
                      backgroundColor: WidgetStatePropertyAll(
                    Colors.amber,
                  )),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const StepOneIntroScreen(),
                      ),
                    );
                  },
                  child: const Text(
                    "Get Started",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
            Image.asset(
              "assets/people/woman.png",
              scale: 8,
            ),
          ],
        ),
      ),
    );
  }
}
