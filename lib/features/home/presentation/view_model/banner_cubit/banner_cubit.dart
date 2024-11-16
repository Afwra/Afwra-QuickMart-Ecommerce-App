import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quick_mart/features/home/data/models/banner_model.dart';
import 'package:quick_mart/features/home/data/repos/home_repo.dart';
import 'package:quick_mart/features/home/presentation/view_model/banner_cubit/banner_state.dart';

class BannerCubit extends Cubit<BannerState> {
  BannerCubit({required this.homeRepo}) : super(BannerInitial());
  HomeRepo homeRepo;
  PageController pageController = PageController();
  List<BannerModel> banners = [];
  int pageIndex = 0;

  void updatePageIndex(int index) {
    pageIndex = index;
  }

  void getBanner() async {
    emit(BannerLoading());
    final data = await homeRepo.getBanners();
    data.fold((error) => emit(BannerError(errMsg: error.errMsg)), (banners) {
      emit(BannerSuccess(banners: banners));
      this.banners = banners;
      autoScroll();
    });
  }

  Timer timer = Timer(
    Duration.zero,
    () {},
  );
  void autoScroll() {
    timer = Timer.periodic(const Duration(seconds: 12), (Timer timer) {
      if (pageController.positions.isNotEmpty) {
        if (pageIndex == banners.length - 1) {
          pageController.animateToPage(
            0,
            duration: const Duration(milliseconds: 300),
            curve: Curves.bounceOut,
          );
        } else {
          pageController.nextPage(
            duration: const Duration(milliseconds: 300),
            curve: Curves.bounceIn,
          );
        }
      }
    });
  }

  @override
  Future<void> close() {
    timer.cancel();
    pageController.dispose();
    return super.close();
  }
}
