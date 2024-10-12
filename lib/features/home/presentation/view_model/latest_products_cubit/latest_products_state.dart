import 'package:quick_mart/features/home/data/models/product_model.dart';

sealed class LatestProductsState {}

final class LatestProductsInitial extends LatestProductsState {}

final class LatestProductsLoading extends LatestProductsState {}

final class LatestProductsSuccess extends LatestProductsState {
  List<ProductModel> products;
  LatestProductsSuccess({required this.products});
}

final class LatestProductsFail extends LatestProductsState {
  final String errMsg;

  LatestProductsFail({required this.errMsg});
}
