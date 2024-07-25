import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mighty_fin/bloc/counter_bloc.dart';
import 'package:mighty_fin/counter_observer.dart';
import 'package:mighty_fin/features/authentication/blocs/auth_bloc.dart';
import 'package:mighty_fin/utils/utils.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'features/loan/repository/loan_repo.dart';
import 'features/features.dart';

void main() async {
  Bloc.observer = const CounterObserver();
  WidgetsFlutterBinding.ensureInitialized();
  // fetch stored theme
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? savedTheme = prefs.getString('theme');
  ThemeData initialThemeToLoad =
      savedTheme == 'dark' ? ThemeData.dark() : ThemeData.light();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthBloc(
            authRepository: AuthRepository(),
          )..add(
              CheckTokenEvent(),
            ),
        ),
        BlocProvider(
          create: (context) => ThemeBloc(initialThemeToLoad, prefs)
            ..add(
              InitialThemeEvent(),
            ),
        ),
        BlocProvider(
          create: (context) => NavigationBloc(),
        ),
        BlocProvider(
          create: (context) => CounterBloc(),
        ),
        ChangeNotifierProvider(
          create: (context) => LoanProvider(),
          child: const RootApp(),
        ),
      ],
      child: const RootApp(),
    ),
  );
}

class RootApp extends StatelessWidget {
  const RootApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeData>(
      builder: (context, theme) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Mighty Fin',
          theme: theme,
          // theme: ThemeData(
          //   colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          //   useMaterial3: true,
          // ),
          initialRoute: "/",
          routes: {
            "/": (context) => const InitialScreen(),
            "/login": (context) => const LoginScreen(),
            "/register": (context) => const RegisterScreen(),
            "/support":(context)=> const SupportScreen(),
            "/profile":(context)=> const ProfileScreen(),
            // "/settings":(context)=> const SettingsScreen(),
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
        if (state is AuthSuccess) {
          return const NavigationScreen();
        } else if (state is AuthInitial) {
          return const LoginScreen();
        } else {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }
      },
    );
  }
}