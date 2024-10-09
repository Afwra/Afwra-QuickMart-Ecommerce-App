import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:quick_mart/core/utils/app_colors.dart';

class AppThemes {
  static ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.kBrandColorWhite,
  );

  static ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.kBrandColorBlack,
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
