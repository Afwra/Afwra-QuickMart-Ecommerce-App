import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:quick_mart/core/utils/app_assets.dart';
import 'package:quick_mart/core/utils/app_colors.dart';
import 'package:quick_mart/core/utils/app_routes.dart';
import 'package:quick_mart/core/utils/app_text_styles.dart';
import 'package:quick_mart/core/widgets/custom_button.dart';

class PasswordCreatedSuccessView extends StatelessWidget {
  const PasswordCreatedSuccessView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: PasswordCreatedSuccessViewBody(),
        ),
      ),
    );
  }
}

class PasswordCreatedSuccessViewBody extends StatelessWidget {
  const PasswordCreatedSuccessViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 41.w, vertical: 54.h),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(32),
              color: AppColors.kCyan50),
          child: Image.asset(
            width: 245.w,
            height: 301.h,
            AppAssets.newPassword,
            fit: BoxFit.fill,
          ),
        ),
        const SizedBox(
          height: 24,
        ),
        Text(
          'New password set successfully',
          textAlign: TextAlign.center,
          style: AppTextStyles.heading2Bold,
        ),
        const SizedBox(
          height: 16,
        ),
        Text(
          'Congratulations! Your password has been set successfully. Please proceed to the login screen to verify your account.',
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
                text: 'Login',
                onPressed: () {
                  GoRouter.of(context).push(AppRoutes.kLoginView);
                },
              ),
            ),
          ],
        )
      ],
    );
  }
}
