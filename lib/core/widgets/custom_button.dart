import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quick_mart/core/utils/app_colors.dart';
import 'package:quick_mart/core/utils/app_text_styles.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    this.onPressed,
    this.textColor,
    required this.text,
    this.color = AppColors.kBrandColorBlack,
  });
  final String text;
  final void Function()? onPressed;
  final Color? color, textColor;
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      height: 60.h,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      color: color,
      onPressed: onPressed,
      child: Text(
        text,
        style: AppTextStyles.button2.copyWith(color: textColor ?? Colors.white),
      ),
    );
  }
}
