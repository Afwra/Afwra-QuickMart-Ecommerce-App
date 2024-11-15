part of 'wishlist_cubit.dart';

sealed class WishlistState extends Equatable {
  const WishlistState();

  @override
  List<Object> get props => [];
}

final class WishlistLoading extends WishlistState {}

final class WishlistSuccess extends WishlistState {}

final class WishlistFail extends WishlistState {}
