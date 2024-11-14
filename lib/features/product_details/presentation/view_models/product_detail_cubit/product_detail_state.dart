sealed class ProductDetailState {}

final class ProductDetailInitial extends ProductDetailState {}

final class ProductDetailAddedOrRemovedToFavoritesLoading
    extends ProductDetailState {}

final class ProductDetailAddedOrRemovedToFavoritesSuccess
    extends ProductDetailState {}

final class ProductDetailAddedOrRemovedToFavoritesFailed
    extends ProductDetailState {}

final class ProductDetailImagePageViewChanged extends ProductDetailState {}
