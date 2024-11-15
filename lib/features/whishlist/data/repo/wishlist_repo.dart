import 'package:dartz/dartz.dart';
import 'package:quick_mart/core/errors/failures.dart';
import 'package:quick_mart/features/whishlist/data/models/wishlist_model/wishlist_model.dart';

abstract class WishlistRepo {
  Future<Either<Failures, List<WishlistModel>>> getWishList(
      {required int page});
  Future<Either<Failures, String>> deleteWishList({required int wishlistId});
}
