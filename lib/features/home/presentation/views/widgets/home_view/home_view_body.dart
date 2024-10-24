import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:quick_mart/core/utils/app_settings.dart';
import 'package:quick_mart/core/utils/app_texts.dart';
import 'package:quick_mart/features/home/presentation/views/widgets/home_view/custom_banner_page_view.dart';
import 'package:quick_mart/features/home/presentation/views/widgets/home_view/custom_home_view_app_bar.dart';
import 'package:quick_mart/features/home/presentation/views/widgets/home_view/custom_home_view_category_row.dart';
import 'package:quick_mart/features/home/presentation/views/widgets/home_view/custom_home_view_title.dart';
import 'package:quick_mart/features/home/presentation/views/widgets/custom_latest_products_grid_view.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
            child: CustomHomeViewAppBar(
          darkMode: AppSettings.darkMode,
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
            darkMode: AppSettings.darkMode,
            onPressed: () {},
          ),
        ),
        const SliverToBoxAdapter(
          child: SizedBox(
            height: 12,
          ),
        ),
        CustomHomeViewCategoryRow(darkMode: AppSettings.darkMode),
        const SliverToBoxAdapter(
          child: SizedBox(
            height: 24,
          ),
        ),
        SliverToBoxAdapter(
          child: CustomHomeViewTitle(
            title: AppTexts.latestProducts.tr(),
            darkMode: AppSettings.darkMode,
            onPressed: () {},
          ),
        ),
        const SliverToBoxAdapter(
          child: SizedBox(
            height: 12,
          ),
        ),
        CustomLatestProductsGridView(darkMode: AppSettings.darkMode),
      ],
    );
  }
}
