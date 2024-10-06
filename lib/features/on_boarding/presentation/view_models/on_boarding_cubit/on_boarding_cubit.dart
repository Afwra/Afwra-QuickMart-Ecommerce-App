import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:quick_mart/core/utils/app_assets.dart';
import 'package:quick_mart/features/on_boarding/data/models/on_boarding_item_model.dart';
import 'package:quick_mart/features/on_boarding/presentation/view_models/on_boarding_cubit/on_boarding_state.dart';

class OnBoardingCubit extends Cubit<OnBoardingState> {
  OnBoardingCubit() : super(OnBoardingInitial());
  final PageController pageController = PageController();

  final List<OnBoardingItemModel> onBoardingItems = [
    OnBoardingItemModel(
      title: 'Welcome to Quick Mart',
      subtitle:
          'Explore a wide range of products at your fingertips. QuickMart offers an extensive collection to suit your needs.',
      image: AppAssets.onBoarding1,
    ),
    OnBoardingItemModel(
      title: 'Unlock exclusive offers and discounts',
      subtitle:
          'Get access to limited-time deals and special promotions available only to our valued customers.',
      image: AppAssets.onBoarding2,
    ),
    OnBoardingItemModel(
      title: 'Safe and secure payments',
      subtitle:
          ' QuickMart employs industry-leading encryption and trusted payment gateways to safeguard your financial information.',
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
    var box = Hive.box('settings');
    await box.put('onboarding_completed', true);
    log('OnBoarding Saved');
    pageController.dispose();
    return super.close();
  }
}
