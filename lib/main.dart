import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:mighty_fin/counter_observer.dart';
import 'package:mighty_fin/utils/utils.dart';
import 'package:mighty_fin/utils/theme/repository/theme_repository.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

import 'features/features.dart';
import 'features/loan/loanWizard/blocs/loan_amount_selector.dart';
import 'features/loan/loanWizard/blocs/loan_application_cubit.dart';
import 'features/loan/loanWizard/blocs/upload_bloc.dart';
import 'features/loan/loanWizard/repository/upload_repo.dart';

void main() async {
  // Loan Environment Variables
  await dotenv.load(fileName: '.env');
  Bloc.observer = const CounterObserver();

  WidgetsFlutterBinding.ensureInitialized();

  FlutterNativeSplash.preserve(
      widgetsBinding: WidgetsFlutterBinding.ensureInitialized());

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  // Load Theme Prefs
  SharedPreferences prefs = await SharedPreferences.getInstance();
  ThemeRepository themeRepository = ThemeRepository(prefs);

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthBloc(
            authRepository: AuthRepository(),
          )..add(CheckTokenEvent()),
        ),
        BlocProvider(
          create: (context) =>
              ThemeBloc(themeRepository)..add(InitialThemeEvent()),
        ),
        BlocProvider(
          create: (context) => NavigationBloc(),
        ),
        BlocProvider(
          create: (context) => LoanApplicationCubit(),
        ),
        BlocProvider(
          create: (context) => LoanAmountCubit(),
        ),
        BlocProvider(
          create: (context) => LoanMonthsBloc(),
        ),
        BlocProvider(
          create: (context) => UploadBloc(UploadRepo()),
        ),
        ChangeNotifierProvider(
          create: (context) => LoanProvider(),
        ),
      ],
      child: const RootApp(),
    ),
  );
}

class RootApp extends StatelessWidget {
  const RootApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeData>(
      builder: (context, theme) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Mighty Fin',
          theme: theme,
          initialRoute: "/",
          routes: {
            "/": (context) => const InitialScreen(),
            "/login": (context) => const LoginScreen(),
            "/register": (context) => const RegisterScreen(),
            "/support": (context) => const SupportScreen(),
            "/profile": (context) => const ProfileScreen(),
            "/notifications": (context) => const NotificationsScreen(),
            "/termsAndConditions": (context) =>
                const TermsAndConditionsScreen(),
          },
        );
      },
    );
  }
}

class InitialScreen extends StatelessWidget {
  const InitialScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        if (state is AuthLoading) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        } else if (state is AuthInitial) {
          FlutterNativeSplash.remove();
          return const LoginScreen();
        } else if (state is AuthSuccess) {
          FlutterNativeSplash.remove();
          return const NavigationScreen();
        } else {
          FlutterNativeSplash.remove();
          return const LoginScreen();
        }
      },
    );
  }
}
// class AuthFlow extends StatelessWidget {
//   const AuthFlow({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<AuthBloc, AuthState>(
//       builder: (context, state) {
//         if (state is AuthSuccess) {
//           return const NavigationScreen();
//         } else {
//           return const LoginScreen();
//         }
//       },
//     );
//   }
// }
