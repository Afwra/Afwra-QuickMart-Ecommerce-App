import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quick_mart/core/utils/app_colors.dart';

abstract class AppTextStyles {
  static TextStyle heading1Bold = TextStyle(
    fontSize: 32.sp,
    height: 1.2,
    fontFamily: 'PlusJakartaSans',
    fontWeight: FontWeight.w700,
    color: AppColors.kBrandColorBlack,
  );
  static TextStyle heading1SemiBold = TextStyle(
    fontSize: 32.sp,
    height: 1.2,
    fontFamily: 'PlusJakartaSans',
    fontWeight: FontWeight.w600,
    color: AppColors.kBrandColorBlack,
  );
  static TextStyle heading1Regular = TextStyle(
    fontSize: 32.sp,
    height: 1.2,
    fontFamily: 'PlusJakartaSans',
    fontWeight: FontWeight.w400,
    color: AppColors.kBrandColorBlack,
  );
  static TextStyle heading2Bold = TextStyle(
    fontSize: 24.sp,
    height: 1.2,
    fontFamily: 'PlusJakartaSans',
    fontWeight: FontWeight.w700,
    color: AppColors.kBrandColorBlack,
  );
  static TextStyle heading2SemiBold = TextStyle(
    fontSize: 24.sp,
    height: 1.2,
    fontFamily: 'PlusJakartaSans',
    fontWeight: FontWeight.w600,
    color: AppColors.kBrandColorBlack,
  );
  static TextStyle heading2Regular = TextStyle(
    fontSize: 24.sp,
    height: 1.2,
    fontFamily: 'PlusJakartaSans',
    fontWeight: FontWeight.w400,
    color: AppColors.kBrandColorBlack,
  );
  static TextStyle heading3Bold = TextStyle(
    fontSize: 18.sp,
    height: 1.2,
    fontFamily: 'PlusJakartaSans',
    letterSpacing: 18 * 0.0025,
    fontWeight: FontWeight.w700,
    color: AppColors.kBrandColorBlack,
  );
  static TextStyle heading3SemiBold = TextStyle(
    fontSize: 18.sp,
    height: 1.2,
    fontFamily: 'PlusJakartaSans',
    fontWeight: FontWeight.w600,
    letterSpacing: 18 * 0.0025,
    color: AppColors.kBrandColorBlack,
  );
  static TextStyle heading3Regular = TextStyle(
    fontSize: 18.sp,
    height: 1.2,
    letterSpacing: 18 * 0.0025,
    fontFamily: 'PlusJakartaSans',
    fontWeight: FontWeight.w400,
    color: AppColors.kBrandColorBlack,
  );
  static TextStyle button1 = TextStyle(
    fontSize: 16.sp,
    fontFamily: 'PlusJakartaSans',
    fontWeight: FontWeight.w600,
    color: AppColors.kBrandColorBlack,
  );
  static TextStyle button2 = TextStyle(
    fontSize: 14.sp,
    fontFamily: 'PlusJakartaSans',
    fontWeight: FontWeight.w600,
    color: AppColors.kBrandColorBlack,
  );
  static TextStyle body1Medium = TextStyle(
    fontSize: 16.sp,
    fontFamily: 'PlusJakartaSans',
    letterSpacing: 16 * 0.005,
    height: 1.5,
    fontWeight: FontWeight.w500,
    color: AppColors.kBrandColorBlack,
  );
  static TextStyle body1Regular = TextStyle(
    fontSize: 16.sp,
    fontFamily: 'PlusJakartaSans',
    letterSpacing: 16 * 0.005,
    height: 1.5,
    fontWeight: FontWeight.w400,
    color: AppColors.kBrandColorBlack,
  );
  static TextStyle body2Medium = TextStyle(
    fontSize: 14.sp,
    fontFamily: 'PlusJakartaSans',
    letterSpacing: 14 * 0.005,
    height: 1.5,
    fontWeight: FontWeight.w500,
    color: AppColors.kBrandColorBlack,
  );
  static TextStyle body2Regular = TextStyle(
    fontSize: 14.sp,
    fontFamily: 'PlusJakartaSans',
    letterSpacing: 14 * 0.005,
    height: 1.5,
    fontWeight: FontWeight.w400,
    color: AppColors.kBrandColorBlack,
  );
  static TextStyle captionSemiBold = TextStyle(
    fontSize: 12.sp,
    fontFamily: 'PlusJakartaSans',
    letterSpacing: 12 * 0.005,
    fontWeight: FontWeight.w600,
    color: AppColors.kBrandColorBlack,
  );
  static TextStyle captionRegular = TextStyle(
    fontSize: 12.sp,
    fontFamily: 'PlusJakartaSans',
    letterSpacing: 12 * 0.005,
    fontWeight: FontWeight.w400,
    color: AppColors.kBrandColorBlack,
  );
  static TextStyle overlineSemiBold = TextStyle(
    fontSize: 10.sp,
    fontFamily: 'PlusJakartaSans',
    letterSpacing: 10 * 0.015,
    fontWeight: FontWeight.w600,
    color: AppColors.kBrandColorBlack,
  );
  static TextStyle overlineRegular = TextStyle(
    fontSize: 10.sp,
    fontFamily: 'PlusJakartaSans',
    letterSpacing: 10 * 0.015,
    fontWeight: FontWeight.w400,
    color: AppColors.kBrandColorBlack,
  );
}
