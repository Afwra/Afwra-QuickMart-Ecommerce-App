import 'package:flutter/material.dart';
import 'package:quick_mart/core/utils/app_assets.dart';
import 'package:quick_mart/core/utils/app_colors.dart';
import 'package:quick_mart/core/widgets/custom_button.dart';
import 'package:quick_mart/core/widgets/custom_button_with_icon.dart';

class ProductDetailsButtonSection extends StatelessWidget {
  const ProductDetailsButtonSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            child: CustomButton(
          text: 'Buy Now',
          textColor: AppColors.kBrandColorBlack,
          color: AppColors.kBrandColorWhite,
          onPressed: () {},
        )),
        const SizedBox(
          width: 8,
        ),
        Expanded(
            child: CustomButtonWithIcon(
          text: 'Add To Cart',
          iconPath: AppAssets.cartIcon,
          color: AppColors.kBrandColorBlack,
          onPressed: () {},
        )),
      ],
    );
  }
}
