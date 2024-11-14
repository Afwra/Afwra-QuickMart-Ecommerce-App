import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quick_mart/core/utils/service_locator.dart';
import 'package:quick_mart/features/home/data/models/product_model.dart';
import 'package:quick_mart/features/product_details/data/repos/product_detail_repo_impl.dart';
import 'package:quick_mart/features/product_details/presentation/view_models/product_detail_cubit/product_detail_cubit.dart';
import 'package:quick_mart/features/product_details/presentation/views/widgets/product_detail_view_body.dart';

class ProductDetailView extends StatelessWidget {
  const ProductDetailView({super.key, required this.product});
  final ProductModel product;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          ProductDetailCubit(getIt.get<ProductDetailRepoImpl>()),
      child: Scaffold(
        body: SafeArea(
          child: ProductDetailViewBody(product: product),
        ),
      ),
    );
  }
}
