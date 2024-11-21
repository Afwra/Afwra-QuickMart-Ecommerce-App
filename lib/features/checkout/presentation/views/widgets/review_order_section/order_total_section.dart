import 'package:flutter/material.dart';
import 'package:quick_mart/core/utils/app_colors.dart';
import 'package:quick_mart/core/utils/app_settings.dart';
import 'package:quick_mart/core/utils/app_text_styles.dart';

class OrderTotalSection extends StatelessWidget {
  const OrderTotalSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Total',
          style: AppTextStyles.body1Medium.copyWith(
              color: AppSettings.darkMode
                  ? Colors.white
                  : AppColors.kBrandColorBlack),
        ),
        Text(
          'Total',
          style: AppTextStyles.body1Medium.copyWith(
              color: AppSettings.darkMode
                  ? Colors.white
                  : AppColors.kBrandColorBlack),
        ),
      ],
    );
  }
}
