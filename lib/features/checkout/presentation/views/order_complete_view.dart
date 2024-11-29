import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:quick_mart/core/functions/hive_functions.dart';
import 'package:quick_mart/core/utils/app_assets.dart';
import 'package:quick_mart/core/utils/app_colors.dart';
import 'package:quick_mart/core/utils/app_routes.dart';
import 'package:quick_mart/core/utils/app_settings.dart';
import 'package:quick_mart/core/utils/app_text_styles.dart';
import 'package:quick_mart/core/widgets/custom_button.dart';

class OrderCompleteView extends StatelessWidget {
  const OrderCompleteView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: OrderCompletedViewBody(),
        ),
      ),
    );
  }
}

class OrderCompletedViewBody extends StatelessWidget {
  const OrderCompletedViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 41.w, vertical: 54.h),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(32),
                color: AppSettings.darkMode
                    ? AppColors.kCyan50DarkMode
                    : AppColors.kCyan50),
            child: Image.asset(
              width: 240.w,
              height: 240.h,
              AppAssets.orderComplete,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(
            height: 24,
          ),
          Text(
            'Your order has been placed successfully',
            textAlign: TextAlign.center,
            style: AppTextStyles.heading2Bold.copyWith(
              color: AppSettings.darkMode
                  ? AppColors.kBrandColorWhite
                  : AppColors.kBrandColorBlack,
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          Text(
            'Thank you for choosing us! Feel free to continue shopping and explore our wide range of products. Happy Shopping!',
            style:
                AppTextStyles.body2Regular.copyWith(color: AppColors.kGrey150),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 24,
          ),
          Row(
            children: [
              Expanded(
                child: CustomButton(
                  text: 'Continue Shopping',
                  color: getDarkMode()
                      ? AppColors.kBrandColorCyan
                      : AppColors.kBrandColorBlack,
                  onPressed: () {
                    GoRouter.of(context).push(AppRoutes.kHomeLayout, extra: 0);
                  },
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
