import 'package:flutter/material.dart';

import 'package:quick_mart/features/whishlist/presentation/views/widgets/wish_list_filled_view.dart';

class WishListViewBody extends StatelessWidget {
  const WishListViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    // return const WishListEmptyView();
    return const WishListFilledView();
  }
}
