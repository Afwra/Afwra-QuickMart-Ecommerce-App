import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quick_mart/core/utils/app_settings.dart';
import 'package:quick_mart/features/home/data/repos/home_repo.dart';
import 'package:quick_mart/features/home/presentation/view_model/home_cubit/home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this.homeRepo) : super(HomeInitial());
  final HomeRepo homeRepo;
  int currPage = 0;
  void changeNavigationBarIndex(int index) {
    currPage = index;
    emit(BottomNavigationBarChangeIndex());
  }

  void addToFavourites(int productId) async {
    var result = await homeRepo.addToFavorites(
        productId: productId, userToken: AppSettings.userToken!);
    result.fold((fail) => log('fail -- ${fail.errMsg}'),
        (favorites) => log('success -- favorites'));
    emit(AddOrRemoveFavoriteState());
  }
}
