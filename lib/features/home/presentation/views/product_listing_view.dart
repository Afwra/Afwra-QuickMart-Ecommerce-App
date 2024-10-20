import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quick_mart/core/utils/service_locator.dart';
import 'package:quick_mart/features/home/data/models/category_model.dart';
import 'package:quick_mart/features/home/data/repos/home_repo_impl.dart';
import 'package:quick_mart/features/home/presentation/view_model/category_products_cubit/category_products_cubit.dart';
import 'package:quick_mart/features/home/presentation/views/widgets/product_listing_view_body.dart';

class ProductListingView extends StatelessWidget {
  const ProductListingView({super.key, required this.category});
  final CategoryModel category;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CategoryProductsCubit(getIt.get<HomeRepoImpl>())
        ..getCategoryProducts(id: category.id),
      child: Scaffold(
        body: SafeArea(
            child: ProductListingViewBody(
          categoryName: category.name,
        )),
      ),
    );
  }
}
