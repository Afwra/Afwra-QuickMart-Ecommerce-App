import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quick_mart/core/functions/flutter_toast.dart';
import 'package:quick_mart/core/utils/app_colors.dart';
import 'package:quick_mart/features/product_details/data/repos/product_detail_repo.dart';
import 'package:quick_mart/features/product_details/presentation/view_models/product_detail_cubit/product_detail_state.dart';

class ProductDetailCubit extends Cubit<ProductDetailState> {
  ProductDetailCubit(this.productDetailRepo) : super(ProductDetailInitial());

  final ProductDetailRepo productDetailRepo;

  //favorites logic section
  bool addToFavoritesLoading = false;
  bool addToFavoritesFail = false;
  void addOrRemoveFavorites(int productId) async {
    addToFavoritesLoading = true;
    emit(ProductDetailAddedOrRemovedToFavoritesLoading());
    final result = await productDetailRepo.addToFavorites(productId: productId);
    result.fold(
      (error) {
        showFlutterToast(
          msg: 'Could not add/remove favorites due to ${error.errMsg}',
        );
        addToFavoritesFail = true;
        addToFavoritesLoading = false;

        emit(ProductDetailAddedOrRemovedToFavoritesFailed());
      },
      (success) {
        showFlutterToast(
          msg: 'add/remove favorites successfully',
          backGroundColor: AppColors.kBrandColorCyan,
        );
        addToFavoritesLoading = false;

        addToFavoritesFail = false;
        emit(ProductDetailAddedOrRemovedToFavoritesSuccess());
      },
    );
  }

  //image page view logic section
  var pageController = PageController(initialPage: 0);
  int currentPage = 0;
  void changePage(int index) {
    currentPage = index;
    emit(ProductDetailImagePageViewChanged());
  }
}
