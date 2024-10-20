import 'package:quick_mart/features/home/data/models/product_model.dart';

sealed class CategoryProductsState {}

final class CategoryProductsInitial extends CategoryProductsState {}

final class CategoryProductsSuccess extends CategoryProductsState {
  final List<ProductModel> products;
  CategoryProductsSuccess({required this.products});
}

final class CategoryProductsFail extends CategoryProductsState {
  final String errMsg;
  CategoryProductsFail({required this.errMsg});
}

final class CategoryProductsLoading extends CategoryProductsState {}
