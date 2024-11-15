import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quick_mart/core/utils/service_locator.dart';
import 'package:quick_mart/features/whishlist/data/repo/wishlist_repo.dart';
import 'package:quick_mart/features/whishlist/presentation/view_model/wishlist_cubit/wishlist_cubit.dart';
import 'package:quick_mart/features/whishlist/presentation/views/widgets/wish_list_view_body.dart';

class WishListView extends StatelessWidget {
  const WishListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          WishlistCubit(wishlistRepo: getIt.get<WishlistRepo>())..getWishList(),
      child: const WishListViewBody(),
    );
  }
}
