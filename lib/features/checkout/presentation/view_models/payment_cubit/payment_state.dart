sealed class PaymentState {}

final class PaymentCubitInitial extends PaymentState {}

final class PaymentCubitLoading extends PaymentState {}

final class PaymentCubitSuccess extends PaymentState {}

final class PaymentCubitFail extends PaymentState {}
