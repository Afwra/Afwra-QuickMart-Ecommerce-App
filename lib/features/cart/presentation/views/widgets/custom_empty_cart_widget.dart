import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quick_mart/core/utils/app_assets.dart';
import 'package:quick_mart/core/utils/app_colors.dart';
import 'package:quick_mart/core/utils/app_settings.dart';
import 'package:quick_mart/core/utils/app_text_styles.dart';
import 'package:quick_mart/core/widgets/custom_button.dart';
import 'package:quick_mart/features/home/presentation/view_model/home_cubit/home_cubit.dart';

class CustomEmptyCartWidget extends StatelessWidget {
  const CustomEmptyCartWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          AppAssets.emptyCart,
          height: 240.h,
          width: 240.w,
          fit: BoxFit.cover,
        ),
        const SizedBox(
          height: 16,
        ),
        Text(
          'Your cart is empty',
          style: AppTextStyles.heading2Bold.copyWith(
            color: AppSettings.darkMode
                ? Colors.white
                : AppColors.kBrandColorBlack,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(
          height: 16,
        ),
        Text(
          'Looks like you have not added anything in your cart. Go ahead and explore top categories.',
          style: AppTextStyles.body2Regular.copyWith(color: AppColors.kGrey150),
          textAlign: TextAlign.center,
        ),
        const SizedBox(
          height: 24,
        ),
        Row(
          children: [
            Expanded(
              child: CustomButton(
                text: 'Explore Categories',
                color: AppSettings.darkMode
                    ? AppColors.kBrandColorCyan
                    : AppColors.kBrandColorBlack,
                onPressed: () {
                  BlocProvider.of<HomeCubit>(context)
                      .changeNavigationBarIndex(1);
                },
              ),
            ),
          ],
        )
      ],
    );
  }
}
