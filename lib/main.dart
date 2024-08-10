import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:mighty_fin/counter_observer.dart';
import 'package:mighty_fin/utils/utils.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

import 'features/features.dart';

void main() async {
  ///lOAD ENVIRON VARIABLES
  await dotenv.load(fileName: '.env');
  /// MONITOR ALL BLOC STATES IN THE CONSOLE [DEBUGGING PURPOSES]
  Bloc.observer = const CounterObserver();

  WidgetsFlutterBinding.ensureInitialized();

  ///shows splash screen until auth check is complete before showing
  FlutterNativeSplash.preserve(
    widgetsBinding: WidgetsFlutterBinding.ensureInitialized(),
  );
  ///splash screen loading end

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);

  /// fetch stored theme
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? savedTheme = prefs.getString('theme');
  ThemeData initialThemeToLoad =
      savedTheme == 'dark' ? ThemeData.dark() : ThemeData.light();
  ///end


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
          create: (context) => LoanMonthsBloc(),
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

  // This widget is the root of the application.
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
            "/support": (context) => const SupportScreen(),
            "/profile": (context) => const ProfileScreen(),
            "/notifications": (context) => const NotificationsScreen(),
            "/termsAndConditions": (context) => const TermsAndConditionsScreen(),
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
        if (state is AuthLoading || state is AuthInitial) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
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