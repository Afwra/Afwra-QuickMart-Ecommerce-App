import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quick_mart/features/home/presentation/view_model/categories_cubit/categories_cubit.dart';
import 'package:quick_mart/features/home/presentation/view_model/categories_cubit/categories_state.dart';
import 'package:quick_mart/features/home/presentation/views/widgets/custom_category_item.dart';
import 'package:skeletonizer/skeletonizer.dart';

class CustomHomeViewCategoryRow extends StatelessWidget {
  const CustomHomeViewCategoryRow({super.key, this.darkMode = false});

  final bool darkMode;

  @override
  Widget build(BuildContext context) {
    CategoriesCubit cubit = BlocProvider.of<CategoriesCubit>(context);
    return SliverToBoxAdapter(
      child: BlocBuilder<CategoriesCubit, CategoriesState>(
        builder: (context, state) {
          if (state is CategoriesError) {
            return Center(
              child: Text(
                state.errMsg,
              ),
            );
          }
          return Skeletonizer(
            enabled: cubit.isLoading,
            child: Row(
              children: List.generate(
                4,
                (index) => Padding(
                  padding: EdgeInsets.only(right: index == 4 ? 0 : 8),
                  child: CustomCategoryItem(
                    containerHeight: 70.h,
                    containerWidth: 75.w,
                    title: cubit.categories[index].name,
                    imageUrl: cubit.categories[index].image,
                    imageHeight: 20.h,
                    imageWidth: 20.w,
                    isDarkMode: darkMode,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
