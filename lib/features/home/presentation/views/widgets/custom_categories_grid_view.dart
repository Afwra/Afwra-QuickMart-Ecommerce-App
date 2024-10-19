import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:quick_mart/core/utils/app_routes.dart';
import 'package:quick_mart/core/utils/app_text_styles.dart';
import 'package:quick_mart/features/home/data/models/category_model.dart';
import 'package:quick_mart/features/home/presentation/view_model/home_cubit/home_cubit.dart';
import 'package:quick_mart/features/home/presentation/views/widgets/custom_category_item.dart';

class CustomCategoriesGridView extends StatelessWidget {
  const CustomCategoriesGridView({
    super.key,
    required this.category,
  });
  final List<CategoryModel> category;
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 8.w,
        mainAxisSpacing: 8.h,
      ),
      itemCount: category.length,
      itemBuilder: (context, index) => GestureDetector(
        onTap: () {
          GoRouter.of(context)
              .push(AppRoutes.kProductsListingView, extra: category[index]);
        },
        child: CustomCategoryItem(
          title: category[index].name,
          textStyle: AppTextStyles.captionSemiBold,
          imageUrl: category[index].image,
          containerHeight: 100.h,
          containerWidth: 160.w,
          imageHeight: 40.h,
          imageWidth: 30.w,
          boxFit: BoxFit.scaleDown,
          isDarkMode: BlocProvider.of<HomeCubit>(context).isDarkMode,
        ),
      ),
    );
  }
}
