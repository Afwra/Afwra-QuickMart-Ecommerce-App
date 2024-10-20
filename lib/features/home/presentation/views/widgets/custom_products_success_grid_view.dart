import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quick_mart/features/home/data/models/product_model.dart';
import 'package:quick_mart/features/home/presentation/views/widgets/custom_products_item.dart';

class CustomProductsListingSuccessGridView extends StatelessWidget {
  const CustomProductsListingSuccessGridView({
    super.key,
    required this.products,
  });
  final List<ProductModel> products;
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 8.w,
        childAspectRatio: 0.65,
      ),
      itemBuilder: (context, index) =>
          CustomProductsItem(product: products[index]),
      itemCount: products.length,
    );
  }
}
