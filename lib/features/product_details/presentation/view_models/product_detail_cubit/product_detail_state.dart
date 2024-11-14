sealed class ProductDetailState {}

final class ProductDetailInitial extends ProductDetailState {}

final class ProductDetailAddedOrRemovedToFavoritesLoading
    extends ProductDetailState {}

final class ProductDetailAddedOrRemovedToFavoritesSuccess
    extends ProductDetailState {}

final class ProductDetailAddedOrRemovedToFavoritesFailed
    extends ProductDetailState {}

final class ProductDetailImagePageViewChanged extends ProductDetailState {}

final class ProductDetailQuantityIncremented extends ProductDetailState {}

final class ProductDetailQuantityDecremented extends ProductDetailState {}

final class ProductDetailAddedToCartLoading extends ProductDetailState {}

final class ProductDetailAddedToCartFailed extends ProductDetailState {}

final class ProductDetailAddedToCartSuccess extends ProductDetailState {}
