import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_paypal_payment/flutter_paypal_payment.dart';
import 'package:quick_mart/core/functions/flutter_toast.dart';
import 'package:quick_mart/core/utils/api_keys.dart';
import 'package:quick_mart/features/checkout/data/models/paypal_models/paypal_amount_model/details.dart';
import 'package:quick_mart/features/checkout/data/models/paypal_models/paypal_amount_model/paypal_amount_model.dart';
import 'package:quick_mart/features/checkout/data/models/paypal_models/paypal_items_model/item.dart';
import 'package:quick_mart/features/checkout/data/models/paypal_models/paypal_items_model/paypal_items_model.dart';
import 'package:quick_mart/features/checkout/data/models/stripe_models/input_payment_intent_model.dart';
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

  void paypalLogic(BuildContext context) {
    var amount = PaypalAmountModel(
        currency: 'USD',
        details: Details(subtotal: '100', shipping: '0', shippingDiscount: 0),
        total: '100');
    List<Item> orderItems = [
      Item(name: 'product 1', quantity: 1, price: '10', currency: 'USD'),
      Item(name: 'product 2', quantity: 9, price: '10', currency: 'USD'),
    ];
    var orderItemsList = PaypalItemsModel(items: orderItems);
    debugPrint(orderItemsList.toJson().toString());
    Navigator.of(context).push(MaterialPageRoute(
      builder: (BuildContext context) => PaypalCheckoutView(
        sandboxMode: true,
        clientId: ApiKeys.paypalClientId,
        secretKey: ApiKeys.paypalSecretKey,
        transactions: [
          {
            "amount": amount.toJson(),
            "description": "The payment transaction description.",
            // "payment_options": {
            //   "allowed_payment_method":
            //       "INSTANT_FUNDING_SOURCE"
            // },
            "item_list": orderItemsList.toJson(),
          }
        ],
        note: "Contact us for any questions on your order.",
        onSuccess: (Map params) async {
          log("onSuccess: $params");
          Navigator.pop(context);
        },
        onError: (error) {
          log("onError: $error");
          Navigator.pop(context);
        },
        onCancel: () {
          log('cancelled:');
          Navigator.pop(context);
        },
      ),
    ));
  }
}
