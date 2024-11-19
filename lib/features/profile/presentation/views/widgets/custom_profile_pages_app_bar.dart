import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:quick_mart/core/utils/app_assets.dart';
import 'package:quick_mart/core/utils/app_colors.dart';
import 'package:quick_mart/core/utils/app_settings.dart';
import 'package:quick_mart/core/utils/app_text_styles.dart';
import 'package:svg_flutter/svg_flutter.dart';

class CustomProfilePagesAppBar extends StatelessWidget {
  const CustomProfilePagesAppBar({
    super.key,
    required this.title,
  });
  final String title;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            InkWell(
              onTap: () => GoRouter.of(context).pop(context),
              child: SvgPicture.asset(
                AppSettings.langCode == 'ar'
                    ? AppAssets.arrowRight
                    : AppAssets.arrowLeft,
                height: 32.h,
                width: 32.w,
                colorFilter: ColorFilter.mode(
                  AppSettings.darkMode
                      ? Colors.white
                      : AppColors.kBrandColorBlack,
                  BlendMode.srcIn,
                ),
              ),
            ),
            const SizedBox(
              width: 6,
            ),
            Text(
              title,
              style: AppTextStyles.body2Medium.copyWith(
                color: AppSettings.darkMode
                    ? Colors.white
                    : AppColors.kBrandColorBlack,
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 12,
        ),
        Divider(
          color: AppSettings.darkMode
              ? AppColors.kGrey50DarkMode
              : AppColors.kGrey50,
        ),
      ],
    );
  }
}
