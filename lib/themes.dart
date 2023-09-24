import 'package:flutter/material.dart';

class ThemeClass with ChangeNotifier {
  static bool isDark = true;

  Color lightPrimaryColor = Color.fromARGB(255, 255, 255, 255);
  Color lightSecondaryColor = Color.fromARGB(255, 238, 238, 238);
  Color lightAccentColor = Color(0xFF5F5FA8);
  Color lightRightColor = Color(0xFF52d145);

  Color darkPrimaryColor = Color.fromARGB(255, 19, 12, 27);
  Color darkSecondaryColor = Color.fromARGB(255, 38, 29, 50);
  Color darkAccentColor = Color(0xFF371B58);
  Color darkRightColor = Color(0xFF0e9700);

  Color SecondaryColor = Color(0xFFF15C5C);
  Color darkTextColor = Color.fromARGB(255, 255, 255, 255);
  Color lightTextColor = Color.fromARGB(255, 0, 0, 0);

  static ThemeData lightTheme = ThemeData(
    textSelectionTheme: TextSelectionThemeData(
      selectionHandleColor: _themeClass.lightTextColor,
    ),
    primaryColor: ThemeData.light().scaffoldBackgroundColor,
    colorScheme: const ColorScheme.light().copyWith(
      primary: _themeClass.lightPrimaryColor,
      secondary: _themeClass.lightSecondaryColor,
      tertiary: _themeClass.lightAccentColor,
      onPrimary: _themeClass.lightTextColor,
      onPrimaryContainer: _themeClass.lightTextColor,
    ),
  );

  static ThemeData darkTheme = ThemeData(
    textSelectionTheme: TextSelectionThemeData(
      selectionHandleColor: _themeClass.darkTextColor,
    ),
    primaryColor: ThemeData.dark().scaffoldBackgroundColor,
    colorScheme: const ColorScheme.dark().copyWith(
      primary: _themeClass.darkPrimaryColor,
      secondary: _themeClass.darkSecondaryColor,
      tertiary: _themeClass.darkAccentColor,
      onPrimary: _themeClass.darkTextColor,
      onPrimaryContainer: _themeClass.darkTextColor,
    ),
  );

  ThemeMode currentTheme() {
    return isDark ? ThemeMode.dark : ThemeMode.light;
  }

  void switchTheme() {
    isDark = !isDark;
    print(isDark);
    notifyListeners();
  }
}

ThemeClass _themeClass = ThemeClass();
