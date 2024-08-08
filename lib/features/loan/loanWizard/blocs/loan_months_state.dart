part of 'loan_months_bloc.dart';

@immutable
sealed class LoanMonthsState {
  final int loanDurationCount;

  const LoanMonthsState({required this.loanDurationCount});

  String get monthString =>
      loanDurationCount == 1 ? 'Month' : 'Months';
}

final class LoanMonthsInitial extends LoanMonthsState {
  const LoanMonthsInitial({required super.loanDurationCount});
}
