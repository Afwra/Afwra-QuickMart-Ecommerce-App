import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quick_mart/features/home/presentation/view_model/home_cubit/home_cubit.dart';
import 'package:quick_mart/features/home/presentation/views/widgets/custom_banner_item.dart';
import 'package:quick_mart/features/home/presentation/views/widgets/custom_category_item.dart';
import 'package:quick_mart/features/home/presentation/views/widgets/custom_home_view_app_bar.dart';
import 'package:quick_mart/features/home/presentation/views/widgets/custom_home_view_title.dart';
import 'package:quick_mart/features/home/presentation/views/widgets/custom_products_item.dart';

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
        const SliverToBoxAdapter(child: CustomBannerItem()),
        const SliverToBoxAdapter(
          child: SizedBox(
            height: 24,
          ),
        ),
        SliverToBoxAdapter(
          child: CustomHomeViewTitle(
            title: 'Categories',
            darkMode: cubit.isDarkMode,
            onPressed: () {},
          ),
        ),
        const SliverToBoxAdapter(
          child: SizedBox(
            height: 12,
          ),
        ),
        SliverToBoxAdapter(
          child: Row(
            children: List.generate(
              4,
              (index) => Padding(
                padding: EdgeInsets.only(right: index == 4 ? 0 : 8),
                child: CustomCategoryItem(
                  containerHeight: 70.h,
                  containerWidth: 75.w,
                  title: 'Shoes',
                  imageUrl: 'assets/images/shoes.png',
                  imageHeight: 20.h,
                  imageWidth: 20.w,
                  isDarkMode: cubit.isDarkMode,
                ),
              ),
            ),
          ),
        ),
        const SliverToBoxAdapter(
          child: SizedBox(
            height: 24,
          ),
        ),
        SliverToBoxAdapter(
          child: CustomHomeViewTitle(
            title: 'Latest Products',
            darkMode: cubit.isDarkMode,
            onPressed: () {},
          ),
        ),
        const SliverToBoxAdapter(
          child: SizedBox(
            height: 12,
          ),
        ),
        SliverGrid.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 8.w,
            childAspectRatio: 0.65,
          ),
          itemBuilder: (context, index) => CustomProductsItem(
            darkMode: cubit.isDarkMode,
          ),
          itemCount: 4,
        ),
      ],
    );
  }
}
