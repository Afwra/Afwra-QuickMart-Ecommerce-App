import 'package:flutter/material.dart';
import 'package:quick_mart/core/utils/app_text_styles.dart';
import 'package:quick_mart/features/auth/presentaion/views/widgets/custom_text_button.dart';

class AuthTitleAndSubtitle extends StatelessWidget {
  const AuthTitleAndSubtitle(
      {super.key,
      required this.title,
      required this.subTitle,
      required this.buttonText,
      this.onPressed});
  final String title, subTitle, buttonText;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: AppTextStyles.heading2Bold,
        ),
        Row(
          children: [
            Text(
              subTitle,
              style: AppTextStyles.body2Regular,
            ),
            CustomTextButton(buttonText: buttonText, onPressed: onPressed),
          ],
        ),
      ],
    );
  }
}
