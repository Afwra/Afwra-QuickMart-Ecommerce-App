import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:quick_mart/core/errors/failures.dart';
import 'package:quick_mart/core/utils/api_service.dart';
import 'package:quick_mart/core/utils/app_constants.dart';
import 'package:quick_mart/core/utils/app_settings.dart';
import 'package:quick_mart/features/home/data/models/banner_model.dart';
import 'package:quick_mart/features/home/data/models/category_model.dart';
import 'package:quick_mart/features/home/data/models/product_model.dart';
import 'package:quick_mart/features/home/data/repos/home_repo.dart';

class HomeRepoImpl implements HomeRepo {
  final ApiService apiService;

  HomeRepoImpl({required this.apiService});
  @override
  Future<Either<Failures, List<ProductModel>>> getLatestProducts(
      {required String userToken, String lang = 'en'}) async {
    try {
      var data = await apiService.get(
        endpoint: AppConstants.latestProductsEndpoint,
        headers: {
          'Authorization': userToken,
          'lang': lang,
        },
      );
      if (data['status'] == true) {
        List<ProductModel> products = [];
        for (var item in data['data']['products']) {
          products.add(ProductModel.fromJson(item));
        }
        return right(products);
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

  @override
  Future<Either<Failures, List<CategoryModel>>> getCategories(
      {String lang = 'en'}) async {
    try {
      var data = await apiService.get(
        endpoint: AppConstants.categoriesEndpoint,
        headers: {
          'lang': lang,
        },
      );
      if (data['status'] == true) {
        List<CategoryModel> categories = [];
        for (var item in data['data']['data']) {
          categories.add(CategoryModel.fromJson(item));
        }
        return right(categories);
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

  @override
  Future<Either<Failures, List<BannerModel>>> getBanners() async {
    try {
      var data = await apiService.get(
        endpoint: AppConstants.bannersEndpoint,
      );
      if (data['status'] == true) {
        List<BannerModel> banners = [];
        for (var item in data['data']) {
          banners.add(BannerModel.fromJson(item));
        }
        return right(banners);
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

  @override
  Future<Either<Failures, List<ProductModel>>> getCategoryProducts(
      {required int id}) async {
    try {
      var data = await apiService.get(
        endpoint: '${AppConstants.categoriesProductsEndpoint}$id',
        headers: {
          'Authorization': AppSettings.userToken,
          'lang': AppSettings.langCode,
        },
      );
      if (data['status'] == true) {
        List<ProductModel> products = [];
        for (var item in data['data']['data']) {
          products.add(ProductModel.fromJson(item));
        }
        return right(products);
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
