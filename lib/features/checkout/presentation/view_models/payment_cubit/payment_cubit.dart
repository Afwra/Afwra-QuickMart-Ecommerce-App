import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quick_mart/core/functions/flutter_toast.dart';
import 'package:quick_mart/features/checkout/data/models/input_payment_intent_model.dart';
import 'package:quick_mart/features/checkout/data/repos/payment_repo.dart';
import 'package:quick_mart/features/checkout/presentation/view_models/payment_cubit/payment_state.dart';

class PaymentCubit extends Cubit<PaymentState> {
  PaymentCubit({required this.paymentRepo}) : super(PaymentCubitInitial());

  final PaymentRepo paymentRepo;
  Future<void> makePayment(
      {required InputPaymentIntentModel inputPaymentIntentModel}) async {
    emit(PaymentCubitLoading());
    var result = await paymentRepo.makePayment(inputPaymentIntentModel);

    result.fold((fail) {
      showFlutterToast(msg: fail.errMsg);
      emit(PaymentCubitFail());
    }, (success) {
      emit(PaymentCubitSuccess());
    });
  }
}
