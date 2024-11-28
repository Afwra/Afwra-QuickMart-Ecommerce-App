import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:quick_mart/core/errors/failures.dart';
import 'package:quick_mart/core/utils/stripe_service.dart';
import 'package:quick_mart/features/checkout/data/models/input_payment_intent_model.dart';
import 'package:quick_mart/features/checkout/data/repos/payment_repo.dart';

class PaymentRepoImpl extends PaymentRepo {
  final StripeService stripeService;

  PaymentRepoImpl({required this.stripeService});
  @override
  Future<Either<Failures, void>> makePayment(
      InputPaymentIntentModel inputPaymentIntentModel) async {
    try {
      await stripeService.makePayment(
          inputPaymentIntentModel: inputPaymentIntentModel);
      return right(null);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.dioError(e));
      } else {
        debugPrint(e.toString());
        return left(ServerFailure(e.toString()));
      }
    }
  }
}
