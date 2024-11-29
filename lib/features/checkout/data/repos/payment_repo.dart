import 'package:dartz/dartz.dart';
import 'package:quick_mart/core/errors/failures.dart';
import 'package:quick_mart/features/checkout/data/models/stripe_models/input_payment_intent_model.dart';

abstract class PaymentRepo {
  Future<Either<Failures, void>> makePayment(
      InputPaymentIntentModel inputPaymentIntentModel);
}
