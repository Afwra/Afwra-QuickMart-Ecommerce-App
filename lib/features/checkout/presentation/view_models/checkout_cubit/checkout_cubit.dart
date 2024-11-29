import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quick_mart/features/cart/data/models/cart_item_model/cart_item_model.dart';
import 'package:quick_mart/features/checkout/data/models/shipping_model.dart';
import 'package:quick_mart/features/checkout/presentation/view_models/checkout_cubit/checkout_state.dart';

class CheckoutCubit extends Cubit<CheckoutState> {
  CheckoutCubit() : super(CheckoutInitial());

  int currPage = 0;
  var pageController = PageController(initialPage: 0);
  void nextPage() {
    currPage++;
    pageController.nextPage(
        duration: const Duration(seconds: 1), curve: Curves.easeInOut);
    emit(CheckoutChangePageIndex());
  }

  late ShippingModel shippingAddress;
  void saveShippingAddressLocally(ShippingModel shippingModel) {
    shippingAddress = shippingModel;
  }

  late CartItemModel cartItemModel;
  void saveCartItemLocally(CartItemModel cartItemModel) {
    this.cartItemModel = cartItemModel;
  }
}
