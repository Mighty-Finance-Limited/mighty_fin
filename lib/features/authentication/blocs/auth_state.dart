part of 'auth_bloc.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}

final class AuthLoading extends AuthState {}

final class AuthSuccess extends AuthState {
  final UserModel user;

  AuthSuccess({required this.user});
}

// class AuthRegistered extends AuthState {
//   final UserModel user;
//
//   AuthRegistered({required this.user});
// }


final class AuthFailure extends AuthState {
  final String error;

  AuthFailure({required this.error});
}
