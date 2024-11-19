import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quick_mart/core/utils/app_colors.dart';
import 'package:quick_mart/core/utils/app_settings.dart';
import 'package:quick_mart/core/utils/app_text_styles.dart';
import 'package:quick_mart/features/cart/presentation/views/widgets/custom_my_cart_list_view_item_image.dart';

class FilledOrderItemInfoSection extends StatelessWidget {
  const FilledOrderItemInfoSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 140.h,
      child: Row(
        children: [
          const CustomMyCartListViewItemImage(
            imageUrl: 'https://tinyurl.com/4rv6ucvx',
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
                  'Product Name',
                  style: AppTextStyles.body2Medium.copyWith(
                    color: AppSettings.darkMode
                        ? Colors.white
                        : AppColors.kBrandColorBlack,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(
                  height: 8,
                ),
                Text(
                  'Product Price',
                  style: AppTextStyles.captionSemiBold.copyWith(
                    color: AppSettings.darkMode
                        ? Colors.white
                        : AppColors.kBrandColorBlack,
                  ),
                ),
                // item.product.discount != 0
                //     ? Text(
                //         '\$${item.product.oldPrice}',
                //         style: AppTextStyles.captionRegular.copyWith(
                //             color: AppColors.kGrey150,
                //             decoration: TextDecoration.lineThrough),
                //       )
                //     : const SizedBox(),
                const SizedBox(
                  height: 8,
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.r),
                    border: Border.all(color: AppColors.kGrey50),
                  ),
                  padding: const EdgeInsets.all(4),
                  height: 32.h,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.remove,
                        color: AppSettings.darkMode
                            ? Colors.white
                            : AppColors.kBrandColorBlack,
                        size: 20,
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Text(
                        '1',
                        style: AppTextStyles.body1Medium.copyWith(
                            color: AppSettings.darkMode
                                ? Colors.white
                                : AppColors.kBrandColorBlack),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Icon(
                        Icons.add,
                        color: AppSettings.darkMode
                            ? Colors.white
                            : AppColors.kBrandColorBlack,
                        size: 20,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
