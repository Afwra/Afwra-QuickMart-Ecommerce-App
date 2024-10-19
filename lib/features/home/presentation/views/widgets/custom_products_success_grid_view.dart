import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quick_mart/features/home/data/models/product_model.dart';
import 'package:quick_mart/features/home/presentation/views/widgets/custom_products_item.dart';

class CustomProductsListingSuccessGridView extends StatelessWidget {
  const CustomProductsListingSuccessGridView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 8.w,
        childAspectRatio: 0.65,
      ),
      itemBuilder: (context, index) => CustomProductsItem(
        product: ProductModel(
            id: 1,
            price: 100,
            oldPrice: 145,
            discount: 15,
            image:
                'https://images.unsplash.com/photo-1719937206491-ed673f64be1f?q=80&w=1974&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
            name: 'hello there',
            description: 'oba',
            images: ['image'],
            inFavorites: false,
            inCart: false),
      ),
    );
  }
}
