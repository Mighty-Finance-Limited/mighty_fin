part of 'navigation_bloc.dart';

@immutable
sealed class NavigationEvent {}

class NavigationChangeEvent extends NavigationEvent{
  final int tabIndex;
  NavigationChangeEvent({required this.tabIndex});
}
class ToggleNavigationStyleEvent extends NavigationEvent {
  final bool usePersistentNavBar;
  ToggleNavigationStyleEvent({required this.usePersistentNavBar});
}