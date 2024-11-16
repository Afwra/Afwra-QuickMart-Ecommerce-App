import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quick_mart/core/functions/hive_functions.dart';
import 'package:quick_mart/core/utils/app_settings.dart';
import 'package:quick_mart/core/utils/app_themes.dart';
import 'package:quick_mart/features/home/presentation/view_model/theme_cubit/theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(ThemeInitial());
  void initTheme() {
    SystemChrome.setSystemUIOverlayStyle(
      getDarkMode()
          ? AppThemes.darkModeStatusBarTheme
          : AppThemes.lightModeStatusBarTheme,
    );
  }

  void changeTheme() {
    AppSettings.darkMode = !AppSettings.darkMode;
    saveDarkMode(AppSettings.darkMode);
    emit(ChangeTheme());
  }
}
