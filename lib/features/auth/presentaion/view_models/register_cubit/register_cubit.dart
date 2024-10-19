import 'dart:developer';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quick_mart/core/functions/hive_functions.dart';
import 'package:quick_mart/core/utils/app_settings.dart';
import 'package:quick_mart/features/auth/data/repos/auth_repo.dart';
import 'package:quick_mart/features/auth/presentaion/view_models/register_cubit/register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit(this.authRepo) : super(RegisterInitial());
  final AuthRepo authRepo;
  void register(
      String name, String email, String password, String phoneNumber) async {
    emit(RegisterLoading());
    var result = await authRepo.register(
        name: name, email: email, password: password, phoneNumber: phoneNumber);

    result.fold(
      (fail) {
        emit(RegisterFail(fail.errMsg));
        log('register -- ${fail.errMsg}');
      },
      (login) {
        saveLoginToken(login.token);
        emit(RegisterSuccess(login.token));
        log('register -- ${login.token}');
      },
    );
  }

  void loginViaGoogle() async {
    emit(RegisterLoading());
    var result = await authRepo.loginViaGoogle();
    result.fold(
      (fail) {
        emit(RegisterFail(fail.errMsg));
        log('login -- ${fail.errMsg}');
      },
      (login) {
        emit(RegisterSuccess(login.token));
        log('login -- ${login.token}');
      },
    );
  }

  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final nameController = TextEditingController();
  final passwordController = TextEditingController();
  final phoneNumberController = TextEditingController();
  bool isVisible = true;

  void changeAppLocale(BuildContext context) {
    context.locale.languageCode == 'en'
        ? context.setLocale(const Locale('ar'))
        : context.setLocale(const Locale('en'));
    saveLanguageCode(context.locale.languageCode);
    AppSettings.langCode = context.locale.languageCode;

    emit(ChangeAppLocale());
  }

  void changePasswordVisibility() {
    isVisible = !isVisible;
    emit(ChangePasswordVisibility());
  }

  String? validateTextField(String? value, String text) {
    if (value!.isEmpty) {
      return text;
    }
    return null;
  }

  void validateForm() {
    if (formKey.currentState!.validate()) {
      register(nameController.text, emailController.text,
          passwordController.text, phoneNumberController.text);
    }
  }

  @override
  Future<void> close() {
    emailController.dispose();
    nameController.dispose();
    passwordController.dispose();
    phoneNumberController.dispose();
    return super.close();
  }
}
