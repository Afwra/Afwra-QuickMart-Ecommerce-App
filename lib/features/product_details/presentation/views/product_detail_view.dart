import 'package:flutter/material.dart';
import 'package:quick_mart/features/home/data/models/product_model.dart';
import 'package:quick_mart/features/product_details/presentation/views/widgets/product_detail_view_body.dart';

class ProductDetailView extends StatelessWidget {
  const ProductDetailView({super.key, required this.product});
  final ProductModel product;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ProductDetailViewBody(product: product),
      ),
    );
  }
}
