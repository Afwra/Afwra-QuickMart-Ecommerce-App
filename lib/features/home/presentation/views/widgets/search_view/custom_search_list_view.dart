import 'package:flutter/material.dart';
import 'package:quick_mart/features/home/presentation/views/widgets/search_view/search_list_view_item.dart';

class CustomSearchListView extends StatelessWidget {
  const CustomSearchListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) => const SearchListViewItem(),
      itemCount: 10,
    );
  }
}
