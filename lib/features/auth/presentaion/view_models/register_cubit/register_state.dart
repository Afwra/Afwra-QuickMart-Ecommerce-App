sealed class RegisterState {}

final class RegisterInitial extends RegisterState {}

final class ChangePasswordVisibility extends RegisterState {}

final class RegisterSuccess extends RegisterState {
  final String token;
  RegisterSuccess(this.token);
}

final class RegisterFail extends RegisterState {
  final String message;
  RegisterFail(this.message);
}

final class RegisterLoading extends RegisterState {}
