import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../app_theme.dart';

class ThemeRepository {
  final SharedPreferences _prefs;

  ThemeRepository(this._prefs);

  static const String _themeKey = 'theme';

  Future<void> saveTheme(String theme) async {
    await _prefs.setString(_themeKey, theme);
  }

  ThemeData loadTheme() {
    String? savedTheme = _prefs.getString(_themeKey);
    return savedTheme == 'dark' ? AppTheme().getDarkTheme() : AppTheme().getLightTheme();
  }

  String getCurrentTheme() {
    return _prefs.getString(_themeKey) ?? 'light';
  }
}
