sealed class LoginState {}

final class LoginInitial extends LoginState {}

final class LoginSuccess extends LoginState {
  final String token;
  LoginSuccess(this.token);
}

final class LoginFail extends LoginState {
  final String message;
  LoginFail(this.message);
}

final class LoginLoading extends LoginState {}
