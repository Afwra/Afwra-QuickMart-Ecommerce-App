import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quick_mart/core/widgets/custom_image_widget.dart';
import 'package:quick_mart/features/home/data/models/product_model.dart';

class CustomProductDetailPageView extends StatelessWidget {
  const CustomProductDetailPageView({
    super.key,
    required this.product,
  });

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      itemBuilder: (context, index) => CustomImageWidget(
        imageUrl: product.images[index],
        height: 290.h,
        width: double.infinity,
        boxFit: BoxFit.scaleDown,
      ),
      itemCount: product.images.length,
    );
  }
}
