import 'package:flutter/material.dart';
import 'package:quick_mart/core/utils/app_colors.dart';
import 'package:quick_mart/core/utils/app_text_styles.dart';

class CustomTextButton extends StatelessWidget {
  const CustomTextButton({super.key, this.onPressed, required this.buttonText});
  final void Function()? onPressed;
  final String buttonText;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(padding: const EdgeInsets.only(left: 3)),
      onPressed: onPressed,
      child: Text(
        buttonText,
        style: AppTextStyles.body2Medium
            .copyWith(color: AppColors.kBrandColorCyan),
      ),
    );
  }
}
