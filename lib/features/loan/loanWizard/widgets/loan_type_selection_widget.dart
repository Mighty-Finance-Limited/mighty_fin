import 'package:flutter/material.dart';

import '../../../../utils/constants/colors.dart';
import '../../models/loan_models.dart';
import '../../repository/loan_repo.dart';
import 'loan_selection_gesture_detector.dart';

class LoanTypeSelectionWidget extends StatelessWidget {
  const LoanTypeSelectionWidget({
    super.key,
    required this.loanProvider,
    required this.theme,
  });

  final LoanProvider loanProvider;
  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Container(
          decoration: BoxDecoration(
            // color: const Color(0xFF6A1B9A),
            borderRadius: BorderRadius.circular(16.0),
          ),
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: 16.0),
                if (loanProvider.loanTypes.isEmpty)
                // ElevatedButton(
                //   onPressed: () {
                //     loanProvider.fetchLoanTypes();
                //   },
                //   style: ElevatedButton.styleFrom(
                //     backgroundColor: const Color(0xFFFFC107),
                //     // Yellow button
                //     shape: RoundedRectangleBorder(
                //       borderRadius: BorderRadius.circular(25.0),
                //     ),
                //   ),
                //   child: const Padding(
                //     padding: EdgeInsets.symmetric(
                //       vertical: 16.0,
                //       horizontal: 32.0,
                //     ),
                //     child: Text(
                //       'Load Loan Types',
                //       style: TextStyle(
                //         color: Colors.white,
                //         fontSize: 16.0,
                //       ),
                //     ),
                //   ),
                // )
                  const Center(
                    child: CircularProgressIndicator(
                      color: secondaryBtnAmber,
                    ),
                  )

                ///TODO:Add shimmer loading effect
                // Container(
                //   padding: const EdgeInsets.all(10),
                //   height: 135,
                //   width: 140,
                //   decoration: BoxDecoration(
                //     color: const Color(0xFFf2e1f9),
                //     borderRadius: BorderRadius.circular(20),
                //   ),
                // )
                else
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: loanProvider.loanTypes
                            .map(
                              (loanType) => LoanSelectionGestureDetector(
                            context: context,
                            loanType: loanType,
                            isSelected:
                            loanProvider.selectedLoanType == loanType,
                            loanProvider: loanProvider,
                          ),
                        )
                            .toList(),
                      ),
                      if (loanProvider.selectedLoanType != null)
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 10,
                          ),
                          child: DropdownButtonFormField<LoanChildType>(
                            decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide: const BorderSide(
                                  color: secondaryBtnPrimary,
                                  width: 1,
                                ),
                              ),
                              fillColor: theme.scaffoldBackgroundColor,
                              filled: true,
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide: const BorderSide(
                                  color: secondaryBtnPrimary,
                                  width: 1,
                                ),
                              ),
                            ),
                            // dropdownColor: Colors.white,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.deepPurpleAccent,
                            ),
                            hint: const Text(
                              "Select Loan Type",
                              style: TextStyle(
                                color: Colors.deepPurpleAccent,
                              ),
                            ),
                            value: loanProvider.selectedLoanChildType,
                            items: loanProvider.selectedLoanType!.loanChildTypes
                                .map((childType) => DropdownMenuItem(
                              value: childType,
                              child: Text(
                                childType.name,
                                style: const TextStyle(
                                  // color: Colors.purple,
                                ),
                              ),
                            ))
                                .toList(),
                            onChanged: (LoanChildType? newChildType) {
                              loanProvider.selectLoanChildType(newChildType!);
                            },
                          ),
                        ),
                      if (loanProvider.selectedLoanChildType != null)
                        Column(
                          children:
                          loanProvider.selectedLoanChildType!.loanProducts
                              .map(
                                (product) => Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 5),
                              child: ListTile(
                                minTileHeight: 52.0,
                                splashColor: theme.splashColor,
                                shape: RoundedRectangleBorder(
                                  side: BorderSide(
                                    color: theme.colorScheme.primary,
                                  ),
                                  borderRadius: BorderRadius.circular(
                                    15,
                                  ),
                                ),
                                // leading: SvgPicture.network(
                                //   height: 20,
                                //   width: 20,
                                //   product.icon,
                                //   theme: const SvgTheme(
                                //     currentColor: Colors.black,
                                //   ),
                                // ),
                                title: Text(
                                  product.name,
                                  style: const TextStyle(
                                    color: textPrimary,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                subtitle: Text(
                                  product.description,
                                  style: const TextStyle(
                                    color: textPrimary,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          )
                              .toList(),
                        ),
                    ],
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}