import 'details.dart';

class PaypalAmountModel {
  String? total;
  String? currency;
  Details? details;

  PaypalAmountModel({this.total, this.currency, this.details});

  factory PaypalAmountModel.fromJson(Map<String, dynamic> json) {
    return PaypalAmountModel(
      total: json['total'] as String?,
      currency: json['currency'] as String?,
      details: json['details'] == null
          ? null
          : Details.fromJson(json['details'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() => {
        'total': total,
        'currency': currency,
        'details': details?.toJson(),
      };
}
