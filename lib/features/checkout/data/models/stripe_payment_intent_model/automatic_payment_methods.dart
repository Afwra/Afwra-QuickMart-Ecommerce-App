import 'package:equatable/equatable.dart';

class AutomaticPaymentMethods extends Equatable {
  final bool? enabled;

  const AutomaticPaymentMethods({this.enabled});

  factory AutomaticPaymentMethods.fromJson(Map<String, dynamic> json) {
    return AutomaticPaymentMethods(
      enabled: json['enabled'] as bool?,
    );
  }

  Map<String, dynamic> toJson() => {
        'enabled': enabled,
      };

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [enabled];
}
