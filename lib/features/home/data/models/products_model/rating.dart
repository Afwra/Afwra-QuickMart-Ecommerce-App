import 'package:equatable/equatable.dart';

class Rating extends Equatable {
  final double? rate;
  final int? count;

  const Rating({this.rate, this.count});

  factory Rating.fromJson(Map<String, dynamic> json) => Rating(
        rate: (json['rate'] as num?)?.toDouble(),
        count: json['count'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'rate': rate,
        'count': count,
      };

  Rating copyWith({
    double? rate,
    int? count,
  }) {
    return Rating(
      rate: rate ?? this.rate,
      count: count ?? this.count,
    );
  }

  @override
  List<Object?> get props => [rate, count];
}
