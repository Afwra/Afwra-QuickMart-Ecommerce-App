import 'package:flutter/material.dart';
import 'package:quick_mart/core/utils/app_colors.dart';
import 'package:quick_mart/core/utils/app_text_styles.dart';

class CustomTextButton extends StatelessWidget {
  const CustomTextButton(
      {super.key,
      this.onPressed,
      required this.buttonText,
      this.style,
      this.padding});
  final void Function()? onPressed;
  final String buttonText;
  final TextStyle? style;
  final EdgeInsetsGeometry? padding;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        padding: padding ?? const EdgeInsets.only(left: 3),
        visualDensity: VisualDensity.compact,
      ),
      onPressed: onPressed,
      child: Text(
        buttonText,
        style: style ??
            AppTextStyles.body2Medium
                .copyWith(color: AppColors.kBrandColorCyan),
      ),
    );
  }
}
