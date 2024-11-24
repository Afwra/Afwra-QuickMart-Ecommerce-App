import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:quick_mart/core/functions/flutter_toast.dart';
import 'package:quick_mart/core/functions/hive_functions.dart';
import 'package:quick_mart/core/utils/app_colors.dart';
import 'package:quick_mart/core/utils/app_routes.dart';
import 'package:quick_mart/core/utils/app_settings.dart';
import 'package:quick_mart/features/auth/data/models/user_model.dart';
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

  void changeThemeMode() {
    AppSettings.darkMode = !AppSettings.darkMode;
    saveDarkMode(AppSettings.darkMode);
    emit(ChangeThemeMode());
  }

  void addToFavourites(int productId) async {
    var result = await homeRepo.addToFavorites(
        productId: productId, userToken: AppSettings.userToken!);
    result.fold((fail) => log('fail -- ${fail.errMsg}'), (favorites) {
      log('success -- favorites');
      showFlutterToast(
          msg: 'Added/Removed favorites successfully',
          backGroundColor: AppColors.kBrandColorCyan);
    });
    emit(AddOrRemoveFavoriteState());
  }

  bool userLoaded = false;
  UserModel? userModel;
  void getUserProfilePicture() async {
    userLoaded = false;
    var result = await homeRepo.getUserProfilePicture();
    result.fold((fail) => log('fail -- ${fail.errMsg}'), (user) {
      userModel = user;
      userLoaded = true;
      emit(UserLoaded());
    });
  }

  void logout(BuildContext context) {
    deleteLoginToken();
    GoRouter.of(context).go(AppRoutes.kLoginView);
    emit(UserLoggedOut());
  }
}
