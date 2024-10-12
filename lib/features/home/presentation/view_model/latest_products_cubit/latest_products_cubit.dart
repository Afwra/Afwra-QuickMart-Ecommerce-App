import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quick_mart/core/functions/hive_functions.dart';
import 'package:quick_mart/features/home/data/repos/home_repo.dart';
import 'package:quick_mart/features/home/presentation/view_model/latest_products_cubit/latest_products_state.dart';

class LatestProductsCubit extends Cubit<LatestProductsState> {
  LatestProductsCubit(this.homeRepo) : super(LatestProductsInitial());

  HomeRepo homeRepo;
  void getLatestProducts() async {
    emit(LatestProductsLoading());
    String userToken = getLoginToken().toString();
    String lang = getLanguageCode();
    final result =
        await homeRepo.getLatestProducts(lang: lang, userToken: userToken);
    result.fold((fail) => emit(LatestProductsFail(errMsg: fail.errMsg)),
        (products) => emit(LatestProductsSuccess(products: products)));
  }
}
