import 'package:flutter/material.dart';
import 'package:quick_mart/features/home/data/models/product_model.dart';
import 'package:quick_mart/features/product_details/presentation/views/widgets/custom_product_detail_app_bar.dart';
import 'package:quick_mart/features/product_details/presentation/views/widgets/custom_product_detail_bottom_container.dart';

class ProductDetailViewBody extends StatelessWidget {
  const ProductDetailViewBody({
    super.key,
    required this.product,
  });

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        CustomProductDetailAppBar(product: product),
        CustomProductDetailBottomContainer(product: product),
      ],
    );
  }
}
