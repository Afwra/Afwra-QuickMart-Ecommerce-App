import 'package:flutter/widgets.dart';
import 'package:quick_mart/core/utils/app_colors.dart';
import 'package:quick_mart/core/utils/app_text_styles.dart';
import 'package:quick_mart/features/auth/presentaion/views/widgets/custom_text_button.dart';

class CustomTermsWidget extends StatelessWidget {
  const CustomTermsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Wrap(
      alignment: WrapAlignment.center,
      crossAxisAlignment: WrapCrossAlignment.center,
      runSpacing: -15,
      children: [
        Text(
          'By login, you agree to our ',
          style: AppTextStyles.captionSemiBold,
        ),
        CustomTextButton(
          buttonText: 'Privacy Policy',
          padding: EdgeInsets.zero,
          style: AppTextStyles.captionSemiBold.copyWith(color: AppColors.kBlue),
        ),
        Text(
          ' and ',
          style: AppTextStyles.captionSemiBold,
        ),
        CustomTextButton(
          buttonText: 'Terms & Conditions',
          padding: EdgeInsets.zero,
          style: AppTextStyles.captionSemiBold.copyWith(color: AppColors.kBlue),
        ),
      ],
    );
  }
}