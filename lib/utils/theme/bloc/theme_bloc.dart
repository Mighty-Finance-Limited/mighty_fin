// // if bool = true -----> the Theme is dark
// // if bool = false -----> the Theme is light
// import 'package:flutter_bloc/flutter_bloc.dart';
// import './theme_event.dart';
// import 'package:shared_preferences/shared_preferences.dart';
//
// class ThemeBloc extends Bloc<ThemeEvent, bool> {
//   ThemeBloc() : super(false) {
//
//     // execute this event when the app starts
//     on<SetInitialTheme>(
//           (event, emit) async {
//         bool hasThemeDark = await isDark();
//
//         emit(hasThemeDark);
//       },
//     );
//
//     // toggle the app theme
//     on<ChangeTheme>(
//           (event, emit) async {
//         bool hasThemeDark = await isDark();
//
//         emit(!hasThemeDark);
//         setTheme(!hasThemeDark);
//       },
//     );
//   }
// }
//
// Future<bool> isDark() async {
//   final SharedPreferences sharedPreferences =
//   await SharedPreferences.getInstance();
//
//   return sharedPreferences.getBool('isDark') ?? false;
// }
//
// Future<void> setTheme(bool isDark) async {
//   final SharedPreferences sharedPreferences =
//   await SharedPreferences.getInstance();
//
//   sharedPreferences.setBool('isDark', isDark);
// }

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:mighty_fin/utils/theme/bloc/theme_event.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../app_theme.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeData> {
  final SharedPreferences prefs;

  ThemeBloc(super.initialTheme, this.prefs) {
    on<InitialThemeEvent>(
      (event, emit) async {
        String? savedTheme = prefs.getString('theme');
        ThemeData initialThemeToLoad =
            savedTheme == 'dark' ? AppTheme().getDarkTheme() : AppTheme().getLightTheme();
        emit(initialThemeToLoad);
      },
    );

    on<ToggleThemeEvent>(
      (event, emit) async {
        //On every toggle theme event, we also have to save the current theme to shared_preferences.So,
        ThemeData changedTheme =
            state == AppTheme().getDarkTheme() ? AppTheme().getLightTheme() : AppTheme().getDarkTheme();
            // state == ThemeData.dark() ? ThemeData.light() : ThemeData.dark();

        prefs.setString(
            'theme', changedTheme == AppTheme().getDarkTheme() ? 'dark' : 'light');

        emit(changedTheme);
      },
    );
  }
}
