import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:quick_mart/core/errors/failures.dart';
import 'package:quick_mart/core/utils/api_service.dart';
import 'package:quick_mart/core/utils/app_constants.dart';
import 'package:quick_mart/core/utils/app_settings.dart';
import 'package:quick_mart/features/whishlist/data/models/wishlist_model/wishlist_model.dart';
import 'package:quick_mart/features/whishlist/data/repo/wishlist_repo.dart';

class WishlistRepoImpl implements WishlistRepo {
  final ApiService apiService;

  WishlistRepoImpl({required this.apiService});
  @override
  Future<Either<Failures, List<WishlistModel>>> getWishList(
      {required int page}) async {
    try {
      final data = await apiService.get(
        endpoint: AppConstants.favoritesEndpoint,
        queryParameters: {'page': page.toString()},
        headers: {
          'Authorization': AppSettings.userToken,
          'lang': AppSettings.langCode
        },
      );
      List<WishlistModel> wishlist = [];
      for (var element in data['data']['data']) {
        wishlist.add(WishlistModel.fromJson(element));
      }
      return Right(wishlist);
    } on Exception catch (e) {
      if (Exception is DioException) {
        return Left(ServerFailure.dioError(e as DioException));
      } else {
        return Left(ServerFailure(e.toString()));
      }
    }
  }
}
