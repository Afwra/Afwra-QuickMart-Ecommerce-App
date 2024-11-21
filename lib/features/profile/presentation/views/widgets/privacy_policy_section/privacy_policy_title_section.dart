import 'package:flutter/material.dart';
import 'package:quick_mart/core/utils/app_colors.dart';
import 'package:quick_mart/core/utils/app_settings.dart';
import 'package:quick_mart/core/utils/app_text_styles.dart';

class PrivacyPolicyTitleSection extends StatelessWidget {
  const PrivacyPolicyTitleSection({
    super.key,
    required this.title,
    required this.subTitle,
  });
  final String title, subTitle;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: AppTextStyles.heading2Bold.copyWith(
              color: AppSettings.darkMode
                  ? Colors.white
                  : AppColors.kBrandColorBlack),
        ),
        const SizedBox(
          height: 6,
        ),
        Text(
          subTitle,
          style: AppTextStyles.body2Medium.copyWith(
            color: AppColors.kGrey150,
          ),
        ),
      ],
    );
  }
}
