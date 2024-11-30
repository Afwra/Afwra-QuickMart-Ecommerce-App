import 'package:equatable/equatable.dart';

import 'automatic_payment_methods.dart';
import 'metadata.dart';
import 'payment_method_options.dart';

class StripePaymentIntentModel extends Equatable {
  final String? id;
  final String? object;
  final int? amount;
  final int? amountCapturable;
  final int? amountReceived;
  final dynamic application;
  final dynamic applicationFeeAmount;
  final AutomaticPaymentMethods? automaticPaymentMethods;
  final dynamic canceledAt;
  final dynamic cancellationReason;
  final String? captureMethod;
  final String? clientSecret;
  final String? confirmationMethod;
  final int? created;
  final String? currency;
  final dynamic customer;
  final dynamic description;
  final dynamic invoice;
  final dynamic lastPaymentError;
  final dynamic latestCharge;
  final bool? livemode;
  final Metadata? metadata;
  final dynamic nextAction;
  final dynamic onBehalfOf;
  final dynamic paymentMethod;
  final PaymentMethodOptions? paymentMethodOptions;
  final List<dynamic>? paymentMethodTypes;
  final dynamic processing;
  final dynamic receiptEmail;
  final dynamic review;
  final dynamic setupFutureUsage;
  final dynamic shipping;
  final dynamic source;
  final dynamic statementDescriptor;
  final dynamic statementDescriptorSuffix;
  final String? status;
  final dynamic transferData;
  final dynamic transferGroup;

  const StripePaymentIntentModel({
    this.id,
    this.object,
    this.amount,
    this.amountCapturable,
    this.amountReceived,
    this.application,
    this.applicationFeeAmount,
    this.automaticPaymentMethods,
    this.canceledAt,
    this.cancellationReason,
    this.captureMethod,
    this.clientSecret,
    this.confirmationMethod,
    this.created,
    this.currency,
    this.customer,
    this.description,
    this.invoice,
    this.lastPaymentError,
    this.latestCharge,
    this.livemode,
    this.metadata,
    this.nextAction,
    this.onBehalfOf,
    this.paymentMethod,
    this.paymentMethodOptions,
    this.paymentMethodTypes,
    this.processing,
    this.receiptEmail,
    this.review,
    this.setupFutureUsage,
    this.shipping,
    this.source,
    this.statementDescriptor,
    this.statementDescriptorSuffix,
    this.status,
    this.transferData,
    this.transferGroup,
  });

  factory StripePaymentIntentModel.fromJson(Map<String, dynamic> json) {
    return StripePaymentIntentModel(
      id: json['id'] as String?,
      object: json['object'] as String?,
      amount: json['amount'] as int?,
      amountCapturable: json['amount_capturable'] as int?,
      amountReceived: json['amount_received'] as int?,
      application: json['application'] as dynamic,
      applicationFeeAmount: json['application_fee_amount'] as dynamic,
      canceledAt: json['canceled_at'] as dynamic,
      cancellationReason: json['cancellation_reason'] as dynamic,
      captureMethod: json['capture_method'] as String?,
      clientSecret: json['client_secret'] as String?,
      confirmationMethod: json['confirmation_method'] as String?,
      created: json['created'] as int?,
      currency: json['currency'] as String?,
      customer: json['customer'] as dynamic,
      description: json['description'] as dynamic,
      invoice: json['invoice'] as dynamic,
      lastPaymentError: json['last_payment_error'] as dynamic,
      latestCharge: json['latest_charge'] as dynamic,
      livemode: json['livemode'] as bool?,
      nextAction: json['next_action'] as dynamic,
      onBehalfOf: json['on_behalf_of'] as dynamic,
      paymentMethod: json['payment_method'] as dynamic,
      paymentMethodTypes: json['payment_method_types'] as List<dynamic>?,
      processing: json['processing'] as dynamic,
      receiptEmail: json['receipt_email'] as dynamic,
      review: json['review'] as dynamic,
      setupFutureUsage: json['setup_future_usage'] as dynamic,
      shipping: json['shipping'] as dynamic,
      source: json['source'] as dynamic,
      statementDescriptor: json['statement_descriptor'] as dynamic,
      statementDescriptorSuffix: json['statement_descriptor_suffix'] as dynamic,
      status: json['status'] as String?,
      transferData: json['transfer_data'] as dynamic,
      transferGroup: json['transfer_group'] as dynamic,
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'object': object,
        'amount': amount,
        'amount_capturable': amountCapturable,
        'amount_received': amountReceived,
        'application': application,
        'application_fee_amount': applicationFeeAmount,
        'automatic_payment_methods': automaticPaymentMethods?.toJson(),
        'canceled_at': canceledAt,
        'cancellation_reason': cancellationReason,
        'capture_method': captureMethod,
        'client_secret': clientSecret,
        'confirmation_method': confirmationMethod,
        'created': created,
        'currency': currency,
        'customer': customer,
        'description': description,
        'invoice': invoice,
        'last_payment_error': lastPaymentError,
        'latest_charge': latestCharge,
        'livemode': livemode,
        'metadata': metadata?.toJson(),
        'next_action': nextAction,
        'on_behalf_of': onBehalfOf,
        'payment_method': paymentMethod,
        'payment_method_options': paymentMethodOptions?.toJson(),
        'payment_method_types': paymentMethodTypes,
        'processing': processing,
        'receipt_email': receiptEmail,
        'review': review,
        'setup_future_usage': setupFutureUsage,
        'shipping': shipping,
        'source': source,
        'statement_descriptor': statementDescriptor,
        'statement_descriptor_suffix': statementDescriptorSuffix,
        'status': status,
        'transfer_data': transferData,
        'transfer_group': transferGroup,
      };

  @override
  bool get stringify => true;

  @override
  List<Object?> get props {
    return [
      id,
      object,
      amount,
      amountCapturable,
      amountReceived,
      application,
      applicationFeeAmount,
      automaticPaymentMethods,
      canceledAt,
      cancellationReason,
      captureMethod,
      clientSecret,
      confirmationMethod,
      created,
      currency,
      customer,
      description,
      invoice,
      lastPaymentError,
      latestCharge,
      livemode,
      metadata,
      nextAction,
      onBehalfOf,
      paymentMethod,
      paymentMethodOptions,
      paymentMethodTypes,
      processing,
      receiptEmail,
      review,
      setupFutureUsage,
      shipping,
      source,
      statementDescriptor,
      statementDescriptorSuffix,
      status,
      transferData,
      transferGroup,
    ];
  }
}