import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quick_mart/core/widgets/custom_grid_loading_widget.dart';
import 'package:quick_mart/features/home/presentation/view_model/search_result_cubit/search_result_cubit.dart';
import 'package:quick_mart/features/home/presentation/view_model/search_result_cubit/search_result_state.dart';
import 'package:quick_mart/features/home/presentation/views/widgets/custom_products_listing_app_bar.dart';
import 'package:quick_mart/features/home/presentation/views/widgets/custom_products_success_grid_view.dart';

class SearchResultViewBody extends StatelessWidget {
  const SearchResultViewBody({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomProductListingAppBar(title: title),
        const SizedBox(
          height: 12,
        ),
        BlocBuilder<SearchResultCubit, SearchResultState>(
          builder: (context, state) {
            if (state is SearchResultLoading) {
              return const Expanded(child: CustomGridLoadingWidget());
            } else if (state is SearchResultSuccess) {
              return Expanded(
                child: CustomProductsListingSuccessGridView(
                    products: state.products),
              );
            } else {
              String errMsg = (state as SearchResultFail).errMsg;
              return Center(child: Text(errMsg));
            }
          },
        )
      ],
    );
  }
}
