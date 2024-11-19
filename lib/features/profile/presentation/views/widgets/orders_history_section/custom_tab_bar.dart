import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quick_mart/core/utils/app_colors.dart';
import 'package:quick_mart/core/utils/app_settings.dart';
import 'package:quick_mart/core/utils/app_text_styles.dart';

class CustomTabBar extends StatelessWidget {
  const CustomTabBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppSettings.darkMode
            ? AppColors.kGrey50DarkMode
            : AppColors.kGrey50,
        borderRadius: BorderRadius.circular(12.r),
      ),
      height: 48.h,
      child: TabBar(
        tabs: const [
          Text('Ongoing'),
          Text('Completed'),
        ],
        dividerColor: Colors.transparent,
        indicatorColor: AppColors.kBrandColorBlack,
        labelColor: AppSettings.darkMode
            ? AppColors.kBrandColorBlack
            : AppColors.kBrandColorWhite,
        unselectedLabelColor:
            AppSettings.darkMode ? Colors.white : AppColors.kBrandColorBlack,
        indicator: BoxDecoration(
          borderRadius: BorderRadius.circular(12.r),
          color: AppColors.kBrandColorBlack,
        ),
        indicatorSize: TabBarIndicatorSize.tab,
        labelStyle: AppTextStyles.button2,
        unselectedLabelStyle: AppTextStyles.button2,
      ),
    );
  }
}
