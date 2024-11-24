import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quick_mart/core/functions/flutter_toast.dart';
import 'package:quick_mart/features/profile/data/models/order_history_model/order_history_model.dart';
import 'package:quick_mart/features/profile/data/repos/order_history_repo.dart';
import 'package:quick_mart/features/profile/presentation/view_model/order_history_cubit/order_history_state.dart';

class OrderHistoryCubit extends Cubit<OrderHistoryState> {
  OrderHistoryCubit(this.orderHistoryRepo) : super(OrderHistoryInitial());
  final OrderHistoryRepo orderHistoryRepo;
  bool orderHistoryLoading = false;
  late OrderHistoryModel orderHistoryModel;
  void getOrderHistory() async {
    orderHistoryLoading = true;
    emit(OrderHistoryLoading());
    final result = await orderHistoryRepo.getOrderHistory();
    result.fold(
      (error) {
        showFlutterToast(msg: error.errMsg);
        orderHistoryLoading = false;
        emit(OrderHistoryFail());
      },
      (result) {
        orderHistoryModel = result;
        orderHistoryLoading = false;
        emit(OrderHistorySuccess());
      },
    );
  }
}
