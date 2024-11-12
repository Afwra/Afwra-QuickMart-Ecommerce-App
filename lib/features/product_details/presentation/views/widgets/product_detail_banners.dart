import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quick_mart/core/utils/app_colors.dart';
import 'package:quick_mart/core/utils/app_text_styles.dart';

class ProductDetailBanners extends StatelessWidget {
  const ProductDetailBanners({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.r),
            color: Colors.blue,
          ),
          padding: EdgeInsets.symmetric(vertical: 5.5.h, horizontal: 6.h),
          child: Center(
            child: Text(
              'Top Rated',
              style: AppTextStyles.overlineSemiBold
                  .copyWith(color: AppColors.kBrandColorWhite),
            ),
          ),
        ),
        const SizedBox(
          width: 6,
        ),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.r),
            color: Colors.green,
          ),
          padding: EdgeInsets.symmetric(vertical: 5.5.h, horizontal: 6.h),
          child: Center(
            child: Text(
              'Free Shipping',
              style: AppTextStyles.overlineSemiBold
                  .copyWith(color: AppColors.kBrandColorWhite),
            ),
          ),
        ),
      ],
    );
  }
}
