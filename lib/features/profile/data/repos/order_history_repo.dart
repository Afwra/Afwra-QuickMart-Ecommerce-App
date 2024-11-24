import 'package:dartz/dartz.dart';
import 'package:quick_mart/core/errors/failures.dart';
import 'package:quick_mart/features/profile/data/models/order_history_model/order_history_model.dart';

abstract class OrderHistoryRepo {
  Future<Either<Failures, OrderHistoryModel>> getOrderHistory();
}
