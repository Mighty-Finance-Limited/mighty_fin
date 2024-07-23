part of 'auth_bloc.dart';

@immutable
sealed class AuthEvent {}

class LoginEvent extends AuthEvent {
  final String email;
  final String password;

  LoginEvent({required this.email, required this.password});
}

class RegisterEvent extends AuthEvent {
  final String email;
  final String password;
  final String fname;
  final String lname;
  final String phone;

  RegisterEvent({
    required this.email,
    required this.password,
    required this.fname,
    required this.lname,
    required this.phone,
  });
}

class CheckTokenEvent extends AuthEvent {}

class LogoutEvent extends AuthEvent {}

class RequestOtpEvent extends AuthEvent {
  final int userId;

  RequestOtpEvent({required this.userId});
}

class VerifyOtpEvent extends AuthEvent {
  final int otp;

  VerifyOtpEvent({required this.otp});
}
