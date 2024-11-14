import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quick_mart/core/functions/flutter_toast.dart';
import 'package:quick_mart/core/utils/app_colors.dart';
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

  void deleteCartItem(int cartId) async {
    emit(MyCartLoading());
    var result = await cartRepo.deleteCart(cartId);
    result.fold((error) {
      showFlutterToast(msg: error.errMsg);
    }, (success) {
      showFlutterToast(
        msg: 'Item deleted successfully',
        backGroundColor: AppColors.kBrandColorCyan,
      );
      getCartItems();
    });
  }

  void updateCartItem({required int cartId, required int quantity}) async {
    emit(MyCartLoading());
    var result = await cartRepo.updateCart(cartId: cartId, qunatity: quantity);
    result.fold((error) {
      showFlutterToast(msg: error.errMsg);
    }, (success) {
      showFlutterToast(
        msg: 'Item updated successfully',
        backGroundColor: AppColors.kBrandColorCyan,
      );
      getCartItems();
    });
  }
}
