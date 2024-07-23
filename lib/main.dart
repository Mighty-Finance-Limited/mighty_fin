import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mighty_fin/bloc/counter_bloc.dart';
import 'package:mighty_fin/counter_observer.dart';
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
          create: (context) =>
          ThemeBloc(initialThemeToLoad, prefs)
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
          theme:theme ,
          // theme: ThemeData(
          //   colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          //   useMaterial3: true,
          // ),
          initialRoute:"/",
          routes: {
            "/":(context)=> const NavigationScreen(),
            "/login":(context)=> const LoginScreen(),
            // "/tickets":(context)=> const TicketsScreen(),
            // "/more":(context)=> const MoreScreen(),
            // "/settings":(context)=> const SettingsScreen(),
          },
        );
      },
    );
  }
}