import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:quick_mart/core/utils/app_colors.dart';
import 'package:quick_mart/features/home/data/models/product_model.dart';

class CustomProductDetailAppBar extends StatelessWidget {
  const CustomProductDetailAppBar({
    super.key,
    required this.product,
  });

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          onPressed: () {
            GoRouter.of(context).pop();
          },
          icon: const Icon(
            Icons.arrow_back,
            color: AppColors.kBrandColorBlack,
          ),
        ),
        CircleAvatar(
          backgroundColor: Colors.black,
          child: IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.favorite_outline,
              color: product.inFavorites ? Colors.red : Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
