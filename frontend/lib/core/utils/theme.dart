import 'package:flutter/material.dart';

class CustomThemeData {
  // Light theme
  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,

    colorScheme: ColorScheme.light(
      primary: Colors.blue,
      onPrimary: Colors.black,
      secondary: Colors.white,
      surface: Colors.grey,
      onSurface: Colors.black,
    ),

    scaffoldBackgroundColor: Colors.white,
  );
}
