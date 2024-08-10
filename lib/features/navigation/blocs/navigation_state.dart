part of 'navigation_bloc.dart';

@immutable
sealed class NavigationState {
  final int tabIndex;
  final bool usePersistentNavBar;

  const NavigationState({required this.tabIndex, required this.usePersistentNavBar});
}

final class NavigationInitial extends NavigationState {
  const NavigationInitial({required super.tabIndex, super.usePersistentNavBar = false});
}