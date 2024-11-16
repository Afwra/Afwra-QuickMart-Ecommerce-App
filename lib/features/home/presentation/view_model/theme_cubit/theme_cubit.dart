import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quick_mart/core/functions/hive_functions.dart';
import 'package:quick_mart/core/utils/app_settings.dart';
import 'package:quick_mart/core/utils/app_themes.dart';
import 'package:quick_mart/features/home/presentation/view_model/theme_cubit/theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(ThemeInitial());
  void changeTheme() {
    AppSettings.darkMode = !AppSettings.darkMode;
    saveDarkMode(AppSettings.darkMode);
    changeStatusBarColor();
    emit(ChangeTheme());
  }

  void changeStatusBarColor() {
    SystemChrome.setSystemUIOverlayStyle(
      AppSettings.darkMode
          ? AppThemes.darkModeStatusBarTheme
          : AppThemes.lightModeStatusBarTheme,
    );
  }

  void changeAppLocale(BuildContext context) {
    context.locale.languageCode == 'en'
        ? context.setLocale(const Locale('ar'))
        : context.setLocale(const Locale('en'));
    saveLanguageCode(context.locale.languageCode);
    AppSettings.langCode = context.locale.languageCode;
    emit(ChangeAppLocale());
  }
}
