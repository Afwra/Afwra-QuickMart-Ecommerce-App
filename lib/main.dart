import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:quick_mart/core/functions/hive_functions.dart';
import 'package:quick_mart/core/utils/app_constants.dart';
import 'package:quick_mart/core/utils/app_settings.dart';
import 'package:quick_mart/core/utils/bloc_observer.dart';
import 'package:quick_mart/core/utils/app_routes.dart';
import 'package:quick_mart/core/utils/app_themes.dart';
import 'package:quick_mart/core/utils/service_locator.dart';
import 'package:quick_mart/features/home/presentation/view_model/theme_cubit/theme_cubit.dart';
import 'package:quick_mart/features/home/presentation/view_model/theme_cubit/theme_state.dart';
import 'package:quick_mart/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox(AppConstants.settingsBox);
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await EasyLocalization.ensureInitialized();
  setupServiceLocator();
  Bloc.observer = MyBlocObserver();
  SystemChrome.setSystemUIOverlayStyle(
    getDarkMode()
        ? AppThemes.darkModeStatusBarTheme
        : AppThemes.lightModeStatusBarTheme,
  );
  AppSettings.darkMode = getDarkMode();
  AppSettings.langCode = getLanguageCode();
  AppSettings.userToken = getLoginToken();
  runApp(
    EasyLocalization(
      supportedLocales: const [Locale('en'), Locale('ar')],
      fallbackLocale: const Locale('en'),
      path: 'assets/lang', // Path to the localization files
      child: BlocProvider(
        create: (context) => ThemeCubit(),
        child: const QuickMartApp(),
      ),
    ),
  );
}

class QuickMartApp extends StatelessWidget {
  const QuickMartApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeState>(
      builder: (context, state) {
        return ScreenUtilInit(
          designSize: const Size(360, 800),
          minTextAdapt: true, // Automatically adapts font sizes
          splitScreenMode: true,
          builder: (context, child) => MaterialApp.router(
            routerConfig: AppRoutes.router,
            theme: AppSettings.darkMode
                ? AppThemes.darkTheme
                : AppThemes.lightTheme,
            debugShowCheckedModeBanner: false,
            localizationsDelegates: context.localizationDelegates,
            supportedLocales: context.supportedLocales,
            locale: context.locale,
          ),
        );
      },
    );
  }
}
