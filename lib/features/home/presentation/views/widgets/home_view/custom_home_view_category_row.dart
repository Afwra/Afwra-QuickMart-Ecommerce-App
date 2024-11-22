import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:quick_mart/core/utils/app_routes.dart';
import 'package:quick_mart/core/widgets/custom_home_category_loading_widget.dart';
import 'package:quick_mart/features/home/presentation/view_model/categories_cubit/categories_cubit.dart';
import 'package:quick_mart/features/home/presentation/view_model/categories_cubit/categories_state.dart';
import 'package:quick_mart/features/home/presentation/views/widgets/categories_view/custom_category_item.dart';

class CustomHomeViewCategoryRow extends StatelessWidget {
  const CustomHomeViewCategoryRow({super.key, this.darkMode = false});

  final bool darkMode;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: BlocBuilder<CategoriesCubit, CategoriesState>(
        builder: (context, state) {
          if (state is CategoriesSuccess) {
            return Row(
              children: List.generate(
                4,
                (index) => Padding(
                  padding: EdgeInsets.only(right: index == 4 ? 0 : 8),
                  child: CustomCategoryItem(
                    onTap: () => GoRouter.of(context).push(
                        AppRoutes.kProductsListingView,
                        extra: state.categories[index]),
                    containerHeight: 70.h,
                    containerWidth: 75.w,
                    title: state.categories[index].name,
                    imageUrl: state.categories[index].image,
                    imageHeight: 20.h,
                    imageWidth: 20.w,
                    isDarkMode: darkMode,
                  ),
                ),
              ),
            );
          } else if (state is CategoriesError) {
            return Center(
              child: Text(
                state.errMsg,
              ),
            );
          } else {
            return const CustomHomeCategoryLoadingWidget();
          }
        },
      ),
    );
  }
}
