import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quick_mart/core/utils/app_colors.dart';
import 'package:quick_mart/core/utils/app_text_styles.dart';

class FilledOrderItemTitleSection extends StatelessWidget {
  const FilledOrderItemTitleSection({
    super.key,
    required this.completed,
  });

  final bool completed;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(6),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.r),
        color: completed ? AppColors.kBlue : AppColors.kRed,
      ),
      child: Text(
        completed ? 'Completed' : 'Estimated time: 7 working days',
        style: AppTextStyles.overlineSemiBold.copyWith(
          color: AppColors.kBrandColorWhite,
        ),
      ),
    );
  }
}
