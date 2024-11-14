import 'package:dartz/dartz.dart';
import 'package:quick_mart/core/errors/failures.dart';

abstract class ProductDetailRepo {
  Future<Either<Failures, void>> addToFavorites({required int productId});
}
