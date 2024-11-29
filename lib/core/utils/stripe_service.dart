import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:quick_mart/core/utils/api_keys.dart';
import 'package:quick_mart/core/utils/api_service.dart';
import 'package:quick_mart/features/checkout/data/models/stripe_models/input_payment_intent_model.dart';
import 'package:quick_mart/features/checkout/data/models/stripe_models/stripe_customer_model.dart';
import 'package:quick_mart/features/checkout/data/models/stripe_models/stripe_ephemeral_key_model/stripe_ephemeral_key_model.dart';
import 'package:quick_mart/features/checkout/data/models/stripe_models/stripe_payment_intent_model/stripe_payment_intent_model.dart';

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

  Future initPaymentSheet(
      {required String paymentIntentClientSecret,
      required String ephemeralKey,
      required String customerId}) async {
    await Stripe.instance.initPaymentSheet(
      paymentSheetParameters: SetupPaymentSheetParameters(
        paymentIntentClientSecret: paymentIntentClientSecret,
        customerId: customerId,
        customerEphemeralKeySecret: ephemeralKey,
        merchantDisplayName: 'Quick Mart',
      ),
    );
  }

  Future displayPaymentSheet() async {
    await Stripe.instance.presentPaymentSheet();
  }

  Future makePayment({
    required InputPaymentIntentModel inputPaymentIntentModel,
  }) async {
    var paymentIntent = await createPaymentIntent(inputPaymentIntentModel);
    var ephemeralKey = await createCustomerEphemeralKey(
        customerId: inputPaymentIntentModel.customerId);
    await initPaymentSheet(
        paymentIntentClientSecret: paymentIntent.clientSecret!,
        customerId: inputPaymentIntentModel.customerId,
        ephemeralKey: ephemeralKey.secret!);
    await displayPaymentSheet();
  }

  Future<StripeCustomerModel> createCustomer(
      {required String customerName, required String customerEmail}) async {
    var response = await apiService.post(
      inputUrl: 'https://api.stripe.com/v1/customers',
      endpoint: '',
      headers: {
        'Authorization': 'Bearer ${ApiKeys.stripeTestApiKey}',
        'Content-Type': 'application/x-www-form-urlencoded',
      },
      data: {'name': customerName, 'email': customerEmail},
    );

    return StripeCustomerModel.fromJson(response);
  }

  Future<StripeEphemeralKeyModel> createCustomerEphemeralKey(
      {required String customerId}) async {
    var response = await apiService.post(
      inputUrl: 'https://api.stripe.com/v1/ephemeral_keys',
      endpoint: '',
      headers: {
        'Authorization': 'Bearer ${ApiKeys.stripeTestApiKey}',
        'Content-Type': 'application/x-www-form-urlencoded',
        'Stripe-Version': '2024-11-20.acacia',
      },
      data: {'customer': 'cus_RJ4On7Ufz8Kmtc'},
    );

    return StripeEphemeralKeyModel.fromJson(response);
  }
}
