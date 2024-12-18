import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quick_mart/core/utils/app_colors.dart';
import 'package:quick_mart/core/utils/app_text_styles.dart';

class CustomTextFormField extends StatelessWidget {
  final String? labelText;
  final String hintText;
  final String titleText;
  final IconData? prefixIcon;
  final bool obscureText;
  final TextInputType keyboardType;
  final TextEditingController? controller;
  final FormFieldValidator<String>? validator;
  final Widget? suffix;
  final bool darkMode;
  final AutovalidateMode? autovalidateMode;

  const CustomTextFormField({
    super.key,
    this.labelText,
    required this.hintText,
    this.prefixIcon,
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
    this.controller,
    this.validator,
    required this.titleText,
    this.suffix,
    this.darkMode = false,
    this.autovalidateMode,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          titleText,
          style: AppTextStyles.body2Medium.copyWith(
              color: darkMode ? Colors.white : AppColors.kBrandColorBlack),
        ),
        const SizedBox(
          height: 8,
        ),
        TextFormField(
          autovalidateMode: autovalidateMode,
          controller: controller,
          keyboardType: keyboardType,
          obscureText: obscureText,
          validator: validator,
          decoration: InputDecoration(
            contentPadding:
                const EdgeInsets.symmetric(vertical: 22.5, horizontal: 16),
            labelText: labelText,
            hintText: hintText,
            suffixIcon: suffix,
            suffixIconConstraints: BoxConstraints(
              maxHeight: 48.h,
              maxWidth: 48.w,
            ),
            hintStyle: AppTextStyles.captionRegular
                .copyWith(color: AppColors.kGrey100),
            prefixIcon: prefixIcon != null ? Icon(prefixIcon) : null,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.0),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.0),
              borderSide:
                  const BorderSide(color: AppColors.kBrandColorCyan, width: 2),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.0),
              borderSide: BorderSide(
                color: darkMode ? AppColors.kGrey50DarkMode : AppColors.kGrey50,
                width: 2,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
