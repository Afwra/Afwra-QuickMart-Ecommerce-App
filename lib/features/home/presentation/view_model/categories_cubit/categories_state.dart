import 'package:quick_mart/features/home/data/models/category_model.dart';

sealed class CategoriesState {}

final class CategoriesInitial extends CategoriesState {}

final class CategoriesLoading extends CategoriesState {}

final class CategoriesSuccess extends CategoriesState {
  final List<CategoryModel> categories;
  CategoriesSuccess({required this.categories});
}

final class CategoriesError extends CategoriesState {
  final String errMsg;
  CategoriesError({required this.errMsg});
}
