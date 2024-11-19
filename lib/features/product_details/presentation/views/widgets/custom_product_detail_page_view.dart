import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quick_mart/core/functions/show_custom_image_dialog.dart';
import 'package:quick_mart/core/widgets/custom_image_widget.dart';
import 'package:quick_mart/features/home/data/models/product_model.dart';
import 'package:quick_mart/features/product_details/presentation/view_models/product_detail_cubit/product_detail_cubit.dart';

class CustomProductDetailPageView extends StatelessWidget {
  const CustomProductDetailPageView({
    super.key,
    required this.product,
  });

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      itemBuilder: (context, index) => InkWell(
        onTap: () =>
            showImageDialog(context: context, url: product.images[index]),
        child: CustomImageWidget(
          imageUrl: product.images[index],
          height: 290.h,
          width: double.infinity,
          boxFit: BoxFit.scaleDown,
        ),
      ),
      itemCount: product.images.length,
      controller: BlocProvider.of<ProductDetailCubit>(context).pageController,
      onPageChanged: (page) =>
          BlocProvider.of<ProductDetailCubit>(context).currentPage = page,
    );
  }
}
