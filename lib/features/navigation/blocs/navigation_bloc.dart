import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'navigation_event.dart';
part 'navigation_state.dart';

class NavigationBloc extends Bloc<NavigationEvent, NavigationState> {
  NavigationBloc() : super(const NavigationInitial(tabIndex: 0)) {
    on<NavigationEvent>((event, emit) {
      if (event is NavigationChangeEvent){
        try {
          print(event.tabIndex);
          emit(NavigationInitial(tabIndex: event.tabIndex));
        }catch (e){
          Exception('Error Failed to navigate $e');
        }
      }
    });
  }
}
