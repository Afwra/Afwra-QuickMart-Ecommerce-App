import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quick_mart/core/utils/app_assets.dart';
import 'package:quick_mart/core/utils/app_colors.dart';
import 'package:quick_mart/core/utils/app_text_styles.dart';
import 'package:quick_mart/features/cart/presentation/views/widgets/custom_my_cart_list_view_item_image.dart';
import 'package:quick_mart/features/whishlist/data/models/wishlist_model/wishlist_model.dart';
import 'package:quick_mart/features/whishlist/presentation/view_model/wishlist_cubit/wishlist_cubit.dart';
import 'package:svg_flutter/svg.dart';

class CustomWishlistListViewItem extends StatelessWidget {
  const CustomWishlistListViewItem({
    super.key,
    required this.item,
  });
  final WishlistModel item;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 140.h,
      child: Row(
        children: [
          CustomMyCartListViewItemImage(
            imageUrl: item.product.image,
          ),
          const SizedBox(
            width: 8,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.product.name,
                  style: AppTextStyles.body2Medium,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(
                  height: 8,
                ),
                Text(
                  '\$${item.product.price}',
                  style: AppTextStyles.captionSemiBold,
                ),
                item.product.price == item.product.oldPrice
                    ? const SizedBox()
                    : Text(
                        '\$${item.product.oldPrice}',
                        style: AppTextStyles.captionRegular.copyWith(
                            color: AppColors.kGrey150,
                            decoration: TextDecoration.lineThrough),
                      ),
                const SizedBox(
                  height: 8,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    InkWell(
                      onTap: () {
                        BlocProvider.of<WishlistCubit>(context)
                            .deleteWishList(wishlistId: item.id);
                      },
                      child: SvgPicture.asset(
                        AppAssets.trashIcon,
                        height: 24.h,
                        width: 24.w,
                      ),
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
