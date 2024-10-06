import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:quick_mart/core/utils/app_colors.dart';
import 'package:quick_mart/core/utils/app_routes.dart';
import 'package:quick_mart/core/widgets/custom_button.dart';
import 'package:quick_mart/features/on_boarding/presentation/view_models/on_boarding_cubit/on_boarding_cubit.dart';
import 'package:quick_mart/features/on_boarding/presentation/view_models/on_boarding_cubit/on_boarding_state.dart';
import 'package:quick_mart/features/on_boarding/presentation/views/widgets/on_boarding_page_item.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingBody extends StatelessWidget {
  const OnBoardingBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: BlocProvider(
        create: (context) => OnBoardingCubit(),
        child: BlocBuilder<OnBoardingCubit, OnBoardingState>(
          builder: (context, state) {
            return Column(
              children: [
                Flexible(
                  child: PageView.builder(
                    controller: BlocProvider.of<OnBoardingCubit>(context)
                        .pageController,
                    itemCount: BlocProvider.of<OnBoardingCubit>(context)
                        .onBoardingItems
                        .length,
                    itemBuilder: (context, index) => OnBoardingPageItem(
                      item: BlocProvider.of<OnBoardingCubit>(context)
                          .onBoardingItems[index],
                    ),
                    onPageChanged: (value) {
                      BlocProvider.of<OnBoardingCubit>(context)
                          .changeIndex(value);
                    },
                  ),
                ),
                const SizedBox(
                  height: 24,
                ),
                buildButton(
                    context, BlocProvider.of<OnBoardingCubit>(context).index),
                const SizedBox(
                  height: 24,
                ),
                SmoothPageIndicator(
                  controller:
                      BlocProvider.of<OnBoardingCubit>(context).pageController,
                  count: 3,
                  effect: const SlideEffect(
                    activeDotColor: AppColors.kBrandColorCyan,
                    dotColor: AppColors.kGrey100,
                    dotWidth: 8,
                    dotHeight: 8,
                  ),
                ),
                const SizedBox(
                  height: 24,
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget buildButton(context, index) {
    if (index < 2) {
      return CustomButton(
        width: double.infinity,
        text: 'Next',
        onPressed: () {
          BlocProvider.of<OnBoardingCubit>(context).nextPage(context);
        },
      );
    } else {
      return CustomButton(
        width: double.infinity,
        text: 'Get Started',
        onPressed: () {
          GoRouter.of(context).go(AppRoutes.kLoginView);
        },
      );
    }
  }
}
