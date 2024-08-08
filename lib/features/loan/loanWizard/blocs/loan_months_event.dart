part of 'loan_months_bloc.dart';

@immutable
sealed class LoanMonthsEvent {}

class LoanMonthIncrementCounterEvent extends LoanMonthsEvent{}

class LoanMonthDecrementCounterEvent extends LoanMonthsEvent{}
