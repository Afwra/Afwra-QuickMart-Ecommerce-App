import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quick_mart/features/home/data/models/product_model.dart';
import 'package:quick_mart/features/product_details/presentation/views/widgets/custom_product_detail_page_indicator.dart';
import 'package:quick_mart/features/product_details/presentation/views/widgets/custom_product_detail_page_view.dart';

class CustomProductDetailAppBar extends StatelessWidget {
  const CustomProductDetailAppBar({
    super.key,
    required this.product,
  });

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 300.h,
      backgroundColor: Colors.white,
      elevation: 0,
      actions: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: CircleAvatar(
            backgroundColor: Colors.black,
            child: IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.favorite_outline,
                color: product.inFavorites ? Colors.red : Colors.white,
              ),
            ),
          ),
        ),
      ],
      flexibleSpace: FlexibleSpaceBar(
        background: CustomProductDetailPageView(product: product),
        title: CustomProductDetailsPageIndicator(product: product),
        centerTitle: true,
      ),
      stretch: true,
    );
  }
}
