import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:quick_mart/core/utils/app_assets.dart';
import 'package:quick_mart/core/utils/app_colors.dart';
import 'package:quick_mart/core/utils/app_routes.dart';
import 'package:quick_mart/core/utils/app_text_styles.dart';
import 'package:quick_mart/features/cart/data/models/cart_item_model/cart_item.dart';
import 'package:quick_mart/features/cart/presentation/view_models/cubit/my_cart_cubit.dart';
import 'package:quick_mart/features/cart/presentation/views/widgets/custom_my_cart_list_view_item_counter.dart';
import 'package:quick_mart/features/cart/presentation/views/widgets/custom_my_cart_list_view_item_image.dart';
import 'package:svg_flutter/svg.dart';

class CustomMyCartListViewItem extends StatelessWidget {
  const CustomMyCartListViewItem({
    super.key,
    required this.item,
  });
  final CartItem item;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 140.h,
      child: Row(
        children: [
          CustomMyCartListViewItemImage(
            imageUrl: item.product.image.toString(),
            onTap: () => GoRouter.of(context)
                .push(AppRoutes.kProductsDetailsView, extra: item.product),
          ),
          const SizedBox(
            width: 8,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  item.product.name.toString(),
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
                item.product.discount != 0
                    ? Text(
                        '\$${item.product.oldPrice}',
                        style: AppTextStyles.captionRegular.copyWith(
                            color: AppColors.kGrey150,
                            decoration: TextDecoration.lineThrough),
                      )
                    : const SizedBox(),
                const SizedBox(
                  height: 8,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomMyCartListViewItemCounter(
                      item: item,
                    ),
                    GestureDetector(
                      onTap: () => BlocProvider.of<MyCartCubit>(context)
                          .deleteCartItem(item.id),
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
