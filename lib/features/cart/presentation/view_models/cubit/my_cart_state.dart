import 'package:quick_mart/features/cart/data/models/cart_item_model/cart_item_model.dart';

sealed class MyCartState {
  const MyCartState();
}

final class MyCartLoading extends MyCartState {}

final class MyCartSuccess extends MyCartState {
  final CartItemModel cartItems;
  const MyCartSuccess(this.cartItems);
}

final class MyCartFail extends MyCartState {
  final String message;
  const MyCartFail(this.message);
}
