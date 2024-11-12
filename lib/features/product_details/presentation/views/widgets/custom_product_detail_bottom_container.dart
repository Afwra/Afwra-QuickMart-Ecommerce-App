import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quick_mart/core/utils/app_colors.dart';
import 'package:quick_mart/core/utils/app_text_styles.dart';
import 'package:quick_mart/features/home/data/models/product_model.dart';
import 'package:quick_mart/features/product_details/presentation/views/widgets/custom_expandable_text.dart';
import 'package:quick_mart/features/product_details/presentation/views/widgets/product_detail_banners.dart';
import 'package:quick_mart/features/product_details/presentation/views/widgets/product_detail_name_section.dart';
import 'package:quick_mart/features/product_details/presentation/views/widgets/product_detail_quantity_section.dart';
import 'package:quick_mart/features/product_details/presentation/views/widgets/product_details_button_section.dart';
import 'package:quick_mart/features/product_details/presentation/views/widgets/product_listing_color_section.dart';
import 'package:quick_mart/features/product_details/presentation/views/widgets/product_listing_rating_section.dart';

class CustomProductDetailBottomContainer extends StatelessWidget {
  const CustomProductDetailBottomContainer({
    super.key,
    required this.product,
  });
  final ProductModel product;
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.bottomCenter,
      height: 500.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(32.r), topRight: Radius.circular(32.r)),
        boxShadow: const [BoxShadow(blurRadius: 1, color: Colors.black)],
        color: AppColors.kBrandColorWhite,
      ),
      child: Padding(
        padding: EdgeInsets.only(top: 24.h, left: 16.w, right: 16.w),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const ProductDetailBanners(),
              const SizedBox(
                height: 6,
              ),
              ProductDetailNameSection(product: product),
              const SizedBox(
                height: 12,
              ),
              const ProductListingRatingSection(),
              const SizedBox(
                height: 12,
              ),
              CustomExpandableText(
                text: product.description,
                trimLines: 5,
              ),
              const SizedBox(
                height: 12,
              ),
              const ProductListingColorSection(),
              const SizedBox(
                height: 12,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Quantity',
                    style: AppTextStyles.heading3SemiBold,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  const ProductDetailQuantitySection(),
                  const SizedBox(
                    height: 48,
                  ),
                  const ProductDetailsButtonSection(),
                  const SizedBox(
                    height: 13,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
