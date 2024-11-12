import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quick_mart/core/functions/hive_functions.dart';
import 'package:quick_mart/features/home/data/repos/home_repo.dart';
import 'package:quick_mart/features/home/presentation/view_model/latest_products_cubit/latest_products_state.dart';

class LatestProductsCubit extends Cubit<LatestProductsState> {
  LatestProductsCubit(this.homeRepo) : super(LatestProductsInitial());

  HomeRepo homeRepo;
  StreamSubscription?
      subscription; //object to listen to the stream and be able to close it when the cubit is closed to prevent emitting new states when cubit is closed
  void getLatestProducts() async {
    emit(LatestProductsLoading());
    String userToken = getLoginToken().toString();
    String lang = getLanguageCode();

    // close any request if there is one
    await subscription?.cancel();

    subscription = homeRepo
        .getLatestProducts(lang: lang, userToken: userToken)
        .asStream()
        .listen(
      (result) {
        result.fold((fail) => emit(LatestProductsFail(errMsg: fail.errMsg)),
            (products) => emit(LatestProductsSuccess(products: products)));
      },
      onError: (e) => emit(LatestProductsFail(errMsg: e.toString())),
    );
  }

  @override
  Future<void> close() {
    subscription?.cancel();
    return super.close();
  }
}
