import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
        emit(LoginSuccess(login.token));
        log('login -- ${login.token}');
      },
    );
  }

  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
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
