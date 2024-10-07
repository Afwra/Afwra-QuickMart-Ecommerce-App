import 'package:flutter/material.dart';
import 'package:quick_mart/features/auth/presentaion/views/widgets/custom_pin_code_text_field.dart';
import 'package:quick_mart/features/auth/presentaion/views/widgets/custom_text_button.dart';

class EmailVerificationView extends StatelessWidget {
  const EmailVerificationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CustomPinCodeTextField(),
        const SizedBox(
          height: 16,
        ),
        CustomTextButton(buttonText: 'Resend Code', onPressed: () {}),
      ],
    );
  }
}