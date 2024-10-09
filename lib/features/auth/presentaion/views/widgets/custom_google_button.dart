import 'package:flutter/material.dart';
import 'package:quick_mart/core/utils/app_assets.dart';
import 'package:quick_mart/core/utils/app_colors.dart';
import 'package:quick_mart/core/widgets/custom_button_with_icon.dart';

class CustomGoogleButton extends StatelessWidget {
  const CustomGoogleButton({
    super.key,
    required this.darkMode,
    required this.text,
    this.onPressed,
  });

  final bool darkMode;
  final String text;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return CustomButtonWithIcon(
      text: text,
      onPressed: onPressed,
      iconPath: AppAssets.google,
      color: darkMode ? AppColors.kBrandColorBlack : AppColors.kBrandColorWhite,
      textColor:
          darkMode ? AppColors.kBrandColorWhite : AppColors.kBrandColorBlack,
      borderColor: darkMode ? AppColors.kGrey50DarkMode : AppColors.kGrey50,
    );
  }
}
