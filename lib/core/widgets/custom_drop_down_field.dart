import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quick_mart/core/utils/app_colors.dart';
import 'package:quick_mart/core/utils/app_settings.dart';
import 'package:quick_mart/core/utils/app_text_styles.dart';

class CustomDropDownField extends StatelessWidget {
  const CustomDropDownField({
    super.key,
    this.value,
    required this.title,
  });
  final String? value;
  final String title;
  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      padding: EdgeInsets.zero,
      value: value,
      items: [
        value != null
            ? DropdownMenuItem(
                value: value,
                child: Text(
                  value.toString(),
                ),
              )
            : DropdownMenuItem(
                value: '',
                child: Text(
                  'Select $title',
                ),
              ),
        const DropdownMenuItem(
          value: '1',
          child: Text(
            'Province 1',
          ),
        ),
        const DropdownMenuItem(
          value: '2',
          child: Text(
            'Province 2',
          ),
        ),
      ],
      onChanged: (value) {},
      hint: Text(
        'Select Province',
        style: AppTextStyles.captionRegular.copyWith(
          color:
              AppSettings.darkMode ? Colors.white : AppColors.kBrandColorBlack,
        ),
      ),
      decoration: InputDecoration(
        contentPadding:
            EdgeInsets.only(top: 22.h, bottom: 22.h, left: 16.h, right: 12.h),
        fillColor:
            AppSettings.darkMode ? AppColors.kBrandColorBlack : Colors.white,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: BorderSide(
            color: AppSettings.darkMode
                ? AppColors.kGrey50DarkMode
                : AppColors.kGrey50,
            width: 2,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide:
              const BorderSide(color: AppColors.kBrandColorCyan, width: 2),
        ),
      ),
      dropdownColor:
          AppSettings.darkMode ? AppColors.kBrandColorBlack : Colors.white,
      style: AppTextStyles.captionSemiBold.copyWith(
        color: AppSettings.darkMode ? Colors.white : AppColors.kBrandColorBlack,
      ),
    );
  }
}
