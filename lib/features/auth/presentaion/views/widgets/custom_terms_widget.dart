import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:quick_mart/core/utils/app_colors.dart';
import 'package:quick_mart/core/utils/app_text_styles.dart';
import 'package:quick_mart/core/utils/app_texts.dart';
import 'package:quick_mart/features/auth/presentaion/views/widgets/custom_text_button.dart';

class CustomTermsWidget extends StatelessWidget {
  const CustomTermsWidget({
    super.key,
    this.darkMode = false,
  });
  final bool darkMode;
  @override
  Widget build(BuildContext context) {
    return Wrap(
      alignment: WrapAlignment.center,
      crossAxisAlignment: WrapCrossAlignment.center,
      runSpacing: -15,
      children: [
        Text(
          AppTexts.terms1.tr(),
          style: AppTextStyles.captionSemiBold.copyWith(
              color: darkMode ? Colors.white : AppColors.kBrandColorBlack),
        ),
        CustomTextButton(
          buttonText: ' ${AppTexts.termsButton1.tr()} ',
          padding: EdgeInsets.zero,
          style: AppTextStyles.captionSemiBold.copyWith(color: AppColors.kBlue),
        ),
        Text(
          ' ${AppTexts.terms2.tr()} ',
          style: AppTextStyles.captionSemiBold.copyWith(
              color: darkMode ? Colors.white : AppColors.kBrandColorBlack),
        ),
        CustomTextButton(
          buttonText: AppTexts.termsButton2.tr(),
          padding: EdgeInsets.zero,
          style: AppTextStyles.captionSemiBold.copyWith(color: AppColors.kBlue),
        ),
      ],
    );
  }
}
