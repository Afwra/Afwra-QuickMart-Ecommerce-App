import 'package:dartz/dartz.dart';
import 'package:quick_mart/core/errors/failures.dart';
import 'package:quick_mart/features/home/data/models/products_model/products_model.dart';

abstract class HomeRepo {
  Future<Either<Failures, List<ProductsModel>>> getLatestProducts();
}
