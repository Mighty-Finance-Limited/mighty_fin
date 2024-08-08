
import 'package:flutter/material.dart';

import '../../../../utils/constants/colors.dart';

class AppBarLoanWizardStepCountWidget extends StatelessWidget {
  final int stepCount;
  const AppBarLoanWizardStepCountWidget({
    super.key, required this.stepCount,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 4,bottom: 4,top: 4),
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(30),
            bottomLeft: Radius.circular(30),
            // bottomRight: Radius.circular(30)
          ),
          border: Border.all(
            width: 2,
            color: circleBorderprimary,
          )
      ),
      child: Container(
        clipBehavior: Clip.antiAlias,
        padding: const EdgeInsets.all(15),
        decoration: const BoxDecoration(
            color: circleBorderprimary,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              bottomLeft: Radius.circular(30),
              // bottomRight: Radius.circular(30)
            )
        ),
        child:  Text(
          "Step $stepCount/4".toString(),
          style: const TextStyle(
            // fontSize: 20,
            fontWeight: FontWeight.bold,
            color: textPrimary,
          ),
        ),
      ),
    );
  }
}