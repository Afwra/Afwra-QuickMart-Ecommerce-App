import 'dart:developer';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quick_mart/core/functions/hive_functions.dart';
import 'package:quick_mart/features/auth/data/repos/auth_repo.dart';
import 'package:quick_mart/features/auth/presentaion/view_models/login_cubit/login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this.authRepo) : super(LoginInitial());

  final AuthRepo authRepo;
  void login(String email, String password) async {
    emit(LoginLoading());
    var result = await authRepo.login(email: email, password: password);
    result.fold(
      (fail) {
        emit(LoginFail(fail.errMsg));
        log('login -- ${fail.errMsg}');
      },
      (login) {
        saveLoginToken(login.token);
        emit(LoginSuccess(login.token));
        log('login -- ${login.token}');
      },
    );
  }

  void loginViaGoogle() async {
    emit(LoginLoading());
    var result = await authRepo.loginViaGoogle();
    result.fold(
      (fail) {
        emit(LoginFail(fail.errMsg));
        log('login -- ${fail.errMsg}');
      },
      (login) {
        emit(LoginSuccess(login.token));
        log('login -- ${login.token}');
      },
    );
  }

  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  late bool darkMode;
  void setupDarkMode() {
    darkMode = getDarkMode();
  }

  void changeAppLocale(BuildContext context) {
    context.locale.languageCode == 'en'
        ? context.setLocale(const Locale('ar'))
        : context.setLocale(const Locale('en'));
    emit(ChangeAppLocale());
  }

  bool isVisible = true;
  void changePasswordVisibility() {
    isVisible = !isVisible;
    emit(ChangePasswordVisibility());
  }

  @override
  Future<void> close() {
    emailController.dispose();
    passwordController.dispose();
    return super.close();
  }
}
