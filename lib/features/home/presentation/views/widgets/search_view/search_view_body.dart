import 'package:flutter/material.dart';
import 'package:quick_mart/core/utils/app_settings.dart';
import 'package:quick_mart/core/utils/app_text_styles.dart';
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
        const Expanded(
          child: CustomSearchListView(),
        )
      ],
    );
  }
}
