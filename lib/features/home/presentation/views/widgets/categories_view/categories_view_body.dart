import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quick_mart/core/utils/app_colors.dart';
import 'package:quick_mart/core/utils/app_text_styles.dart';
import 'package:quick_mart/core/widgets/custom_grid_loading_widget.dart';
import 'package:quick_mart/features/home/data/models/category_model.dart';
import 'package:quick_mart/features/home/presentation/view_model/categories_cubit/categories_cubit.dart';
import 'package:quick_mart/features/home/presentation/view_model/categories_cubit/categories_state.dart';
import 'package:quick_mart/features/home/presentation/views/widgets/categories_view/custom_categories_grid_view.dart';

class CategoriesViewBody extends StatelessWidget {
  const CategoriesViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoriesCubit, CategoriesState>(
      builder: (context, state) {
        if (state is CategoriesSuccess) {
          return CategoriesViewSuccessView(
            categories: state.categories,
          );
        } else if (state is CategoriesError) {
          return Center(child: Text(state.errMsg));
        } else {
          return const CustomGridLoadingWidget();
        }
      },
    );
  }
}

class CategoriesViewSuccessView extends StatelessWidget {
  const CategoriesViewSuccessView({
    super.key,
    required this.categories,
  });
  final List<CategoryModel> categories;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Categories',
          style: AppTextStyles.body2Medium,
        ),
        const SizedBox(
          height: 17.5,
        ),
        const Divider(
          thickness: 2,
          color: AppColors.kGrey50,
        ),
        const SizedBox(
          height: 12,
        ),
        Expanded(
          child: CustomCategoriesGridView(
            category: categories,
          ),
        ),
      ],
    );
  }
}
