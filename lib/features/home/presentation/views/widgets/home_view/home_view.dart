import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quick_mart/core/utils/service_locator.dart';
import 'package:quick_mart/features/home/data/repos/home_repo_impl.dart';
import 'package:quick_mart/features/home/presentation/view_model/banner_cubit/banner_cubit.dart';
import 'package:quick_mart/features/home/presentation/view_model/categories_cubit/categories_cubit.dart';
import 'package:quick_mart/features/home/presentation/view_model/latest_products_cubit/latest_products_cubit.dart';
import 'package:quick_mart/features/home/presentation/views/widgets/home_view/home_view_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => LatestProductsCubit(getIt.get<HomeRepoImpl>())
            ..getLatestProducts(),
        ),
        BlocProvider(
          create: (context) =>
              CategoriesCubit(homeRepo: getIt.get<HomeRepoImpl>())
                ..getCategories(),
        ),
        BlocProvider(
          create: (context) =>
              BannerCubit(homeRepo: getIt.get<HomeRepoImpl>())..getBanner(),
        ),
      ],
      child: const Scaffold(
        body: HomeViewBody(),
      ),
    );
  }
}
