import 'package:flutter/material.dart';
import 'package:quick_mart/features/profile/presentation/views/widgets/change_password_section/new_password_section.dart';
import 'package:quick_mart/features/profile/presentation/views/widgets/change_password_section/old_password_section.dart';

class CustomChangePasswordPageView extends StatelessWidget {
  const CustomChangePasswordPageView({super.key});
  final List<Widget> _passwordPages = const [
    OldPasswordSection(),
    NewPasswordSection(),
  ];
  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      itemBuilder: (context, index) => _passwordPages[index],
      itemCount: _passwordPages.length,
      physics: const NeverScrollableScrollPhysics(),
    );
  }
}
