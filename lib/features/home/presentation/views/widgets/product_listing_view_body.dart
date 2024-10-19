import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quick_mart/features/home/presentation/views/widgets/custom_products_listing_app_bar.dart';
import 'package:quick_mart/features/home/presentation/views/widgets/custom_products_success_grid_view.dart';

class ProductListingViewBody extends StatelessWidget {
  const ProductListingViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: 16.w, horizontal: 12.h),
          child: CustomProductListingAppBar(
            title: 'Smart Watches',
          ),
        ),
        const SizedBox(
          height: 24,
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: CustomProductsListingSuccessGridView(),
          ),
        ),
      ],
    );
  }
}
