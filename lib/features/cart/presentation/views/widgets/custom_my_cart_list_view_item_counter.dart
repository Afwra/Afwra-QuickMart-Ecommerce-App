import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quick_mart/core/utils/app_colors.dart';
import 'package:quick_mart/core/utils/app_text_styles.dart';

class CustomMyCartListViewItemCounter extends StatelessWidget {
  const CustomMyCartListViewItemCounter({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.r),
        border: Border.all(color: AppColors.kGrey50),
      ),
      padding: const EdgeInsets.all(4),
      height: 32.h,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.remove,
            size: 20,
          ),
          const SizedBox(
            width: 20,
          ),
          Text(
            '1',
            style: AppTextStyles.body1Medium,
          ),
          const SizedBox(
            width: 20,
          ),
          const Icon(
            Icons.add,
            size: 20,
          ),
        ],
      ),
    );
  }
}
