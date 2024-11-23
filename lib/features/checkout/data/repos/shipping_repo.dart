import 'package:dartz/dartz.dart';
import 'package:quick_mart/core/errors/failures.dart';
import 'package:quick_mart/features/checkout/data/models/shipping_model.dart';

abstract class ShippingRepo {
  Future<Either<Failures, ShippingModel?>> getShippingAddress();
  Future<Either<Failures, void>> addShippingAddress(
      ShippingModel shippingModel);
  Future<Either<Failures, void>> updateShippingAddress(
      ShippingModel shippingModel);
}
