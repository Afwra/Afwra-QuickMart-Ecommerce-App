import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quick_mart/core/utils/app_colors.dart';
import 'package:quick_mart/features/whishlist/presentation/view_model/wishlist_cubit/wishlist_cubit.dart';
import 'package:quick_mart/features/whishlist/presentation/views/widgets/wish_list_empty_view.dart';

import 'package:quick_mart/features/whishlist/presentation/views/widgets/wish_list_filled_view.dart';

class WishListViewBody extends StatelessWidget {
  const WishListViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<WishlistCubit>(context);
    return BlocBuilder<WishlistCubit, WishlistState>(
      builder: (context, state) {
        if (cubit.whishlistLoading) {
          return const Center(
              child: CircularProgressIndicator(
            color: AppColors.kBrandColorCyan,
          ));
        } else {
          if (cubit.wishList.isEmpty) {
            return const WishListEmptyView();
          } else {
            return const WishListFilledView();
          }
        }
      },
    );
  }
}
