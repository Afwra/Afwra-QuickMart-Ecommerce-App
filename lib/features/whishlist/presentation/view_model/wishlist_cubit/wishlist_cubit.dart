import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quick_mart/features/whishlist/data/models/wishlist_model/wishlist_model.dart';
import 'package:quick_mart/features/whishlist/data/repo/wishlist_repo.dart';

part 'wishlist_state.dart';

class WishlistCubit extends Cubit<WishlistState> {
  WishlistCubit({required this.wishlistRepo}) : super(WishlistLoading());
  final WishlistRepo wishlistRepo;

  bool whishlistLoading = false;
  bool moreDataLoading = false;
  bool wishListHasData = true;
  int currPage = 1;
  late List<WishlistModel> wishList;
  void getWishList() async {
    whishlistLoading = true;
    initScrollController();
    emit(WishlistLoading());
    final result = await wishlistRepo.getWishList(page: currPage);
    result.fold((error) {
      emit(WishlistFail());
    }, (result) {
      wishList = result;
      currPage++;
      emit(WishlistSuccess());
    });
    whishlistLoading = false;
  }

  void getMoreWishList() async {
    if (!wishListHasData || moreDataLoading) {
      return;
    }
    moreDataLoading = true;

    emit(WishlistLoading());

    final result = await wishlistRepo.getWishList(page: currPage);
    result.fold((error) {
      log('error -- ${error.errMsg}');
      emit(WishlistFail());
    }, (result) {
      if (result.isEmpty) {
        wishListHasData = false;
      }
      wishList.addAll(result);
      currPage++;
      emit(WishlistSuccess());
    });
    moreDataLoading = false;
  }

  final ScrollController listViewScrollController = ScrollController();
  void initScrollController() {
    listViewScrollController.addListener(() {
      if (listViewScrollController.position.pixels ==
          listViewScrollController.position.maxScrollExtent) {
        getMoreWishList();
      }
    });
  }

  @override
  Future<void> close() {
    listViewScrollController.dispose();
    return super.close();
  }
}
