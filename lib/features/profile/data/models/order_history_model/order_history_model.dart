import 'package:equatable/equatable.dart';

import 'order_history_data.dart';

class OrderHistoryModel extends Equatable {
  final List<OrderHistoryData>? data;

  const OrderHistoryModel({this.data});

  factory OrderHistoryModel.fromJson(Map<String, dynamic> json) {
    return OrderHistoryModel(
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => OrderHistoryData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
        'data': data?.map((e) => e.toJson()).toList(),
      };

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [data];
}
