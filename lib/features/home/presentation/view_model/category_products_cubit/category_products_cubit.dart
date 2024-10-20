import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quick_mart/features/home/data/repos/home_repo.dart';
import 'package:quick_mart/features/home/presentation/view_model/category_products_cubit/category_products_state.dart';

class CategoryProductsCubit extends Cubit<CategoryProductsState> {
  CategoryProductsCubit(this.homeRepo) : super(CategoryProductsInitial());

  final HomeRepo homeRepo;

  void getCategoryProducts({required int id}) async {
    emit(CategoryProductsLoading());
    final data = await homeRepo.getCategoryProducts(id: id);
    data.fold((error) => emit(CategoryProductsFail(errMsg: error.errMsg)),
        (products) {
      emit(CategoryProductsSuccess(products: products));
    });
  }
}
