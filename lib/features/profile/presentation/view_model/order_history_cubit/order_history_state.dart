sealed class OrderHistoryState {}

final class OrderHistoryInitial extends OrderHistoryState {}

final class OrderHistoryLoading extends OrderHistoryState {}

final class OrderHistorySuccess extends OrderHistoryState {}

final class OrderHistoryFail extends OrderHistoryState {}
