import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quick_mart/features/home/data/models/product_model.dart';
import 'package:quick_mart/features/home/data/repos/home_repo.dart';
import 'package:quick_mart/features/home/presentation/view_model/category_products_cubit/category_products_state.dart';
import 'package:quick_mart/features/home/presentation/views/widgets/custom_filter_bottom_sheet.dart';

class CategoryProductsCubit extends Cubit<CategoryProductsState> {
  CategoryProductsCubit(this.homeRepo) : super(CategoryProductsInitial());

  final HomeRepo homeRepo;
  late List<ProductModel> products;
  void getCategoryProducts({required int id}) async {
    emit(CategoryProductsLoading());
    final data = await homeRepo.getCategoryProducts(id: id);
    data.fold((error) => emit(CategoryProductsFail(errMsg: error.errMsg)),
        (products) {
      this.products = products;
      emit(CategoryProductsSuccess(products: products));
    });
  }

  void filterProducts(context, List<FilterModel> filterList) {
    switch (filterList.firstWhere((element) => element.value).filterType) {
      case FilterTypes.aToZ:
        products.sort((a, b) => a.name.compareTo(b.name));
        break;
      case FilterTypes.zToA:
        products.sort((a, b) => b.name.compareTo(a.name));
        break;
      case FilterTypes.lowToHigh:
        products.sort((a, b) => a.price.compareTo(b.price));
        break;
      case FilterTypes.highToLow:
        products.sort((a, b) => b.price.compareTo(a.price));
        break;
      default:
    }
    Navigator.pop(context);

    emit(CategoryProductsSuccess(products: products));
  }
}
