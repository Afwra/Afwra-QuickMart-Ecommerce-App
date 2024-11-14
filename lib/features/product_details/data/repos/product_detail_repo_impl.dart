import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:quick_mart/core/errors/failures.dart';
import 'package:quick_mart/core/utils/api_service.dart';
import 'package:quick_mart/core/utils/app_constants.dart';
import 'package:quick_mart/core/utils/app_settings.dart';
import 'package:quick_mart/features/product_details/data/repos/product_detail_repo.dart';

class ProductDetailRepoImpl implements ProductDetailRepo {
  final ApiService apiService;

  ProductDetailRepoImpl({required this.apiService});
  @override
  Future<Either<Failures, void>> addToFavorites(
      {required int productId}) async {
    try {
      var data = await apiService
          .post(endpoint: AppConstants.favoritesEndpoint, headers: {
        'Authorization': AppSettings.userToken,
        'lang': AppSettings.langCode,
      }, data: {
        'product_id': productId,
      });
      if (data['status'] == true) {
        return right(null);
      } else {
        return Left(ServerFailure(data['message']));
      }
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.dioError(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }
}
