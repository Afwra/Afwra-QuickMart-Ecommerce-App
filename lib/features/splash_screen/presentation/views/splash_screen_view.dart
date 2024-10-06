import 'package:flutter/material.dart';
import 'package:quick_mart/features/splash_screen/presentation/views/widgets/splash_screen_body.dart';

class SplashScreenView extends StatelessWidget {
  const SplashScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SplashScreenBody(),
    );
  }
}
