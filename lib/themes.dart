import 'package:flutter/material.dart';

class ThemeClass {
  Color lightPrimaryColor = Color(0xFF5F5FA8);
  // Color darkPrimaryColor = Color.fromARGB(255, 45, 131, 218);

  Color darkPrimaryColor = Color(0xFF5F5FA8);
  Color SecondaryColor = Color(0xFFF15C5C);
  Color accentColor = Color.fromARGB(255, 9, 6, 10);

  static ThemeData lightTheme = ThemeData(
    primaryColor: ThemeData.light().scaffoldBackgroundColor,
    colorScheme: const ColorScheme.light().copyWith(
        primary: _themeClass.lightPrimaryColor,
        secondary: _themeClass.SecondaryColor),
  );

  static ThemeData darkTheme = ThemeData(
    primaryColor: ThemeData.dark().scaffoldBackgroundColor,
    colorScheme: const ColorScheme.dark().copyWith(
      primary: _themeClass.darkPrimaryColor,
    ),
  );
}

ThemeClass _themeClass = ThemeClass();
