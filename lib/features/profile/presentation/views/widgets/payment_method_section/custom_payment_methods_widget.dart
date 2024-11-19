import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quick_mart/core/utils/app_assets.dart';
import 'package:quick_mart/core/utils/app_colors.dart';
import 'package:svg_flutter/svg_flutter.dart';

class CustomPaymentMethodsWidget extends StatelessWidget {
  const CustomPaymentMethodsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: 64.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.r),
              color: AppColors.kCyan50,
            ),
            child: Center(
              child: SvgPicture.asset(AppAssets.paypalIcon),
            ),
          ),
        ),
        const SizedBox(
          width: 8,
        ),
        Expanded(
          child: Container(
            height: 64.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.r),
              color: AppColors.kCyan50,
            ),
            child: Center(
              child: SvgPicture.asset(AppAssets.googlePayIcon),
            ),
          ),
        ),
      ],
    );
  }
}
