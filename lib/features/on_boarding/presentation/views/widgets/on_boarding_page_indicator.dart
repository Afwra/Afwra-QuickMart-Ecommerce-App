import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quick_mart/core/utils/app_colors.dart';
import 'package:quick_mart/features/on_boarding/presentation/view_models/on_boarding_cubit/on_boarding_cubit.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingPageIndicator extends StatelessWidget {
  const OnBoardingPageIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return SmoothPageIndicator(
      controller: BlocProvider.of<OnBoardingCubit>(context).pageController,
      count: 3,
      effect: const SlideEffect(
        activeDotColor: AppColors.kBrandColorCyan,
        dotColor: AppColors.kGrey100,
        dotWidth: 8,
        dotHeight: 8,
      ),
    );
  }
}
