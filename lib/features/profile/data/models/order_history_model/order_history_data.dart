import 'package:equatable/equatable.dart';

class OrderHistoryData extends Equatable {
  final int? id;
  final int? total;
  final String? date;
  final String? status;

  const OrderHistoryData({this.id, this.total, this.date, this.status});

  factory OrderHistoryData.fromJson(Map<String, dynamic> json) =>
      OrderHistoryData(
        id: json['id'] as int?,
        total: json['total'] as int?,
        date: json['date'] as String?,
        status: json['status'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'total': total,
        'date': date,
        'status': status,
      };

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [id, total, date, status];
}
