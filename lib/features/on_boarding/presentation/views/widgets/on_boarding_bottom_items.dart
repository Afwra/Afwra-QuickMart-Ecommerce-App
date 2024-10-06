import 'package:flutter/material.dart';
import 'package:quick_mart/core/utils/app_colors.dart';
import 'package:quick_mart/core/utils/app_text_styles.dart';
import 'package:quick_mart/features/on_boarding/data/models/on_boarding_item_model.dart';

class OnBoardingBottomItems extends StatelessWidget {
  const OnBoardingBottomItems({super.key, required this.item});
  final OnBoardingItemModel item;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          item.title,
          style: AppTextStyles.heading2Bold,
          textAlign: TextAlign.center,
        ),
        const SizedBox(
          height: 16,
        ),
        Text(
          item.subtitle,
          style: AppTextStyles.body2Regular.copyWith(color: AppColors.kGrey150),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
