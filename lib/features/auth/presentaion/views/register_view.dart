import 'package:flutter/material.dart';
import 'package:quick_mart/features/auth/presentaion/views/widgets/register_view_body.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(child: RegisterViewBody()),
    );
  }
}
