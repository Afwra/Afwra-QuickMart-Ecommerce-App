import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quick_mart/core/utils/app_colors.dart';
import 'package:quick_mart/features/home/data/models/product_model.dart';
import 'package:quick_mart/features/product_details/presentation/view_models/product_detail_cubit/product_detail_cubit.dart';
import 'package:quick_mart/features/product_details/presentation/view_models/product_detail_cubit/product_detail_state.dart';

class CustomProductDetailFavoriteIcon extends StatelessWidget {
  const CustomProductDetailFavoriteIcon({
    super.key,
    required this.product,
  });

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<ProductDetailCubit>(context);

    return BlocBuilder<ProductDetailCubit, ProductDetailState>(
      builder: (context, state) {
        return CircleAvatar(
          backgroundColor: Colors.black,
          child: cubit.addToFavoritesLoading
              ? const CircularProgressIndicator(
                  color: AppColors.kBrandColorCyan,
                )
              : IconButton(
                  onPressed: () {
                    cubit.addOrRemoveFavorites(product.id);
                    cubit.addToFavoritesFail
                        ? null
                        : product.inFavorites = !product.inFavorites;
                  },
                  icon: Icon(
                    Icons.favorite_outline,
                    color: product.inFavorites ? Colors.red : Colors.white,
                  ),
                ),
        );
      },
    );
  }
}
