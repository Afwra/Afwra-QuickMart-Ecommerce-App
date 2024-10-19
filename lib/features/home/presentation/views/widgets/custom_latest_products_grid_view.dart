import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quick_mart/core/widgets/custom_sliver_grid_loading_widget.dart';
import 'package:quick_mart/features/home/presentation/view_model/latest_products_cubit/latest_products_cubit.dart';
import 'package:quick_mart/features/home/presentation/view_model/latest_products_cubit/latest_products_state.dart';
import 'package:quick_mart/features/home/presentation/views/widgets/custom_products_item.dart';

class CustomLatestProductsGridView extends StatelessWidget {
  const CustomLatestProductsGridView({
    super.key,
    this.darkMode = false,
  });

  final bool darkMode;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LatestProductsCubit, LatestProductsState>(
      builder: (context, state) {
        if (state is LatestProductsFail) {
          return SliverFillRemaining(
            child: Center(
              child: Text(state.errMsg),
            ),
          );
        } else if (state is LatestProductsSuccess) {
          return SliverGrid.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 8.w,
              childAspectRatio: 0.65,
            ),
            itemBuilder: (context, index) => CustomProductsItem(
                darkMode: darkMode, product: state.products[index]),
            itemCount: state.products.length,
          );
        } else {
          return const CustomSliverGridLoadingWidget();
        }
      },
    );
  }
}
