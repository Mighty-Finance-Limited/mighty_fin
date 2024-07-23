import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'counter_event.dart';

part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, int> {
  CounterBloc() : super(0) {
    on<CounterIncrementEvent>((event, emit) {
      emit(state + 1);
    });
    on<CounterDecrementEvent>((event, emit) {
      if (state == 0) {
        return;
      } else {
        emit(state - 1);
      }
    });
  }
}
