import 'package:flutter/material.dart';
import 'package:quick_mart/core/utils/app_assets.dart';
import 'package:quick_mart/features/auth/presentaion/views/widgets/custom_text_field.dart';
import 'package:svg_flutter/svg.dart';

class NewPasswordView extends StatelessWidget {
  const NewPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomTextFormField(
          hintText: 'Enter Your Password',
          titleText: 'Password',
          suffix: SvgPicture.asset(AppAssets.passwordVisible),
        ),
        CustomTextFormField(
          hintText: 'Enter Your Password',
          titleText: 'Confirm Password',
          suffix: SvgPicture.asset(AppAssets.passwordVisible),
        ),
      ],
    );
  }
}
