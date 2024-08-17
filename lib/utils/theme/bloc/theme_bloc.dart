import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:mighty_fin/utils/theme/bloc/theme_event.dart';

import '../app_theme.dart';
import '../repository/theme_repository.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeData> {
  final ThemeRepository _themeRepository;

  ThemeBloc(this._themeRepository) : super(_themeRepository.loadTheme()) {
    on<InitialThemeEvent>((event, emit) async {
      emit(_themeRepository.loadTheme());
    });

    on<ToggleThemeEvent>((event, emit) async {
      String currentTheme = _themeRepository.getCurrentTheme();
      ThemeData changedTheme = currentTheme == 'dark'
          ? AppTheme().getLightTheme()
          : AppTheme().getDarkTheme();
      _themeRepository.saveTheme(currentTheme == 'dark' ? 'light' : 'dark');
      emit(changedTheme);
    });
  }
}
