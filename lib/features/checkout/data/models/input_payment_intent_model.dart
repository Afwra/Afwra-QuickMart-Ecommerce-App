class InputPaymentIntentModel {
  final String amount;
  final String currency;

  InputPaymentIntentModel({required this.amount, required this.currency});

  toJson() => {
        'amount': '${amount}00',
        'currency': currency,
      };
}
