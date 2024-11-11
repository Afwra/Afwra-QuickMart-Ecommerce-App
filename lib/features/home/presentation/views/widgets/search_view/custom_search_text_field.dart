import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quick_mart/core/utils/app_assets.dart';
import 'package:quick_mart/core/utils/app_colors.dart';
import 'package:quick_mart/core/utils/app_text_styles.dart';
import 'package:svg_flutter/svg_flutter.dart';

class CustomSearchTextField extends StatelessWidget {
  const CustomSearchTextField({
    super.key,
    required this.darkMode,
  });
  final bool darkMode;
  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        hintText: 'Search',
        suffixIcon: Padding(
          padding: EdgeInsets.only(right: 12.w, top: 16.h, bottom: 16.h),
          child: SvgPicture.asset(
            AppAssets.filterIcon,
            colorFilter:
                const ColorFilter.mode(AppColors.kGrey150, BlendMode.srcIn),
            height: 24.h,
            width: 24.w,
          ),
        ),
        prefixIcon: Padding(
          padding: EdgeInsets.only(
              left: 12.w, right: 4.5.w, top: 16.h, bottom: 16.h),
          child: SvgPicture.asset(
            AppAssets.searchIcon,
            colorFilter:
                const ColorFilter.mode(AppColors.kGrey150, BlendMode.srcIn),
            height: 24.h,
            width: 24.w,
          ),
        ),
        hintStyle:
            AppTextStyles.captionRegular.copyWith(color: AppColors.kGrey150),
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
    );
  }
}
