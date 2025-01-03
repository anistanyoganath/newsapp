import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

final settingsBox = Hive.box('appdata');

class ThemeStore {
  static ThemeMode getThemeMode() {
    String? savedTheme = settingsBox.get('themeMode', defaultValue: 'light');
    return savedTheme == 'dark' ? ThemeMode.dark : ThemeMode.light;
  }

  static bool isDarkTheme() {
    String? savedTheme = settingsBox.get('themeMode', defaultValue: 'light');
    return savedTheme == 'dark';
  }

  static void toggleTheme() {
    ThemeMode newThemeMode =
        getThemeMode() == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
    settingsBox.put(
        'themeMode', newThemeMode == ThemeMode.dark ? 'dark' : 'light');
  }
}
