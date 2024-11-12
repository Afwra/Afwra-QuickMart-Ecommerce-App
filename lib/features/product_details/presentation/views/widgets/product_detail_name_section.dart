import 'package:flutter/material.dart';
import 'package:quick_mart/core/utils/app_text_styles.dart';
import 'package:quick_mart/features/home/data/models/product_model.dart';

class ProductDetailNameSection extends StatelessWidget {
  const ProductDetailNameSection({
    super.key,
    required this.product,
  });

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: Text(
            product.name,
            style: AppTextStyles.heading3Bold,
          ),
        ),
        const SizedBox(
          width: 13,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              '\$ ${product.price}',
              style: AppTextStyles.heading3Bold,
            ),
            const SizedBox(
              height: 2,
            ),
            product.oldPrice != product.price
                ? Text(
                    '\$ ${product.oldPrice}',
                    style: AppTextStyles.heading3Bold
                        .copyWith(decoration: TextDecoration.lineThrough),
                  )
                : const SizedBox(),
          ],
        )
      ],
    );
  }
}
