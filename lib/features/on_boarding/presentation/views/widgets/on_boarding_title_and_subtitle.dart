import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:quick_mart/core/utils/app_colors.dart';
import 'package:quick_mart/core/utils/app_settings.dart';
import 'package:quick_mart/core/utils/app_text_styles.dart';
import 'package:quick_mart/features/on_boarding/data/models/on_boarding_item_model.dart';

class OnBoardingTitleAndSubtitle extends StatelessWidget {
  const OnBoardingTitleAndSubtitle({super.key, required this.item});
  final OnBoardingItemModel item;
  @override
  Widget build(BuildContext context) {
    bool darkMode = AppSettings.darkMode;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          item.title.tr(),
          style: AppTextStyles.heading2Bold.copyWith(
              color: darkMode ? Colors.white : AppColors.kBrandColorBlack),
          textAlign: TextAlign.center,
        ),
        const SizedBox(
          height: 16,
        ),
        Text(
          item.subtitle.tr(),
          style: AppTextStyles.body2Regular.copyWith(color: AppColors.kGrey150),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
