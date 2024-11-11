import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:quick_mart/core/functions/hive_functions.dart';
import 'package:quick_mart/core/utils/app_constants.dart';
import 'package:quick_mart/features/home/presentation/view_model/search_cubit/search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(SearchHistoryLoading());

  final TextEditingController searchController = TextEditingController();

  void initSearchCubit() async {
    await Hive.openBox<List<String>>(AppConstants.historyBox);
    loadSearchHistory();
  }

  void loadSearchHistory() {
    emit(SearchHistoryLoading());
    try {
      List<String> searchHistory = getSearchHistory();
      emit(SearchHistorySuccess(searchHistory: searchHistory));
    } catch (e) {
      debugPrint(e.toString());
      emit(SearchHistoryFail(errMsg: e.toString()));
    }
  }

  void addSearchHistory() {
    if (searchController.text.isNotEmpty) {
      saveSearchHistory(searchController.text);
    }
  }
}
