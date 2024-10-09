import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:quick_mart/core/utils/app_colors.dart';

class AppThemes {
  static ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.kBrandColorWhite,
  );

  static ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.kBrandColorBlack,
    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: Colors.white), // For larger body text
      bodyMedium: TextStyle(color: Colors.white), // For medium body text
      bodySmall: TextStyle(color: Colors.white), // For smaller body text
      headlineLarge: TextStyle(color: Colors.white), // For large headlines
      headlineMedium: TextStyle(color: Colors.white), // For medium headlines
      headlineSmall: TextStyle(color: Colors.white), // For small headlines
      titleLarge: TextStyle(color: Colors.white), // For large titles
      titleMedium: TextStyle(color: Colors.white), // For medium titles
      titleSmall: TextStyle(color: Colors.white), // For small titles
    ),
  );

  static const SystemUiOverlayStyle lightModeStatusBarTheme =
      SystemUiOverlayStyle(
    statusBarColor: Colors.transparent, // Set your status bar color here
    statusBarIconBrightness:
        Brightness.dark, // Set the icon color (light or dark)
  );
  static SystemUiOverlayStyle darkModeStatusBarTheme =
      const SystemUiOverlayStyle(
    statusBarColor:
        AppColors.kBrandColorBlack, // Set your status bar color here
    statusBarIconBrightness:
        Brightness.light, // Set the icon color (light or dark)
  );
}
