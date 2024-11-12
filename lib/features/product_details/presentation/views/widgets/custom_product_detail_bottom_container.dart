import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quick_mart/core/utils/app_colors.dart';
import 'package:quick_mart/core/utils/app_text_styles.dart';

class CustomProductDetailBottomContainer extends StatelessWidget {
  const CustomProductDetailBottomContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.bottomCenter,
      height: 500.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(32.r), topRight: Radius.circular(32.r)),
        boxShadow: [BoxShadow(blurRadius: 2, color: Colors.black)],
        color: AppColors.kBrandColorWhite,
      ),
      child: Padding(
        padding: EdgeInsets.only(top: 24.h, left: 16.w, right: 16.w),
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.r),
                    color: Colors.blue,
                  ),
                  padding:
                      EdgeInsets.symmetric(vertical: 5.5.h, horizontal: 6.h),
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
                  padding:
                      EdgeInsets.symmetric(vertical: 5.5.h, horizontal: 6.h),
                  child: Center(
                    child: Text(
                      'Free Shipping',
                      style: AppTextStyles.overlineSemiBold
                          .copyWith(color: AppColors.kBrandColorWhite),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
