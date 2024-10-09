import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:quick_mart/core/utils/app_texts.dart';
import 'package:quick_mart/features/auth/presentaion/views/widgets/confirmation_email_view.dart';
import 'package:quick_mart/features/auth/presentaion/views/widgets/email_verification_view.dart';
import 'package:quick_mart/features/auth/presentaion/views/widgets/new_password_view.dart';

class ForgetPasswordViewModel {
  final String title, subTitle, buttonText;
  final Widget widget;

  ForgetPasswordViewModel({
    required this.title,
    required this.subTitle,
    required this.buttonText,
    required this.widget,
  });
}

List<ForgetPasswordViewModel> forgetPasswordList = [
  ForgetPasswordViewModel(
    title: AppTexts.forgotPasswordBody1.tr(),
    subTitle: AppTexts.forgotPasswordSubBody1.tr(),
    buttonText: AppTexts.send.tr(),
    widget: const ConformationEmailView(),
  ),
  ForgetPasswordViewModel(
    title: AppTexts.forgotPasswordBody2.tr(),
    subTitle: AppTexts.forgotPasswordSubBody2.tr(),
    buttonText: AppTexts.proceed.tr(),
    widget: const EmailVerificationView(),
  ),
  ForgetPasswordViewModel(
    title: AppTexts.forgotPasswordBody3.tr(),
    subTitle: AppTexts.forgotPasswordSubBody3.tr(),
    buttonText: AppTexts.save.tr(),
    widget: const NewPasswordView(),
  ),
];
