import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:quick_mart/core/functions/hive_functions.dart';
import 'package:quick_mart/core/utils/app_assets.dart';
import 'package:quick_mart/core/utils/app_routes.dart';
import 'package:svg_flutter/svg_flutter.dart';

class SplashScreenBody extends StatefulWidget {
  const SplashScreenBody({super.key});

  @override
  State<SplashScreenBody> createState() => _SplashScreenBodyState();
}

class _SplashScreenBodyState extends State<SplashScreenBody> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      if (getOnBoardingCompleted() == true) {
        if (getLoginToken() == null) {
          GoRouter.of(context).go(AppRoutes.kLoginView);
        } else {
          GoRouter.of(context).go(AppRoutes.kHomeView);
        }
      } else {
        GoRouter.of(context).go(AppRoutes.kOnBoardingView);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: TweenAnimationBuilder(
        tween:
            Tween<Offset>(begin: const Offset(0, -1), end: const Offset(0, 0)),
        duration: const Duration(seconds: 2),
        curve: Curves.bounceOut,
        builder: (context, value, child) => Transform.translate(
          offset: value * MediaQuery.of(context).size.height,
          child: SvgPicture.asset(
            getDarkMode()
                ? AppAssets.splashScreenLogoDarkMode
                : AppAssets.splashScreenLogo,
            height: 76.h,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
