sealed class ForgotPasswordState {}

final class ForgotPasswordInitial extends ForgotPasswordState {}

final class ForgotPasswordLoading extends ForgotPasswordState {}

final class ForgotPasswordSuccess extends ForgotPasswordState {}

final class ForgotPasswordFail extends ForgotPasswordState {}

final class ForgotPasswordChangePage extends ForgotPasswordState {}

final class ChangeVisible extends ForgotPasswordState {}
