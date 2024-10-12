import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quick_mart/core/functions/hive_functions.dart';
import 'package:quick_mart/features/home/data/models/category_model.dart';
import 'package:quick_mart/features/home/data/repos/home_repo.dart';
import 'package:quick_mart/features/home/presentation/view_model/categories_cubit/categories_state.dart';

class CategoriesCubit extends Cubit<CategoriesState> {
  CategoriesCubit({required this.homeRepo}) : super(CategoriesInitial());

  HomeRepo homeRepo;
  bool isLoading = false;
  late List<CategoryModel> categories = [];
  void getCategories() async {
    isLoading = !isLoading;

    emit(CategoriesLoading());
    String lang = getLanguageCode();
    final result = await homeRepo.getCategories(lang: lang);
    result.fold((fail) => emit(CategoriesError(errMsg: fail.errMsg)),
        (categories) {
      isLoading = !isLoading;
      this.categories = categories;
      emit(CategoriesSuccess(categories: categories));
    });
  }
}
