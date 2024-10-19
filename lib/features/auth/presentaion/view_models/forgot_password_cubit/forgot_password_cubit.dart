import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:quick_mart/core/utils/app_routes.dart';
import 'package:quick_mart/features/auth/presentaion/view_models/forgot_password_cubit/forgot_password_state.dart';

class ForgotPasswordCubit extends Cubit<ForgotPasswordState> {
  ForgotPasswordCubit() : super(ForgotPasswordInitial());

  var formKey = GlobalKey<FormState>();
  var pinFormKey = GlobalKey<FormState>();
  var confirmPasswordFormKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController codeController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  var pageController = PageController();
  int pageIndex = 0;

  void buttonLogic(BuildContext context) {
    if (pageIndex == 0) {
      if (formKey.currentState!.validate()) {
        emit(ForgotPasswordLoading());

        Timer(const Duration(seconds: 2), () {
          pageIndex += 1;
          pageController.nextPage(
              duration: const Duration(milliseconds: 300),
              curve: Curves.bounceInOut);
          emit(ForgotPasswordChangePage());
        });
      }
    } else if (pageIndex == 1) {
      if (pinFormKey.currentState!.validate()) {
        emit(ForgotPasswordLoading());

        Timer(const Duration(seconds: 2), () {
          pageIndex += 1;
          pageController.nextPage(
              duration: const Duration(milliseconds: 300),
              curve: Curves.bounceInOut);
          emit(ForgotPasswordChangePage());
        });
      }
    } else if (pageIndex == 2) {
      if (confirmPasswordFormKey.currentState!.validate()) {
        emit(ForgotPasswordLoading());

        Timer(const Duration(seconds: 2), () {
          emit(ForgotPasswordChangePage());

          GoRouter.of(context).go(AppRoutes.kPasswordChangeSuccess);
        });
      }
    }
  }

  bool field1Visible = true;
  void changeField1Visible() {
    field1Visible = !field1Visible;
    emit(ChangeVisible());
  }

  bool field2Visible = true;
  void changeField2Visible() {
    field2Visible = !field2Visible;
    emit(ChangeVisible());
  }

  @override
  Future<void> close() {
    pageController.dispose();
    return super.close();
  }
}
