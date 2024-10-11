import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quick_mart/core/utils/app_colors.dart';
import 'package:quick_mart/core/utils/app_text_styles.dart';
import 'package:quick_mart/core/widgets/custom_image_widget.dart';
import 'package:quick_mart/features/home/data/models/products_model/products_model.dart';

class CustomProductsItem extends StatelessWidget {
  const CustomProductsItem({
    super.key,
    this.darkMode = false,
    required this.product,
  });
  final bool darkMode;
  final ProductsModel product;
  @override
  Widget build(BuildContext context) {
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
                right: 6.w,
                child: const CircleAvatar(
                  backgroundColor: Colors.black,
                  child: Icon(
                    Icons.favorite_border_outlined,
                    color: Colors.white,
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
                    left: 20,
                    child: CircleAvatar(
                      radius: 12.r,
                      backgroundColor: Colors.blue,
                    ),
                  ),
                  Positioned(
                    left: 40,
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
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            product.title,
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
            '\$126.00',
            style: AppTextStyles.captionRegular
                .copyWith(color: AppColors.kGrey100),
          ),
        ],
      ),
    );
  }
}
