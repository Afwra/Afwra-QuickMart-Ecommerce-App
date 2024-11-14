import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quick_mart/core/utils/app_assets.dart';
import 'package:quick_mart/core/utils/app_colors.dart';
import 'package:quick_mart/core/utils/app_text_styles.dart';
import 'package:quick_mart/features/cart/presentation/views/widgets/custom_my_cart_list_view_item_image.dart';
import 'package:svg_flutter/svg.dart';

class CustomWishlistListViewItem extends StatelessWidget {
  const CustomWishlistListViewItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 140.h,
      child: Row(
        children: [
          const CustomMyCartListViewItemImage(
            imageUrl: '',
          ),
          const SizedBox(
            width: 8,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Loop Silicone Strong Magnetic Watch',
                  style: AppTextStyles.body2Medium,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(
                  height: 8,
                ),
                Text(
                  '\$15.25',
                  style: AppTextStyles.captionSemiBold,
                ),
                Text(
                  '\$15.25',
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
                    SvgPicture.asset(
                      AppAssets.trashIcon,
                      height: 24.h,
                      width: 24.w,
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
