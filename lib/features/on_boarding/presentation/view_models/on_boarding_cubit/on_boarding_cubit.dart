import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:quick_mart/core/functions/hive_functions.dart';
import 'package:quick_mart/core/utils/app_assets.dart';
import 'package:quick_mart/core/utils/app_constants.dart';
import 'package:quick_mart/core/utils/app_texts.dart';
import 'package:quick_mart/features/on_boarding/data/models/on_boarding_item_model.dart';
import 'package:quick_mart/features/on_boarding/presentation/view_models/on_boarding_cubit/on_boarding_state.dart';

class OnBoardingCubit extends Cubit<OnBoardingState> {
  OnBoardingCubit() : super(OnBoardingInitial());
  OnBoardingCubit get(context) => BlocProvider.of<OnBoardingCubit>(context);
  final PageController pageController = PageController(
    initialPage: 0,
  );
  late bool darkMode;
  void setupDarkMode() {
    darkMode = getDarkMode();
  }

  final List<OnBoardingItemModel> onBoardingItems = [
    OnBoardingItemModel(
      title: AppTexts.title1,
      subtitle: AppTexts.subTitle1,
      image: AppAssets.onBoarding1,
    ),
    OnBoardingItemModel(
      title: AppTexts.title2,
      subtitle: AppTexts.subTitle2,
      image: AppAssets.onBoarding2,
    ),
    OnBoardingItemModel(
      title: AppTexts.title3,
      subtitle: AppTexts.subTitle3,
      image: AppAssets.onBoarding3,
    ),
  ];
  int index = 0;
  void changeIndex(int index) {
    this.index = index;
    emit(OnBoardingChangeIndex());
  }

  void previousPage(context) {
    pageController.previousPage(
        duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
    emit(OnBoardingPreviousPage());
  }

  void nextPage(context) {
    pageController.nextPage(
        duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
    emit(OnBoardingNextPage());
  }

  @override
  Future<void> close() async {
    var box = Hive.box(AppConstants.settingsBox);
    await box.put(AppConstants.onboardingCompleted, true);
    log('OnBoarding Saved');
    pageController.dispose();
    return super.close();
  }
}
