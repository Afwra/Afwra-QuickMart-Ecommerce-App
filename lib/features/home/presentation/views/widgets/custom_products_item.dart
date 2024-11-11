import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quick_mart/core/functions/hive_functions.dart';
import 'package:quick_mart/core/utils/app_colors.dart';
import 'package:quick_mart/core/utils/app_text_styles.dart';
import 'package:quick_mart/core/widgets/custom_image_widget.dart';
import 'package:quick_mart/features/home/data/models/product_model.dart';
import 'package:quick_mart/features/home/presentation/view_model/home_cubit/home_cubit.dart';
import 'package:quick_mart/features/home/presentation/view_model/home_cubit/home_state.dart';

class CustomProductsItem extends StatelessWidget {
  const CustomProductsItem({
    super.key,
    this.darkMode = false,
    required this.product,
  });
  final bool darkMode;
  final ProductModel product;
  @override
  Widget build(BuildContext context) {
    var langCode = getLanguageCode();
    return SizedBox(
      width: 160.w,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(24.r),
                child: CustomImageWidget(
                  imageUrl: product.image.toString(),
                  boxFit: BoxFit.scaleDown,
                  height: 138.h,
                  width: 160.w,
                ),
              ),
              Positioned(
                top: 6.h,
                right: langCode == 'ar' ? null : 6.w,
                left: langCode == 'ar' ? 6.w : null,
                child: CircleAvatar(
                  backgroundColor: Colors.black,
                  child: BlocBuilder<HomeCubit, HomeState>(
                    builder: (context, state) {
                      return IconButton(
                        onPressed: () {
                          BlocProvider.of<HomeCubit>(context)
                              .addToFavourites(product.id);
                          product.inFavorites = !product.inFavorites;
                        },
                        icon: const Icon(Icons.favorite_border_outlined),
                        color: product.inFavorites ? Colors.red : Colors.white,
                      );
                    },
                  ),
                ),
              )
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Stack(
                clipBehavior: Clip.none,
                children: [
                  CircleAvatar(
                    radius: 12.r,
                    backgroundColor: Colors.red,
                  ),
                  Positioned(
                    left: langCode == 'ar' ? null : 20,
                    right: langCode == 'ar' ? 20 : null,
                    child: CircleAvatar(
                      radius: 12.r,
                      backgroundColor: Colors.blue,
                    ),
                  ),
                  Positioned(
                    left: langCode == 'ar' ? null : 40,
                    right: langCode == 'ar' ? 40 : null,
                    child: CircleAvatar(
                      radius: 12.r,
                      backgroundColor: Colors.green,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                width: 8,
              ),
              Text(
                'All 5 Colors',
                style: AppTextStyles.captionRegular.copyWith(
                  color: darkMode ? Colors.white : AppColors.kBrandColorBlack,
                  decoration: TextDecoration.underline,
                  decorationColor:
                      darkMode ? Colors.white : AppColors.kBrandColorBlack,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            product.name,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: AppTextStyles.body2Medium.copyWith(
              color: darkMode ? Colors.white : AppColors.kBrandColorBlack,
            ),
          ),
          Text(
            '\$${product.price}',
            style: AppTextStyles.captionSemiBold.copyWith(
              color: darkMode ? Colors.white : AppColors.kBrandColorBlack,
            ),
          ),
          Text(
            product.oldPrice == product.price ? '' : '\$${product.oldPrice}',
            style: AppTextStyles.captionRegular.copyWith(
                color: AppColors.kGrey100,
                decoration: TextDecoration.lineThrough),
          ),
        ],
      ),
    );
  }
}
