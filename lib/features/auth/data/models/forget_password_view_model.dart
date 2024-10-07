import 'package:flutter/material.dart';
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
    title: 'Confirmation Email',
    subTitle: 'Enter your email address for verification.',
    buttonText: 'Send',
    widget: const ConformationEmailView(),
  ),
  ForgetPasswordViewModel(
    title: 'Email Verification',
    subTitle: 'Enter the 6-digit verification code send to your email address.',
    buttonText: 'Proceed',
    widget: const EmailVerificationView(),
  ),
  ForgetPasswordViewModel(
    title: 'New Password',
    subTitle: 'Enter your new password and remember it.',
    buttonText: 'Save',
    widget: const NewPasswordView(),
  ),
];
