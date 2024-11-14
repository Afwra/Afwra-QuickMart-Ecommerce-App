import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quick_mart/core/utils/app_colors.dart';
import 'package:quick_mart/features/home/data/models/product_model.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class CustomProductDetailsPageIndicator extends StatelessWidget {
  const CustomProductDetailsPageIndicator({
    super.key,
    required this.product,
  });

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.r),
            color: AppColors.kGrey50,
          ),
          padding: const EdgeInsets.all(5),
          child: SmoothPageIndicator(
            controller: PageController(),
            count: product.images.length,
            effect: JumpingDotEffect(
              dotColor: AppColors.kGrey100,
              activeDotColor: AppColors.kBrandColorCyan,
              dotHeight: 6.h,
              dotWidth: 6.w,
            ),
          ),
        ),
      ],
      // children: List.generate(
      //   product.images.length,
      //   (index) => CircleAvatar(
      //     backgroundColor: Colors.red,
      //     radius: 8.r,
      //   ),
      // ),
    );
  }
}
