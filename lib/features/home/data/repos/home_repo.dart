import 'package:dartz/dartz.dart';
import 'package:quick_mart/core/errors/failures.dart';
import 'package:quick_mart/features/auth/data/models/user_model.dart';
import 'package:quick_mart/features/home/data/models/banner_model.dart';
import 'package:quick_mart/features/home/data/models/category_model.dart';
import 'package:quick_mart/features/home/data/models/favorites_model.dart';
import 'package:quick_mart/features/home/data/models/product_model.dart';

abstract class HomeRepo {
  Future<Either<Failures, List<ProductModel>>> getLatestProducts(
      {required String userToken, String lang});
  Future<Either<Failures, List<CategoryModel>>> getCategories({String lang});
  Future<Either<Failures, List<BannerModel>>> getBanners();
  Future<Either<Failures, List<ProductModel>>> getCategoryProducts(
      {required int id});
  Future<Either<Failures, List<ProductModel>>> getSearchProducts(
      {required String query, required String userToken, String lang});

  Future<Either<Failures, FavoritesModel>> addToFavorites(
      {required int productId, required String userToken, String lang});

  Future<Either<Failures, UserModel>> getUserProfilePicture();
  Future<Either<Failures, UserModel>> updateUserProfile(UserModel userModel);
}
