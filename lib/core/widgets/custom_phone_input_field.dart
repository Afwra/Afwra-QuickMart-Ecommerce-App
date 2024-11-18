import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl_phone_field/country_picker_dialog.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:quick_mart/core/utils/app_colors.dart';
import 'package:quick_mart/core/utils/app_settings.dart';
import 'package:quick_mart/core/utils/app_text_styles.dart';

class CustomPhoneInputField extends StatelessWidget {
  const CustomPhoneInputField({
    super.key,
    required this.titleText,
    this.darkMode = false,
  });
  final String titleText;
  final bool darkMode;
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
        SizedBox(
          height: 120.h,
          child: IntlPhoneField(
            flagsButtonPadding:
                EdgeInsets.symmetric(horizontal: 10.w, vertical: 18.h),
            textAlignVertical: TextAlignVertical.center,
            initialCountryCode: 'EG',
            decoration: InputDecoration(
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