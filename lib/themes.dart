// library config.globals;
import 'package:flutter/material.dart';
import 'package:nss_connect/sharedperfs.dart';

class ThemeClass with ChangeNotifier {
  static bool isDark = true;

  Color lightPrimaryColor = Color.fromARGB(255, 255, 255, 255);
  Color lightSecondaryColor = Color.fromARGB(255, 238, 238, 238);
  Color lightAccentColor = Color(0xFF5F5FA8);

  Color darkPrimaryColor = Color.fromARGB(255, 26, 17, 37);
  Color darkSecondaryColor = Color.fromARGB(255, 38, 29, 50);
  Color darkAccentColor = Color.fromARGB(255, 90, 4, 188);

  Color SecondaryColor = Color(0xFFF15C5C);
  Color darkTextColor = Color.fromARGB(255, 255, 255, 255);
  Color lightTextColor = Color.fromARGB(255, 0, 0, 0);

  static ThemeData lightTheme = ThemeData(
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

  void switchTheme(){
    isDark =!isDark;
    print(isDark);
    notifyListeners();
  }
}

ThemeClass _themeClass = ThemeClass();
