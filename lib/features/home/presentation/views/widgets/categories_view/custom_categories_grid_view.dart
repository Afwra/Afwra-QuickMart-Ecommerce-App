import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:quick_mart/core/utils/app_colors.dart';
import 'package:quick_mart/core/utils/app_routes.dart';
import 'package:quick_mart/core/utils/app_settings.dart';
import 'package:quick_mart/core/utils/app_text_styles.dart';
import 'package:quick_mart/features/home/data/models/category_model.dart';
import 'package:quick_mart/features/home/presentation/views/widgets/categories_view/custom_category_item.dart';

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
          title: category[index].name.toUpperCase(),
          textStyle: AppTextStyles.captionSemiBold.copyWith(
            color: AppSettings.darkMode
                ? Colors.white
                : AppColors.kBrandColorBlack,
          ),
          imageUrl: category[index].image,
          containerHeight: 100.h,
          containerWidth: 160.w,
          imageHeight: 40.h,
          imageWidth: 30.w,
          boxFit: BoxFit.scaleDown,
          isDarkMode: AppSettings.darkMode,
        ),
      ),
    );
  }
}
