class InputPaymentIntentModel {
  final String amount;
  final String currency;
  final String customerId;

  InputPaymentIntentModel(
      {required this.amount, required this.currency, required this.customerId});

  toJson() => {
        'amount': '${num.parse(amount).round() * 100}',
        'currency': currency,
        'customer': customerId,
      };
}
