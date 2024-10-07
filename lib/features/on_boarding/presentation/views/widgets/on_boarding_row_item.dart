import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:quick_mart/core/utils/app_assets.dart';
import 'package:quick_mart/core/utils/app_colors.dart';
import 'package:quick_mart/core/utils/app_routes.dart';
import 'package:quick_mart/core/utils/app_text_styles.dart';
import 'package:quick_mart/features/on_boarding/presentation/view_models/on_boarding_cubit/on_boarding_cubit.dart';
import 'package:quick_mart/features/on_boarding/presentation/view_models/on_boarding_cubit/on_boarding_state.dart';
import 'package:svg_flutter/svg.dart';

class OnBoardingRowItem extends StatelessWidget {
  const OnBoardingRowItem({super.key});

  @override
  Widget build(BuildContext context) {
    OnBoardingCubit cubit = BlocProvider.of<OnBoardingCubit>(context);
    return BlocBuilder<OnBoardingCubit, OnBoardingState>(
      builder: (context, state) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            cubit.index == 0
                ? SvgPicture.asset(AppAssets.quickMartLogo)
                : GestureDetector(
                    child: SvgPicture.asset(AppAssets.arrowLeft),
                    onTap: () {
                      cubit.previousPage(context);
                    },
                  ),
            cubit.index < cubit.onBoardingItems.length - 1
                ? TextButton(
                    onPressed: () {
                      GoRouter.of(context).go(AppRoutes.kLoginView);
                    },
                    child: Text(
                      'Skip For Now',
                      style: AppTextStyles.body2Medium
                          .copyWith(color: AppColors.kBrandColorCyan),
                    ),
                  )
                : const SizedBox()
          ],
        );
      },
    );
  }
}