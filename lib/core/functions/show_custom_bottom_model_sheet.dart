import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quick_mart/core/utils/app_colors.dart';
import 'package:quick_mart/core/utils/app_settings.dart';
import 'package:quick_mart/features/home/presentation/views/widgets/custom_filter_bottom_sheet.dart';

void showCustomFilterBottomSheet(BuildContext context,
    {required VoidCallback onPressed}) {
  showModalBottomSheet(
    isScrollControlled: false,
    context: context,
    backgroundColor: AppSettings.darkMode
        ? AppColors.kBrandColorBlack
        : AppColors.kBrandColorWhite,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
    ),
    builder: (context) => CustomFilterBottomSheet(
      onPressed: onPressed,
    ),
  );
}
