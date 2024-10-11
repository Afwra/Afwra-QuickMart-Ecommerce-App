import 'package:flutter/material.dart';
import 'package:quick_mart/core/utils/app_colors.dart';
import 'package:quick_mart/core/utils/app_text_styles.dart';
import 'package:quick_mart/core/widgets/custom_text_button.dart';

class AuthTitleAndSubtitle extends StatelessWidget {
  const AuthTitleAndSubtitle(
      {super.key,
      required this.title,
      required this.subTitle,
      required this.buttonText,
      this.onPressed,
      required this.darkMode});
  final String title, subTitle, buttonText;
  final void Function()? onPressed;
  final bool darkMode;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: AppTextStyles.heading2Bold.copyWith(
              color: darkMode ? Colors.white : AppColors.kBrandColorBlack),
        ),
        Row(
          children: [
            Text(
              subTitle,
              style: AppTextStyles.body2Regular.copyWith(
                  color: darkMode
                      ? AppColors.kGrey150
                      : AppColors.kBrandColorBlack),
            ),
            const SizedBox(
              width: 5,
            ),
            CustomTextButton(buttonText: buttonText, onPressed: onPressed),
          ],
        ),
      ],
    );
  }
}
