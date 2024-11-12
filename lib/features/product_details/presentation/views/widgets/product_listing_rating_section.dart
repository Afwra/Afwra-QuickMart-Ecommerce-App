import 'package:flutter/material.dart';
import 'package:quick_mart/core/utils/app_text_styles.dart';

class ProductListingRatingSection extends StatelessWidget {
  const ProductListingRatingSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Wrap(
          children: List.generate(
            5,
            (index) => const Icon(
              Icons.star,
              color: Colors.yellow,
              size: 15,
            ),
          ),
        ),
        const SizedBox(
          width: 2,
        ),
        Text(
          '4.5 (2,495 reviews)',
          style: AppTextStyles.overlineSemiBold,
        )
      ],
    );
  }
}
