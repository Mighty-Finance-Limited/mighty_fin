part of 'navigation_bloc.dart';

@immutable
sealed class NavigationEvent {}

class NavigationChangeEvent extends NavigationEvent{
  final int tabIndex;
  NavigationChangeEvent({required this.tabIndex});
}