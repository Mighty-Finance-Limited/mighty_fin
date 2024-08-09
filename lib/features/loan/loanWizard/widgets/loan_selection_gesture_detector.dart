
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/svg_icons.dart';
import '../../models/loan_models.dart';
import '../../repository/loan_repo.dart';

class LoanSelectionGestureDetector extends StatelessWidget {
  const LoanSelectionGestureDetector({
    super.key,
    required this.context,
    required this.loanType,
    required this.isSelected,
    required this.loanProvider,
  });

  final BuildContext context;
  final LoanType loanType;
  final bool isSelected;
  final LoanProvider loanProvider;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        loanProvider.selectLoanType(loanType);
      },
      child: Container(
        padding: const EdgeInsets.all(10),
        height: 135,
        width: 140,
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFFFFC107) : primary,
          border: Border.all(
            color: isSelected ? const Color(0xFFFFC107) : primary,
          ),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SvgPicture.network(
                  color: textWhite,
                  loanType.icon,
                  theme: SvgTheme(
                    currentColor: isSelected ? Colors.white : textWhite,
                  ),
                  height: 24,
                  width: 24,
                ),
                Checkbox(
                  shape: const CircleBorder(),
                  activeColor: secondaryBtnPrimary,
                  fillColor: const WidgetStatePropertyAll(
                    secondaryBtnPrimary,
                  ),
                  value: isSelected,
                  onChanged: (value) {
                    !isSelected;
                  },
                ),
              ],
            ),
            const SizedBox(height: 2),
            Text(
              loanType.name,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: isSelected ? textWhite : textWhite,
              ),
            ),
            Text(
              loanType.typeName,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: isSelected ? textWhite : textWhite,
              ),
            ),
          ],
        ),
      ),
    );
  }
}