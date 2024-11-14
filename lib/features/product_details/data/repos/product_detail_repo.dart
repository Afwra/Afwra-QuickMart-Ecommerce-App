import 'package:dartz/dartz.dart';
import 'package:quick_mart/core/errors/failures.dart';

abstract class ProductDetailRepo {
  Future<Either<Failures, void>> addToFavorites({required int productId});
  Future<Either<Failures, String>> addToCart(
      {required int productId, required int quantity});

  Future<Either<Failures, void>> updateCart(
      {required int cartId, required int quantity});
}
