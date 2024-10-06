import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:quick_mart/core/utils/app_colors.dart';

class AppThemes {
  static ThemeData lightTheme = ThemeData(
    appBarTheme: AppBarTheme(
      elevation: 0,
      color: Colors.transparent,
      systemOverlayStyle: SystemUiOverlayStyle.light
          .copyWith(statusBarIconBrightness: Brightness.dark),
    ),
    scaffoldBackgroundColor: AppColors.kBrandColorWhite,
  );

  static ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.kBrandColorBlack,
  );
}
