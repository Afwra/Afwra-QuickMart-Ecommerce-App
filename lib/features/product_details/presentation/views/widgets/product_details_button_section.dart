import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:quick_mart/core/utils/app_assets.dart';
import 'package:quick_mart/core/utils/app_colors.dart';
import 'package:quick_mart/core/utils/app_routes.dart';
import 'package:quick_mart/core/utils/app_settings.dart';
import 'package:quick_mart/core/widgets/custom_button.dart';
import 'package:quick_mart/core/widgets/custom_button_with_icon.dart';
import 'package:quick_mart/features/home/data/models/product_model.dart';
import 'package:quick_mart/features/product_details/presentation/view_models/product_detail_cubit/product_detail_cubit.dart';
import 'package:quick_mart/features/product_details/presentation/view_models/product_detail_cubit/product_detail_state.dart';

class ProductDetailsButtonSection extends StatelessWidget {
  const ProductDetailsButtonSection({
    super.key,
    required this.product,
  });
  final ProductModel product;
  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<ProductDetailCubit>(context);
    return Row(
      children: [
        Expanded(
            child: CustomButton(
          text: 'Buy Now',
          textColor: AppSettings.darkMode
              ? AppColors.kBrandColorCyan
              : AppColors.kBrandColorBlack,
          color: AppSettings.darkMode
              ? AppColors.kBrandColorBlack
              : AppColors.kBrandColorWhite,
          onPressed: () {
            GoRouter.of(context).push(AppRoutes.kCheckoutView);
          },
        )),
        const SizedBox(
          width: 8,
        ),
        Expanded(child: BlocBuilder<ProductDetailCubit, ProductDetailState>(
          builder: (context, state) {
            return cubit.addToCartLoading
                ? const Center(
                    child: CircularProgressIndicator(
                    color: AppColors.kBrandColorCyan,
                  ))
                : CustomButtonWithIcon(
                    text: 'Add To Cart',
                    iconPath: AppAssets.cartIcon,
                    color: AppSettings.darkMode
                        ? AppColors.kBrandColorCyan
                        : AppColors.kBrandColorBlack,
                    onPressed: () {
                      cubit.addToCart(product.id);
                    },
                  );
          },
        )),
      ],
    );
  }
}
