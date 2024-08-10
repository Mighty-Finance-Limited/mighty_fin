import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'navigation_event.dart';

part 'navigation_state.dart';

class NavigationBloc extends Bloc<NavigationEvent, NavigationState> {
  NavigationBloc() : super(const NavigationInitial(tabIndex: 0)) {
    on<NavigationEvent>((event, emit) {
      if (event is NavigationChangeEvent) {
        try {
          emit(NavigationInitial(
              tabIndex: event.tabIndex,
              usePersistentNavBar: state.usePersistentNavBar));
        } catch (e) {
          Exception('Error Failed to navigate $e');
        }
      } else if (event is ToggleNavigationStyleEvent) {
        emit(NavigationInitial(
            tabIndex: state.tabIndex,
            usePersistentNavBar: event.usePersistentNavBar));
      }
    });
  }
}
