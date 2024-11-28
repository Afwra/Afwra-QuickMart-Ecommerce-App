import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:quick_mart/core/utils/api_keys.dart';
import 'package:quick_mart/core/utils/api_service.dart';
import 'package:quick_mart/features/checkout/data/models/input_payment_intent_model.dart';
import 'package:quick_mart/features/checkout/data/models/stripe_payment_intent_model/stripe_payment_intent_model.dart';

class StripeService {
  final ApiService apiService;

  StripeService({required this.apiService});
  Future<StripePaymentIntentModel> createPaymentIntent(
      InputPaymentIntentModel inputPaymentIntentModel) async {
    var response = await apiService.post(
      inputUrl: 'https://api.stripe.com/v1/payment_intents',
      endpoint: '',
      headers: {
        'Authorization': 'Bearer ${ApiKeys.stripeTestApiKey}',
        'Content-Type': 'application/x-www-form-urlencoded',
      },
      data: inputPaymentIntentModel.toJson(),
    );

    return StripePaymentIntentModel.fromJson(response);
  }

  Future initPaymentSheet({required String paymentIntentClientSecret}) async {
    Stripe.instance.initPaymentSheet(
      paymentSheetParameters: SetupPaymentSheetParameters(
        paymentIntentClientSecret: paymentIntentClientSecret,
        merchantDisplayName: 'Quick Mart',
      ),
    );
  }

  Future displayPaymentSheet() async {
    await Stripe.instance.presentPaymentSheet();
  }

  Future makePayment(
      {required InputPaymentIntentModel inputPaymentIntentModel}) async {
    var paymentIntent = await createPaymentIntent(inputPaymentIntentModel);
    await initPaymentSheet(
        paymentIntentClientSecret: paymentIntent.clientSecret!);
    await displayPaymentSheet();
  }
}
