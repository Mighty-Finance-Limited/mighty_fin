import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../utils/constants/secure_storage.dart';
import '../models/user_model.dart';
import '../repository/auth_repository.dart';

part 'auth_event.dart';

part 'auth_state.dart';

// class AuthBloc extends Bloc<AuthEvent, AuthState> {
//   AuthBloc() : super(AuthInitial()) {
//     on<AuthEvent>((event, emit) {
//       // TODO: implement event handler
//     });
//   }
// }

// class AuthBloc extends Bloc<AuthEvent, AuthState> {
//   final AuthRepository authRepository;
//   final SecureStorage secureStorage;
//
//   AuthBloc({required this.authRepository})
//       : secureStorage = SecureStorage(),
//         super(AuthInitial());
//
//   Stream<AuthState> mapEventToState(AuthEvent event) async* {
//     if (event is LoginEvent) {
//       yield AuthLoading();
//       try {
//         final user = await authRepository.login(event.email, event.password);
//         yield AuthSuccess(user: user);
//       } catch (e) {
//         yield AuthFailure(error: e.toString());
//       }
//     } else if (event is RegisterEvent) {
//       yield AuthLoading();
//       try {
//         final user = await authRepository.register(
//           event.email,
//           event.password,
//           event.fname,
//           event.lname,
//           event.phone,
//         );
//         yield AuthSuccess(user: user);
//       } catch (e) {
//         yield AuthFailure(error: e.toString());
//       }
//     } else if (event is RequestOtpEvent) {
//       yield AuthLoading();
//       try {
//         await authRepository.requestOtp(event.userId);
//         yield AuthInitial();
//       } catch (e) {
//         yield AuthFailure(error: e.toString());
//       }
//     } else if (event is VerifyOtpEvent) {
//       yield AuthLoading();
//       try {
//         await authRepository.verifyOtp(event.otp);
//         yield AuthInitial();
//       } catch (e) {
//         yield AuthFailure(error: e.toString());
//       }
//     }
//   }
// }

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository authRepository;

  AuthBloc({required this.authRepository}) : super(AuthInitial()) {

    on<LoginEvent>((event, emit) async {
      emit(AuthLoading());
      try {
        final user = await authRepository.login(event.email, event.password);
        emit(AuthSuccess(user: user));
      } catch (e) {
        emit(AuthFailure(error: e.toString()));
      }
    });

    on<RegisterEvent>((event, emit) async {
      emit(AuthLoading());
      try {
        final user = await authRepository.register(
          event.email,
          event.password,
          event.fname,
          event.lname,
          event.phone,
        );
        emit(AuthSuccess(user: user));
      } catch (e) {
        emit(AuthFailure(error: e.toString()));
      }
    });

    on<CheckTokenEvent>((event, emit) async {
      emit(AuthLoading());
      final token = await authRepository.secureStorage.readToken();
      if (token != null) {
        final user = await authRepository.getUser();
        if (user != null) {
          emit(AuthSuccess(user: user));
        } else {
          emit(AuthInitial());
        }
      } else {
        emit(AuthInitial());
      }
    });

    // on<CheckTokenEvent>((event, emit) async {
    //   final token = await authRepository.secureStorage.readToken();
    //   if (token != null) {
    //     final user = await authRepository.getUser();
    //     if (user != null) {
    //       emit(AuthSuccess(user: user));
    //     } else {
    //       emit(AuthInitial());
    //     }
    //   } else {
    //     emit(AuthInitial());
    //   }
    // });

    on<LogoutEvent>((event, emit) async {
      await authRepository.logout();
      emit(AuthInitial());
    });

    on<RequestOtpEvent>((event, emit) async {
      try {
        await authRepository.requestOtp(event.userId);
      } catch (e) {
        emit(AuthFailure(error: e.toString()));
      }
    });

    on<VerifyOtpEvent>((event, emit) async {
      emit(AuthLoading());
      try {
        await authRepository.verifyOtp(event.otp);
        final user = await authRepository.getUser();
        if (user != null) {
          emit(AuthSuccess(user: user));
        } else {
          throw Exception("User not found");
        }
      } catch (e) {
        emit(AuthFailure(error: e.toString()));
      }
    });

  }
}