import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:quick_mart/core/utils/app_routes.dart';
import 'package:quick_mart/features/home/presentation/views/widgets/search_view/search_list_view_item.dart';

class CustomSearchListView extends StatelessWidget {
  const CustomSearchListView({
    super.key,
    required this.searchHistory,
  });
  final List<String> searchHistory;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) => SearchListViewItem(
        query: searchHistory[index],
        onTap: () {
          GoRouter.of(context)
              .push(AppRoutes.kSearchResultsView, extra: searchHistory[index]);
        },
      ),
      itemCount: searchHistory.length,
    );
  }
}
