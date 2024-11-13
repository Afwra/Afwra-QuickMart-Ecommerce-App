import 'package:flutter/material.dart';
import 'package:quick_mart/core/utils/app_colors.dart';
import 'package:quick_mart/core/utils/app_text_styles.dart';

class CustomOrderInfoRow extends StatelessWidget {
  const CustomOrderInfoRow({
    super.key,
    required this.title,
    required this.price,
  });
  final String title, price;
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
          '\$$price',
          style:
              AppTextStyles.captionRegular.copyWith(color: AppColors.kGrey150),
        ),
      ],
    );
  }
}
