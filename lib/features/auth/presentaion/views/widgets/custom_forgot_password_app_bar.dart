import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:quick_mart/core/utils/app_assets.dart';
import 'package:quick_mart/core/utils/app_colors.dart';
import 'package:quick_mart/core/utils/app_text_styles.dart';
import 'package:quick_mart/core/utils/app_texts.dart';
import 'package:quick_mart/features/auth/presentaion/view_models/forgot_password_cubit/forgot_password_cubit.dart';
import 'package:quick_mart/features/auth/presentaion/view_models/forgot_password_cubit/forgot_password_state.dart';
import 'package:svg_flutter/svg.dart';

class CustomForgotPasswordAppBar extends StatelessWidget {
  const CustomForgotPasswordAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    ForgotPasswordCubit cubit = BlocProvider.of<ForgotPasswordCubit>(context);
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
              cubit.darkMode ? Colors.white : AppColors.kBrandColorBlack,
              BlendMode.srcIn,
            ),
          ),
          onTap: () => GoRouter.of(context).pop(),
        ),
        const SizedBox(
          width: 12,
        ),
        Text(
          AppTexts.forgotPassword.tr(),
          style: AppTextStyles.body2Medium.copyWith(
            color: cubit.darkMode ? Colors.white : AppColors.kBrandColorBlack,
          ),
        ),
        const Spacer(),
        BlocBuilder<ForgotPasswordCubit, ForgotPasswordState>(
          builder: (context, state) {
            return Text(
              '0${cubit.pageIndex + 1}/',
              style: AppTextStyles.body2Medium.copyWith(
                color:
                    cubit.darkMode ? Colors.white : AppColors.kBrandColorBlack,
              ),
            );
          },
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
