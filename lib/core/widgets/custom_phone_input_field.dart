import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl_phone_field/country_picker_dialog.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:intl_phone_field/phone_number.dart';
import 'package:quick_mart/core/utils/app_colors.dart';
import 'package:quick_mart/core/utils/app_settings.dart';
import 'package:quick_mart/core/utils/app_text_styles.dart';

class CustomPhoneInputField extends StatelessWidget {
  const CustomPhoneInputField({
    super.key,
    required this.titleText,
    this.darkMode = false,
    this.controller,
    this.autovalidateMode,
    this.validator,
  });
  final String titleText;
  final bool darkMode;
  final TextEditingController? controller;
  final AutovalidateMode? autovalidateMode;
  final FutureOr<String?> Function(PhoneNumber?)? validator;
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
          height: 6,
        ),
        SizedBox(
          child: IntlPhoneField(
            validator: validator,
            controller: controller,
            autovalidateMode: autovalidateMode,
            flagsButtonPadding:
                EdgeInsets.symmetric(horizontal: 10.w, vertical: 18.h),
            textAlignVertical: TextAlignVertical.center,
            initialCountryCode: 'EG',
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(
                vertical: 22.h,
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.r),
                borderSide: BorderSide(
                  color:
                      darkMode ? AppColors.kGrey50DarkMode : AppColors.kGrey50,
                  width: 2,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.r),
                borderSide: const BorderSide(
                  color: AppColors.kBrandColorCyan,
                  width: 2,
                ),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.r),
                borderSide: const BorderSide(
                  color: Colors.red,
                  width: 2,
                ),
              ),
              hintStyle: AppTextStyles.captionRegular
                  .copyWith(color: AppColors.kGrey100),
            ),
            dropdownIconPosition: IconPosition.trailing,
            dropdownTextStyle: AppTextStyles.captionRegular
                .copyWith(color: AppColors.kGrey100),
            pickerDialogStyle: customPickerDialogStyle(),
          ),
        ),
      ],
    );
  }

  PickerDialogStyle customPickerDialogStyle() {
    return PickerDialogStyle(
      backgroundColor: AppSettings.darkMode
          ? AppColors.kBrandColorBlack
          : AppColors.kBrandColorWhite,
      countryCodeStyle:
          AppTextStyles.captionRegular.copyWith(color: AppColors.kGrey100),
      countryNameStyle:
          AppTextStyles.captionRegular.copyWith(color: AppColors.kGrey100),
      searchFieldInputDecoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: BorderSide(
            color: darkMode ? AppColors.kGrey50DarkMode : AppColors.kGrey50,
            width: 2,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: const BorderSide(
            color: AppColors.kBrandColorCyan,
            width: 2,
          ),
        ),
        hintStyle: AppTextStyles.captionRegular.copyWith(
          color: AppColors.kGrey100,
        ),
        labelStyle:
            AppTextStyles.captionRegular.copyWith(color: AppColors.kGrey100),
        hintText: 'Search Country',
      ),
    );
  }
}
