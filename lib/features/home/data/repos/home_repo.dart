import 'package:dartz/dartz.dart';
import 'package:quick_mart/core/errors/failures.dart';
import 'package:quick_mart/features/home/data/models/product_model.dart';

abstract class HomeRepo {
  Future<Either<Failures, List<ProductModel>>> getLatestProducts(
      {required String userToken, String lang});
}
