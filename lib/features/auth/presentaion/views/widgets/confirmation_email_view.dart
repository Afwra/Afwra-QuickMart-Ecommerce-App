import 'package:flutter/material.dart';
import 'package:quick_mart/features/auth/presentaion/views/widgets/custom_text_field.dart';

class ConformationEmailView extends StatelessWidget {
  const ConformationEmailView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomTextFormField(hintText: 'Enter Your Email', titleText: 'Email'),
      ],
    );
  }
}
