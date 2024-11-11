import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:quick_mart/core/utils/app_colors.dart';
import 'package:quick_mart/core/utils/app_routes.dart';
import 'package:quick_mart/core/utils/app_settings.dart';
import 'package:quick_mart/core/utils/app_text_styles.dart';
import 'package:quick_mart/features/home/presentation/view_model/search_cubit/search_cubit.dart';
import 'package:quick_mart/features/home/presentation/view_model/search_cubit/search_state.dart';
import 'package:quick_mart/features/home/presentation/views/widgets/search_view/custom_search_list_view.dart';
import 'package:quick_mart/features/home/presentation/views/widgets/search_view/custom_search_text_field.dart';
import 'package:quick_mart/features/home/presentation/views/widgets/search_view/custom_search_view_app_bar.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const CustomSearchViewAppBar(),
        const SizedBox(
          height: 16,
        ),
        CustomSearchTextField(
          darkMode: AppSettings.darkMode,
          onSubmitted: (String query) {
            BlocProvider.of<SearchCubit>(context).addSearchHistory();
            GoRouter.of(context)
                .push(AppRoutes.kSearchResultsView, extra: query);
          },
        ),
        const SizedBox(
          height: 16,
        ),
        Text(
          'Recent Search',
          style: AppTextStyles.captionSemiBold,
        ),
        const SizedBox(
          height: 4,
        ),
        BlocBuilder<SearchCubit, SearchState>(
          builder: (context, state) {
            if (state is SearchHistoryLoading) {
              return const Center(
                child: CircularProgressIndicator(
                  color: AppColors.kBrandColorCyan,
                ),
              );
            } else if (state is SearchHistorySuccess) {
              return Expanded(
                child: CustomSearchListView(
                  searchHistory: state.searchHistory,
                ),
              );
            } else {
              return const Center(
                child: Text('Failed To Get History'),
              );
            }
          },
        )
      ],
    );
  }
}
