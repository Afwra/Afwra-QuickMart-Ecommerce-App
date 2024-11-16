import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:quick_mart/core/errors/failures.dart';
import 'package:quick_mart/core/utils/api_service.dart';
import 'package:quick_mart/core/utils/app_constants.dart';
import 'package:quick_mart/core/utils/app_settings.dart';
import 'package:quick_mart/features/cart/data/models/cart_item_model/cart_item_model.dart';
import 'package:quick_mart/features/cart/data/repos/cart_repo.dart';

class CartReopImpl implements CartRepo {
  final ApiService apiService;

  CartReopImpl({required this.apiService});
  @override
  Future<Either<Failures, CartItemModel>> getCart() async {
    try {
      var data = await apiService.get(
        endpoint: AppConstants.cartsEndpoint,
        headers: {
          'Authorization': AppSettings.userToken,
          'lang': AppSettings.langCode,
        },
      );
      if (data['status'] == true) {
        return right(CartItemModel.fromJson(data['data']));
      } else {
        return left(ServerFailure(data['message']));
      }
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.dioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failures, void>> deleteCart(int cartId) async {
    try {
      var data = await apiService.delete(
        endpoint: '${AppConstants.cartsEndpoint}/$cartId',
        headers: {
          'Authorization': AppSettings.userToken,
          'lang': AppSettings.langCode,
        },
      );
      if (data['status'] == true) {
        return right(null);
      } else {
        return left(ServerFailure(data['message']));
      }
    } catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failures, void>> updateCart(
      {required int cartId, required int qunatity}) async {
    try {
      var data = await apiService.put(
        endpoint: '${AppConstants.cartsEndpoint}/$cartId',
        headers: {
          'Authorization': AppSettings.userToken,
          'lang': AppSettings.langCode,
        },
        data: {
          'quantity': qunatity,
        },
      );
      if (data['status'] == true) {
        return right(null);
      } else {
        return left(ServerFailure(data['message']));
      }
    } catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }
}
