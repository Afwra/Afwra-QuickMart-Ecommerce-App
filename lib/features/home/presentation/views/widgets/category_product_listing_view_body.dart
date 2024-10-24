import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quick_mart/core/functions/show_custom_bottom_model_sheet.dart';
import 'package:quick_mart/core/utils/app_constants.dart';
import 'package:quick_mart/core/widgets/custom_grid_loading_widget.dart';
import 'package:quick_mart/features/home/presentation/view_model/category_products_cubit/category_products_cubit.dart';
import 'package:quick_mart/features/home/presentation/view_model/category_products_cubit/category_products_state.dart';
import 'package:quick_mart/features/home/presentation/views/widgets/custom_products_listing_app_bar.dart';
import 'package:quick_mart/features/home/presentation/views/widgets/custom_products_success_grid_view.dart';

class CategoryProductListingViewBody extends StatelessWidget {
  const CategoryProductListingViewBody({super.key, required this.categoryName});
  final String categoryName;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: 16.w, horizontal: 12.h),
          child: CustomProductListingAppBar(
            title: categoryName,
            onTap: () {
              showCustomFilterBottomSheet(
                context,
                onPressed: () => BlocProvider.of<CategoryProductsCubit>(context)
                    .filterProducts(context, AppConstants.filterList),
              );
            },
          ),
        ),
        const SizedBox(
          height: 24,
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: BlocBuilder<CategoryProductsCubit, CategoryProductsState>(
              builder: (context, state) {
                if (state is CategoryProductsFail) {
                  return Center(
                    child: Text(state.errMsg),
                  );
                } else if (state is CategoryProductsSuccess) {
                  return CustomProductsListingSuccessGridView(
                    products: state.products,
                  );
                } else {
                  return const CustomGridLoadingWidget();
                }
              },
            ),
          ),
        ),
      ],
    );
  }
}
