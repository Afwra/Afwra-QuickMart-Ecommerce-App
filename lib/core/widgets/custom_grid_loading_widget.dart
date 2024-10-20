import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quick_mart/core/utils/app_colors.dart';
import 'package:skeletonizer/skeletonizer.dart';

class CustomGridLoadingWidget extends StatelessWidget {
  const CustomGridLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: true,
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 8.w,
          childAspectRatio: 0.65,
          mainAxisSpacing: 8.h,
        ),
        itemBuilder: (context, index) => ClipRRect(
          borderRadius: BorderRadius.circular(24.r),
          child: Container(
            height: 138.h,
            width: 160.w,
            color: AppColors.kGrey50,
          ),
        ),
        itemCount: 8,
      ),
    );
  }
}
