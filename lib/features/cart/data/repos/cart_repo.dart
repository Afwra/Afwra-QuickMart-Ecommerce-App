import 'package:dartz/dartz.dart';
import 'package:quick_mart/core/errors/failures.dart';
import 'package:quick_mart/features/cart/data/models/cart_item_model/cart_item_model.dart';

abstract class CartRepo {
  Future<Either<Failures, CartItemModel>> getCart();
  Future<Either<Failures, void>> deleteCart(int cartId);
  Future<Either<Failures, void>> updateCart(
      {required int cartId, required int qunatity});
}
