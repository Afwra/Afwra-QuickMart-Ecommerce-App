import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:quick_mart/core/utils/app_assets.dart';
import 'package:quick_mart/core/utils/app_colors.dart';
import 'package:quick_mart/core/utils/app_routes.dart';
import 'package:quick_mart/core/utils/app_settings.dart';
import 'package:quick_mart/core/utils/app_text_styles.dart';
import 'package:quick_mart/core/widgets/custom_button.dart';

class CustomEmptyOrderWidget extends StatelessWidget {
  const CustomEmptyOrderWidget({
    super.key,
    required this.title,
    required this.bodyTxt,
  });
  final String title, bodyTxt;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          AppAssets.ordersEmpty,
          height: 240.h,
          width: 240.w,
          fit: BoxFit.cover,
        ),
        const SizedBox(
          height: 16,
        ),
        Text(
          title,
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
          bodyTxt,
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
                  GoRouter.of(context).go(AppRoutes.kHomeLayout, extra: 1);
                },
              ),
            ),
          ],
        )
      ],
    );
  }
}
