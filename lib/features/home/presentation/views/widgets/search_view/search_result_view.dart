import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quick_mart/core/utils/service_locator.dart';
import 'package:quick_mart/features/home/data/repos/home_repo_impl.dart';
import 'package:quick_mart/features/home/presentation/view_model/search_result_cubit/search_result_cubit.dart';
import 'package:quick_mart/features/home/presentation/views/widgets/search_view/search_result_view_body.dart';

class SearchResultView extends StatelessWidget {
  const SearchResultView({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          SearchResultCubit(getIt.get<HomeRepoImpl>())..getSearchResults(title),
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
            child: SearchResultViewBody(
              title: title,
            ),
          ),
        ),
      ),
    );
  }
}
