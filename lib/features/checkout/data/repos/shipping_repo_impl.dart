import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:quick_mart/core/errors/failures.dart';
import 'package:quick_mart/core/utils/api_service.dart';
import 'package:quick_mart/core/utils/app_constants.dart';
import 'package:quick_mart/core/utils/app_settings.dart';
import 'package:quick_mart/features/checkout/data/models/shipping_model.dart';
import 'package:quick_mart/features/checkout/data/repos/shipping_repo.dart';

class ShippingRepoImpl implements ShippingRepo {
  final ApiService apiService;

  ShippingRepoImpl({required this.apiService});

  @override
  Future<Either<Failures, ShippingModel?>> getShippingAddress() async {
    try {
      final result = await apiService
          .get(endpoint: AppConstants.addressEndpoint, headers: {
        'Authorization': AppSettings.userToken,
        'lang': AppSettings.langCode,
      });
      if (result['status'] == true) {
        if (result['data']['data'].isEmpty) {
          return const Right(null);
        }
        return Right(ShippingModel.fromJson(result['data']['data'][0]));
      } else {
        return Left(ServerFailure(result['message']));
      }
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.dioError(e));
      } else {
        return Left(ServerFailure(e.toString()));
      }
    }
  }

  @override
  Future<Either<Failures, void>> addShippingAddress(
      ShippingModel shippingModel) async {
    try {
      final result = await apiService
          .post(endpoint: AppConstants.addressEndpoint, headers: {
        'Authorization': AppSettings.userToken,
        'lang': AppSettings.langCode,
      }, data: {
        'name': shippingModel.name,
        'city': shippingModel.city,
        'region': shippingModel.region,
        'details': shippingModel.details,
        'notes': shippingModel.notes,
        'latitude': shippingModel.lat,
        'longitude': shippingModel.long,
      });
      if (result['status'] == true) {
        return const Right(null);
      } else {
        return Left(ServerFailure(result['message']));
      }
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.dioError(e));
      } else {
        return Left(ServerFailure(e.toString()));
      }
    }
  }

  @override
  Future<Either<Failures, void>> updateShippingAddress(
      ShippingModel shippingModel) async {
    try {
      final result = await apiService
          .put(endpoint: AppConstants.addressEndpoint, headers: {
        'Authorization': AppSettings.userToken,
        'lang': AppSettings.langCode,
      }, data: {
        'name': shippingModel.name,
        'city': shippingModel.city,
        'region': shippingModel.region,
        'details': shippingModel.details,
        'notes': shippingModel.notes,
        'latitude': shippingModel.lat,
        'longitude': shippingModel.long,
      });
      if (result['status'] == true) {
        return const Right(null);
      } else {
        return Left(ServerFailure(result['message']));
      }
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.dioError(e));
      } else {
        return Left(ServerFailure(e.toString()));
      }
    }
  }
}
