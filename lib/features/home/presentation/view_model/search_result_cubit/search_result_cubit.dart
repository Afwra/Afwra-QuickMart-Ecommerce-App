import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quick_mart/core/utils/app_settings.dart';
import 'package:quick_mart/features/home/data/repos/home_repo.dart';
import 'package:quick_mart/features/home/presentation/view_model/search_result_cubit/search_result_state.dart';

class SearchResultCubit extends Cubit<SearchResultState> {
  SearchResultCubit(this.homeRepo) : super(SearchResultLoading());

  final HomeRepo homeRepo;

  void getSearchResults(String query) async {
    final result = await homeRepo.getSearchProducts(
        query: query, userToken: AppSettings.userToken!);
    result.fold((fail) => emit(SearchResultFail(errMsg: fail.errMsg)),
        (products) => emit(SearchResultSuccess(products: products)));
  }
}
