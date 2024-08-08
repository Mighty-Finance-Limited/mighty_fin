import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'loan_months_event.dart';
part 'loan_months_state.dart';

class LoanMonthsBloc extends Bloc<LoanMonthsEvent, LoanMonthsState> {
  LoanMonthsBloc() : super(const LoanMonthsInitial(loanDurationCount: 1)) {
    on<LoanMonthIncrementCounterEvent>((event, emit) {
      if (state.loanDurationCount < 6) {
        emit(
          LoanMonthsInitial(
            loanDurationCount: state.loanDurationCount + 1,
          ),
        );
      }
    });

    on<LoanMonthDecrementCounterEvent>((event, emit) {
      if (state.loanDurationCount > 1) {
        emit(
          LoanMonthsInitial(
            loanDurationCount: state.loanDurationCount - 1,
          ),
        );
      }
    });
  }
}
