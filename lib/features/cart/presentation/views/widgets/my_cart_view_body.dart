import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quick_mart/core/utils/app_colors.dart';
import 'package:quick_mart/features/cart/presentation/view_models/cubit/my_cart_cubit.dart';
import 'package:quick_mart/features/cart/presentation/view_models/cubit/my_cart_state.dart';
import 'package:quick_mart/features/cart/presentation/views/widgets/custom_empty_cart_widget.dart';

import 'package:quick_mart/features/cart/presentation/views/widgets/custom_filled_cart_widget.dart';

class MyCartViewBody extends StatelessWidget {
  const MyCartViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    // return const CustomEmptyCartWidget();
    return BlocBuilder<MyCartCubit, MyCartState>(
      builder: (context, state) {
        if (state is MyCartSuccess) {
          if (state.cartItems.cartItems.isEmpty) {
            return const CustomEmptyCartWidget();
          } else {
            return CustomFilledCartWidget(
              item: state.cartItems,
            );
          }
        } else if (state is MyCartFail) {
          return Center(child: Text(state.message));
        } else {
          return const Center(
            child: CircularProgressIndicator(
              color: AppColors.kBrandColorCyan,
            ),
          );
        }
      },
    );
  }
}
