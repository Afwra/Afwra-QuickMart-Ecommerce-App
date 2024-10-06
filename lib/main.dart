import 'package:flutter/material.dart';
import 'package:quick_mart/core/utils/app_routes.dart';
import 'package:quick_mart/core/utils/app_themes.dart';

void main() {
  runApp(const QuickMartApp());
}

class QuickMartApp extends StatelessWidget {
  const QuickMartApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: AppRoutes.router,
      theme: AppThemes.lightTheme,
      debugShowCheckedModeBanner: false,
    );
  }
}
