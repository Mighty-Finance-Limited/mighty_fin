import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../utils/constants/colors.dart';
import '../blocs/loan_months_bloc.dart';

class LoanDurationCounterWidget extends StatelessWidget {
  const LoanDurationCounterWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: BlocBuilder<LoanMonthsBloc, LoanMonthsState>(
        builder: (context, state) {
          return Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                style: ButtonStyle(
                  fixedSize: WidgetStateProperty.all(const Size(55, 55)),
                  shape: WidgetStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  backgroundColor: const WidgetStatePropertyAll<Color>(
                    bgPrimary,
                  ),
                ),
                onPressed: () {
                  context.read<LoanMonthsBloc>().add(
                    LoanMonthDecrementCounterEvent(),
                  );
                },
                icon: const Icon(
                  Icons.horizontal_rule_outlined,
                  color: textWhite,
                ),
              ),
              Container(
                decoration: const BoxDecoration(
                  color: circleBorderprimary,
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
                child: Padding(
                  padding:
                  const EdgeInsets.symmetric(horizontal: 35, vertical: 15),
                  child: Text(
                    "${state.loanDurationCount.toString()} (${state.monthString})",
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: textPrimary,
                    ),
                  ),
                ),
              ),
              IconButton(
                style: ButtonStyle(
                  fixedSize: WidgetStateProperty.all(const Size(55, 55)),
                  shape: WidgetStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  backgroundColor: const WidgetStatePropertyAll<Color>(
                    bgPrimary,
                  ),
                ),
                onPressed: () {
                  context.read<LoanMonthsBloc>().add(
                    LoanMonthIncrementCounterEvent(),
                  );
                },
                icon: const Icon(
                  Icons.add,
                  color: textWhite,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
