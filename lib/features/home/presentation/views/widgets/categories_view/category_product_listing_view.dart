import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quick_mart/core/utils/service_locator.dart';
import 'package:quick_mart/features/home/data/models/category_model.dart';
import 'package:quick_mart/features/home/data/repos/home_repo_impl.dart';
import 'package:quick_mart/features/home/presentation/view_model/category_products_cubit/category_products_cubit.dart';
import 'package:quick_mart/features/home/presentation/view_model/home_cubit/home_cubit.dart';
import 'package:quick_mart/features/home/presentation/views/widgets/categories_view/category_product_listing_view_body.dart';

class CategoryProductListingView extends StatelessWidget {
  const CategoryProductListingView({super.key, required this.category});
  final CategoryModel category;
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => CategoryProductsCubit(getIt.get<HomeRepoImpl>())
            ..getCategoryProducts(id: category.id),
        ),
        BlocProvider(create: (context) => HomeCubit(getIt.get<HomeRepoImpl>())),
      ],
      child: Scaffold(
        body: SafeArea(
            child: CategoryProductListingViewBody(
          categoryName: category.name,
        )),
      ),
    );
  }
}
