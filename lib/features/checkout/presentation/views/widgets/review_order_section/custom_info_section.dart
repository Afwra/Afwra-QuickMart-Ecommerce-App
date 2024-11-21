import 'package:flutter/material.dart';
import 'package:quick_mart/core/utils/app_colors.dart';
import 'package:quick_mart/core/utils/app_text_styles.dart';

class CustomInfoWidget extends StatelessWidget {
  const CustomInfoWidget({
    super.key,
    required this.title,
    required this.info,
  });
  final String title, info;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style:
              AppTextStyles.captionRegular.copyWith(color: AppColors.kGrey150),
        ),
        Text(
          info,
          style:
              AppTextStyles.captionRegular.copyWith(color: AppColors.kGrey150),
        ),
      ],
    );
  }
}
