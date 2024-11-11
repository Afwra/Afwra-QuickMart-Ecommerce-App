import 'package:quick_mart/features/home/data/models/product_model.dart';

sealed class SearchResultState {}

final class SearchResultLoading extends SearchResultState {}

final class SearchResultSuccess extends SearchResultState {
  final List<ProductModel> products;
  SearchResultSuccess({required this.products});
}

final class SearchResultFail extends SearchResultState {
  final String errMsg;
  SearchResultFail({required this.errMsg});
}
