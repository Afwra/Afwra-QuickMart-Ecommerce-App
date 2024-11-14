import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quick_mart/features/cart/data/repos/cart_repo.dart';
import 'package:quick_mart/features/cart/presentation/view_models/cubit/my_cart_state.dart';

class MyCartCubit extends Cubit<MyCartState> {
  MyCartCubit(this.cartRepo) : super(MyCartLoading());
  final CartRepo cartRepo;
  void getCartItems() async {
    emit(MyCartLoading());
    var result = await cartRepo.getCart();
    result.fold((error) => emit(MyCartFail(error.errMsg)),
        (cart) => emit(MyCartSuccess(cart)));
  }
}
