import 'package:flutter/material.dart';
import 'package:quick_mart/core/utils/app_text_styles.dart';
import 'package:quick_mart/features/whishlist/presentation/views/widgets/custom_wishlist_list_view_item.dart';

class WishListFilledView extends StatelessWidget {
  const WishListFilledView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Wishlist',
          style: AppTextStyles.body2Medium,
        ),
        const SizedBox(
          height: 30,
        ),
        Expanded(
          child: ListView.builder(
            itemBuilder: (context, index) => const Padding(
              padding: EdgeInsets.only(bottom: 15),
              child: CustomWishlistListViewItem(),
            ),
            itemCount: 5,
          ),
        ),
      ],
    );
  }
}
