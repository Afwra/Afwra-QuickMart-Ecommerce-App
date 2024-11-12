import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quick_mart/core/utils/app_colors.dart';
import 'package:quick_mart/features/home/data/models/product_model.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class CustomProductDetailPageIndicator extends StatelessWidget {
  const CustomProductDetailPageIndicator({
    super.key,
    required this.product,
  });

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return SmoothIndicator(
      offset: 0,
      count: product.images.length,
      effect: JumpingDotEffect(
        activeDotColor: AppColors.kBrandColorCyan,
        dotHeight: 12.h,
        dotWidth: 12.w,
        dotColor: AppColors.kGrey100,
      ),
      size: Size(16.w, 16.h),
    );
  }
}
