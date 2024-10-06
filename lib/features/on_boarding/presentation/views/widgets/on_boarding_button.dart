import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:quick_mart/core/utils/app_colors.dart';
import 'package:quick_mart/core/utils/app_routes.dart';
import 'package:quick_mart/core/widgets/custom_button.dart';
import 'package:quick_mart/features/on_boarding/presentation/view_models/on_boarding_cubit/on_boarding_cubit.dart';
import 'package:quick_mart/features/on_boarding/presentation/view_models/on_boarding_cubit/on_boarding_state.dart';

class OnBoardingButton extends StatelessWidget {
  const OnBoardingButton({super.key});

  @override
  Widget build(BuildContext context) {
    OnBoardingCubit cubit = BlocProvider.of<OnBoardingCubit>(context);

    return BlocBuilder<OnBoardingCubit, OnBoardingState>(
      builder: (context, state) {
        if (cubit.index < cubit.onBoardingItems.length - 1) {
          return Row(
            children: [
              Expanded(
                child: CustomButton(
                  text: 'Next',
                  onPressed: () {
                    cubit.nextPage(context);
                  },
                ),
              ),
            ],
          );
        } else {
          return Row(
            children: [
              Expanded(
                child: CustomButton(
                  text: 'Login',
                  color: AppColors.kBrandColorWhite,
                  textColor: AppColors.kBrandColorBlack,
                  onPressed: () {
                    GoRouter.of(context).go(AppRoutes.kLoginView);
                  },
                ),
              ),
              const SizedBox(
                width: 8,
              ),
              Expanded(
                child: CustomButton(
                  text: 'Get Started',
                  onPressed: () {
                    GoRouter.of(context).go(AppRoutes.kLoginView);
                  },
                ),
              ),
            ],
          );
        }
      },
    );
  }
}
