import 'package:flutter/material.dart';
import 'package:quick_mart/features/home/data/models/category_model.dart';
import 'package:quick_mart/features/home/presentation/views/widgets/product_listing_view_body.dart';

class ProductListingView extends StatelessWidget {
  const ProductListingView({super.key, required this.category});
  final CategoryModel category;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: ProductListingViewBody()),
    );
  }
}
