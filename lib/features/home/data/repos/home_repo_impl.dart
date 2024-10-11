import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:quick_mart/core/errors/failures.dart';
import 'package:quick_mart/core/utils/api_service.dart';
import 'package:quick_mart/core/utils/app_constants.dart';
import 'package:quick_mart/features/home/data/models/products_model/products_model.dart';
import 'package:quick_mart/features/home/data/repos/home_repo.dart';

class HomeRepoImpl implements HomeRepo {
  final ApiService apiService;

  HomeRepoImpl({required this.apiService});
  @override
  Future<Either<Failures, List<ProductsModel>>> getLatestProducts() async {
    try {
      var data = await apiService.get(
        endpoint: AppConstants.latestProductsEndpoint,
      );
      List<ProductsModel> products = [];
      for (var item in data) {
        products.add(ProductsModel.fromJson(item));
      }
      return right(products);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.dioError(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }
}
