import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quick_mart/core/functions/hive_functions.dart';
import 'package:quick_mart/features/home/presentation/view_model/home_cubit/home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  int currPage = 0;
  void changeNavigationBarIndex(int index) {
    currPage = index;
    emit(BottomNavigationBarChangeIndex());
  }

  bool isDarkMode = getDarkMode();
}
