import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quick_mart/core/utils/app_colors.dart';
import 'package:quick_mart/core/utils/app_text_styles.dart';
import 'package:quick_mart/features/product_details/presentation/view_models/product_detail_cubit/product_detail_cubit.dart';
import 'package:quick_mart/features/product_details/presentation/view_models/product_detail_cubit/product_detail_state.dart';

class ProductDetailQuantitySection extends StatelessWidget {
  const ProductDetailQuantitySection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<ProductDetailCubit>(context);
    return Row(
      children: [
        IconButton(
          onPressed: () {
            cubit.decrementQuantity();
          },
          icon: const Icon(Icons.remove),
        ),
        const SizedBox(
          width: 8,
        ),
        BlocBuilder<ProductDetailCubit, ProductDetailState>(
          builder: (context, state) {
            return Text(
              cubit.quantity.toString(),
              style: AppTextStyles.body1Medium,
            );
          },
        ),
        const SizedBox(
          width: 8,
        ),
        IconButton(
            onPressed: () {
              cubit.incrementQuantity();
            },
            icon: const Icon(
              Icons.add,
              color: AppColors.kBrandColorBlack,
            )),
      ],
    );
  }
}
