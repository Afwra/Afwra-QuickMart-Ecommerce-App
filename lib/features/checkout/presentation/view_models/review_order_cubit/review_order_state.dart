sealed class ReviewOrderState {}

final class ReviewOrderInitial extends ReviewOrderState {}

final class GetCartSuccess extends ReviewOrderState {}

final class GetCartLoading extends ReviewOrderState {}

final class GetCartFail extends ReviewOrderState {}
