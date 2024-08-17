import 'package:flutter_bloc/flutter_bloc.dart';

class LoanAmountCubit extends Cubit<int> {
  LoanAmountCubit() : super(1000); // Initial slider value

  void updateAmount(int value) {
    emit(value);
  }
}