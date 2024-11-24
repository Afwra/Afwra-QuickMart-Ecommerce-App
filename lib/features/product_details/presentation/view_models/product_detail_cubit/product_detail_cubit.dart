import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:quick_mart/core/functions/flutter_toast.dart';
import 'package:quick_mart/core/utils/app_colors.dart';
import 'package:quick_mart/core/utils/app_routes.dart';
import 'package:quick_mart/core/utils/app_settings.dart';
import 'package:quick_mart/features/product_details/data/repos/product_detail_repo.dart';
import 'package:quick_mart/features/product_details/presentation/view_models/product_detail_cubit/product_detail_state.dart';

class ProductDetailCubit extends Cubit<ProductDetailState> {
  ProductDetailCubit(this.productDetailRepo) : super(ProductDetailInitial());

  final ProductDetailRepo productDetailRepo;
  //-------------------------------------------------
  // favorites logic section
  //-------------------------------------------------
  bool addToFavoritesLoading = false;
  bool addToFavoritesFail = false;
  void addOrRemoveFavorites(int productId) async {
    addToFavoritesLoading = true;
    emit(ProductDetailAddedOrRemovedToFavoritesLoading());
    final result = await productDetailRepo.addToFavorites(productId: productId);
    result.fold(
      (error) {
        debugPrint(AppSettings.userToken);

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

//-------------------------------------------------
//  image page view logic section
//-------------------------------------------------

  var pageController = PageController(initialPage: 0);
  int currentPage = 0;

  late Timer timer;
  void autoScroll(int arrayLength) {
    timer = Timer.periodic(const Duration(seconds: 4), (Timer timer) {
      if (pageController.positions.isNotEmpty) {
        if (currentPage == arrayLength - 1) {
          pageController.animateToPage(
            0,
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInCirc,
          );
        } else {
          pageController.nextPage(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeIn,
          );
        }
      }
    });
  }

//-------------------------------------------------
//  Quantity Section
//-------------------------------------------------
  int quantity = 1;
  void incrementQuantity() {
    quantity++;
    emit(ProductDetailQuantityIncremented());
  }

  void decrementQuantity() {
    if (quantity > 1) {
      quantity--;
      emit(ProductDetailQuantityDecremented());
    }
  }

//-------------------------------------------------
//  Add To Cart Section
//-------------------------------------------------
  bool addToCartLoading = false;
  Future addToCart(int productId) async {
    addToCartLoading = true;
    emit(ProductDetailAddedToCartLoading());
    final result = await productDetailRepo.addToCart(
        productId: productId, quantity: quantity);
    result.fold(
      (error) {
        showFlutterToast(
          msg: 'Could not add to cart due to ${error.errMsg}',
        );
        addToCartLoading = false;

        emit(ProductDetailAddedToCartFailed());
      },
      (success) {
        showFlutterToast(
          msg: success,
          backGroundColor: AppColors.kBrandColorCyan,
        );
        addToCartLoading = false;

        emit(ProductDetailAddedToCartSuccess());
      },
    );
  }

  void buyNow(int productId, BuildContext context) async {
    await addToCart(productId);
    if (context.mounted) {
      GoRouter.of(context).push(AppRoutes.kCheckoutView);
    }
  }

  @override
  Future<void> close() {
    timer.cancel();
    pageController.dispose();
    return super.close();
  }
}
