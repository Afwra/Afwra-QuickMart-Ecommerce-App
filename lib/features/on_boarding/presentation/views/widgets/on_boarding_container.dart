import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quick_mart/core/utils/app_colors.dart';
import 'package:quick_mart/features/on_boarding/data/models/on_boarding_item_model.dart';
import 'package:quick_mart/features/on_boarding/presentation/views/widgets/on_boarding_row_item.dart';

class OnBoardingContainer extends StatelessWidget {
  const OnBoardingContainer({super.key, required this.item});
  final OnBoardingItemModel item;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 20.h, left: 18.w, right: 18.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(32),
        color: AppColors.kBrandColorCyan50,
      ),
      child: Column(
        children: [
          const OnBoardingRowItem(),
          const SizedBox(
            height: 46,
          ),
          Image.asset(
            height: 240.h,
            width: 240.w,
            item.image,
            fit: BoxFit.cover,
          ),
          const SizedBox(
            height: 70,
          ),
        ],
      ),
    );
  }
}
