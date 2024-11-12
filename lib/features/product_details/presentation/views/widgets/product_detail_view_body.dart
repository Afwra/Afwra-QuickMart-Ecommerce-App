import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quick_mart/features/home/data/models/product_model.dart';
import 'package:quick_mart/features/product_details/presentation/views/widgets/custom_product_detail_app_bar.dart';
import 'package:quick_mart/features/product_details/presentation/views/widgets/custom_product_detail_bottom_container.dart';
import 'package:quick_mart/features/product_details/presentation/views/widgets/custom_product_detail_page_indicator.dart';
import 'package:quick_mart/features/product_details/presentation/views/widgets/custom_product_detail_page_view.dart';

class ProductDetailViewBody extends StatelessWidget {
  const ProductDetailViewBody({
    super.key,
    required this.product,
  });

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Stack(
            children: [
              Positioned.fill(
                top: 0,
                right: 0,
                left: 0,
                bottom: 450.h,
                child: CustomProductDetailPageView(product: product),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: CustomProductDetailAppBar(product: product),
              ),
              Positioned(
                top: 250,
                left: (MediaQuery.of(context).size.width / 2) - 32,
                child: CustomProductDetailPageIndicator(product: product),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: CustomProductDetailBottomContainer(),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
