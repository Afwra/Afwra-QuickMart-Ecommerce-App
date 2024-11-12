import 'package:flutter/material.dart';
import 'package:quick_mart/core/utils/app_colors.dart';
import 'package:quick_mart/core/utils/app_text_styles.dart';

class ProductDetailQuantitySection extends StatelessWidget {
  const ProductDetailQuantitySection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.remove),
        ),
        const SizedBox(
          width: 8,
        ),
        Text(
          '1',
          style: AppTextStyles.body1Medium,
        ),
        const SizedBox(
          width: 8,
        ),
        IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.add,
              color: AppColors.kBrandColorBlack,
            )),
      ],
    );
  }
}
