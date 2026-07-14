import 'package:flutter/material.dart';
import 'package:frontend/core/utils/colors.dart';

class AppTheme {
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

    textTheme: TextTheme(
      headlineLarge: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
        color: AppColors.primTextPrimary,
      ),

      titleLarge: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        color: AppColors.primTextPrimary,
      ),

      bodyLarge: TextStyle(fontSize: 16, color: AppColors.primTextPrimary),

      bodyMedium: TextStyle(fontSize: 14, color: AppColors.primTextSecondary),

      labelSmall: TextStyle(fontSize: 12, color: AppColors.primTextSecondary),
    ),
  );
}
