import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quick_mart/core/functions/flutter_toast.dart';
import 'package:quick_mart/features/cart/data/models/cart_item_model/cart_item_model.dart';
import 'package:quick_mart/features/cart/data/repos/cart_repo.dart';
import 'package:quick_mart/features/checkout/presentation/view_models/review_order_cubit/review_order_state.dart';

class ReviewOrderCubit extends Cubit<ReviewOrderState> {
  ReviewOrderCubit(this.cartRepo) : super(ReviewOrderInitial());

  final CartRepo cartRepo;

  late CartItemModel cart;
  bool cartLoading = false;
  void getCartItems() async {
    cartLoading = true;
    emit(GetCartLoading());
    var result = await cartRepo.getCart();
    result.fold(
      (error) {
        showFlutterToast(msg: error.errMsg);
        cartLoading = false;
        emit(GetCartFail());
      },
      (cart) {
        this.cart = cart;

        cartLoading = false;
        emit(GetCartSuccess());
      },
    );
  }
}
