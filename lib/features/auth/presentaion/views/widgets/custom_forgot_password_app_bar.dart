import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:quick_mart/core/utils/app_assets.dart';
import 'package:quick_mart/core/utils/app_colors.dart';
import 'package:quick_mart/core/utils/app_text_styles.dart';
import 'package:svg_flutter/svg.dart';

class CustomForgotPasswordAppBar extends StatelessWidget {
  const CustomForgotPasswordAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          child: SvgPicture.asset(
            AppAssets.arrowLeft,
            width: 32.w,
            height: 32.h,
            fit: BoxFit.cover,
          ),
          onTap: () => GoRouter.of(context).pop(),
        ),
        const SizedBox(
          width: 12,
        ),
        Text(
          'Forgot Password',
          style: AppTextStyles.body2Medium,
        ),
        const Spacer(),
        Text(
          '01/',
          style: AppTextStyles.body2Medium,
        ),
        Text(
          '03',
          style: AppTextStyles.body2Medium.copyWith(
            color: AppColors.kGrey100,
          ),
        ),
      ],
    );
  }
}
