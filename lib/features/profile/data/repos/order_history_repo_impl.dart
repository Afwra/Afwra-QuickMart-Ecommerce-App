import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:quick_mart/core/errors/failures.dart';
import 'package:quick_mart/core/utils/api_service.dart';
import 'package:quick_mart/core/utils/app_constants.dart';
import 'package:quick_mart/core/utils/app_settings.dart';
import 'package:quick_mart/features/profile/data/models/order_history_model/order_history_model.dart';
import 'package:quick_mart/features/profile/data/repos/order_history_repo.dart';

class OrderHistoryRepoImpl implements OrderHistoryRepo {
  final ApiService apiService;
  OrderHistoryRepoImpl({required this.apiService});
  @override
  Future<Either<Failures, OrderHistoryModel>> getOrderHistory() async {
    try {
      final result = await apiService.get(
        endpoint: AppConstants.ordersEndpoint,
        headers: {
          'Authorization': AppSettings.userToken,
          'lang': AppSettings.langCode,
        },
      );
      if (result['status'] == true) {
        return Right(OrderHistoryModel.fromJson(result['data']));
      } else {
        return Left(ServerFailure(result['message']));
      }
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.dioError(e));
      }
      return Left(ServerFailure(e.toString()));
    }
  }
}
