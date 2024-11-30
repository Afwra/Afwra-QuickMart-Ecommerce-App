import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_paypal_payment/flutter_paypal_payment.dart';
import 'package:go_router/go_router.dart';
import 'package:quick_mart/core/functions/flutter_toast.dart';
import 'package:quick_mart/core/utils/api_keys.dart';
import 'package:quick_mart/core/utils/app_routes.dart';
import 'package:quick_mart/features/checkout/data/models/paypal_models/paypal_amount_model/details.dart';
import 'package:quick_mart/features/checkout/data/models/paypal_models/paypal_amount_model/paypal_amount_model.dart';
import 'package:quick_mart/features/checkout/data/models/paypal_models/paypal_items_model/item.dart';
import 'package:quick_mart/features/checkout/data/models/paypal_models/paypal_items_model/paypal_items_model.dart';
import 'package:quick_mart/features/checkout/data/models/stripe_models/input_payment_intent_model.dart';
import 'package:quick_mart/features/checkout/data/repos/payment_repo.dart';
import 'package:quick_mart/features/checkout/presentation/view_models/checkout_cubit/checkout_cubit.dart';
import 'package:quick_mart/features/checkout/presentation/view_models/payment_cubit/payment_state.dart';

class PaymentCubit extends Cubit<PaymentState> {
  PaymentCubit({required this.paymentRepo}) : super(PaymentCubitInitial());

  final PaymentRepo paymentRepo;
  Future<void> makeStripePayment(
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

  void makePaypalPayment(
      {required BuildContext context,
      required List<Item> orderItems,
      required PaypalAmountModel amount}) {
    var orderItemsList = PaypalItemsModel(items: orderItems);
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
          GoRouter.of(context).go(AppRoutes.kPaymentSuccess);
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

  void setupPaypalPayment(BuildContext context) {
    var checkoutCubit = BlocProvider.of<CheckoutCubit>(context);
    var cartItems = checkoutCubit.cartItemModel;
    if (cartItems.cartItems.isEmpty) {
      showFlutterToast(msg: 'No Items in cart.');
      return;
    } else {
      var amount = PaypalAmountModel(
        currency: 'USD',
        details: Details(
          subtotal: cartItems.subTotal.toString(),
          shipping: '0',
          shippingDiscount: 0,
        ),
        total: cartItems.total.toString(),
      );
      List<Item> items = [];
      items.addAll(
        cartItems.cartItems.map(
          (e) => Item(
            name: e.product.name,
            quantity: e.quantity,
            price: e.product.price.toString(),
            currency: 'USD',
          ),
        ),
      );
      makePaypalPayment(context: context, orderItems: items, amount: amount);
    }
  }
}
