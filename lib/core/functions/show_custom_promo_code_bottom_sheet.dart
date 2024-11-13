import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quick_mart/features/cart/presentation/views/widgets/custom_promo_code_bottom_sheet.dart';

void showCustomPromoCodeBottomSheet(BuildContext context) {
  showModalBottomSheet(
    isScrollControlled: true,
    context: context,
    backgroundColor: Colors.white,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(24.r)),
    ),
    builder: (context) => Padding(
      padding: EdgeInsets.only(
          top: 32.h,
          left: 16.w,
          right: 16.w,
          bottom: MediaQuery.of(context).viewInsets.bottom + 32.h),
      child: const CustomPromoCodeBottomSheet(),
    ),
  );
}
