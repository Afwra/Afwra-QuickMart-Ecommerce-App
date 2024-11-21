import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:quick_mart/core/utils/app_assets.dart';
import 'package:quick_mart/core/utils/app_colors.dart';
import 'package:quick_mart/core/utils/app_settings.dart';
import 'package:quick_mart/core/utils/app_text_styles.dart';
import 'package:svg_flutter/svg.dart';

class CustomChangePasswordBodyAppBar extends StatelessWidget {
  const CustomChangePasswordBodyAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // ForgotPasswordCubit cubit = BlocProvider.of<ForgotPasswordCubit>(context);
    return Row(
      children: [
        GestureDetector(
          child: SvgPicture.asset(
            context.locale.languageCode == 'ar'
                ? AppAssets.arrowRight
                : AppAssets.arrowLeft,
            width: 32.w,
            height: 32.h,
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
              AppSettings.darkMode ? Colors.white : AppColors.kBrandColorBlack,
              BlendMode.srcIn,
            ),
          ),
          onTap: () => GoRouter.of(context).pop(),
        ),
        const SizedBox(
          width: 12,
        ),
        Text(
          'Change Password',
          style: AppTextStyles.body2Medium.copyWith(
            color: AppSettings.darkMode
                ? Colors.white
                : AppColors.kBrandColorBlack,
          ),
        ),
        const Spacer(),
        Text(
          '01/',
          style: AppTextStyles.body2Medium.copyWith(
            color: AppSettings.darkMode
                ? Colors.white
                : AppColors.kBrandColorBlack,
          ),
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
