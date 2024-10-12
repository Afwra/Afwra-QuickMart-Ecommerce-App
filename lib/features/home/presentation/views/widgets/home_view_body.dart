import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quick_mart/core/utils/app_texts.dart';
import 'package:quick_mart/features/home/presentation/view_model/home_cubit/home_cubit.dart';
import 'package:quick_mart/features/home/presentation/views/widgets/custom_banner_page_view.dart';
import 'package:quick_mart/features/home/presentation/views/widgets/custom_home_view_app_bar.dart';
import 'package:quick_mart/features/home/presentation/views/widgets/custom_home_view_category_row.dart';
import 'package:quick_mart/features/home/presentation/views/widgets/custom_home_view_title.dart';
import 'package:quick_mart/features/home/presentation/views/widgets/custom_latest_products_grid_view.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    HomeCubit cubit = BlocProvider.of<HomeCubit>(context);
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
            child: CustomHomeViewAppBar(
          darkMode: cubit.isDarkMode,
        )),
        const SliverToBoxAdapter(
          child: SizedBox(
            height: 24,
          ),
        ),
        const SliverToBoxAdapter(child: CustomBannerPageView()),
        const SliverToBoxAdapter(
          child: SizedBox(
            height: 24,
          ),
        ),
        SliverToBoxAdapter(
          child: CustomHomeViewTitle(
            title: AppTexts.categories.tr(),
            darkMode: cubit.isDarkMode,
            onPressed: () {},
          ),
        ),
        const SliverToBoxAdapter(
          child: SizedBox(
            height: 12,
          ),
        ),
        CustomHomeViewCategoryRow(darkMode: cubit.isDarkMode),
        const SliverToBoxAdapter(
          child: SizedBox(
            height: 24,
          ),
        ),
        SliverToBoxAdapter(
          child: CustomHomeViewTitle(
            title: AppTexts.latestProducts.tr(),
            darkMode: cubit.isDarkMode,
            onPressed: () {},
          ),
        ),
        const SliverToBoxAdapter(
          child: SizedBox(
            height: 12,
          ),
        ),
        CustomLatestProductsGridView(darkMode: cubit.isDarkMode),
      ],
    );
  }
}
