import 'package:flutter_bloc/flutter_bloc.dart';

class CounterObserver extends BlocObserver {
  /// calling the [CounterObserver] constructor
  const CounterObserver();

  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    print("${bloc.runtimeType} $change");
  }
}
