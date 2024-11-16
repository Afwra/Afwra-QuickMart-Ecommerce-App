import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quick_mart/core/utils/app_assets.dart';
import 'package:quick_mart/core/utils/app_colors.dart';
import 'package:quick_mart/core/utils/app_settings.dart';
import 'package:quick_mart/core/utils/app_text_styles.dart';
import 'package:quick_mart/core/widgets/custom_button.dart';
import 'package:quick_mart/features/home/presentation/view_model/home_cubit/home_cubit.dart';

class WishListEmptyView extends StatelessWidget {
  const WishListEmptyView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          AppAssets.emptyWishlist,
          height: 240.h,
          width: 240.w,
          fit: BoxFit.cover,
        ),
        const SizedBox(
          height: 16,
        ),
        Text(
          'Your wishlist is empty',
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
          'Tap heart button to start saving your favorite items.',
          style: AppTextStyles.body2Regular.copyWith(
            color: AppColors.kGrey150,
          ),
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
