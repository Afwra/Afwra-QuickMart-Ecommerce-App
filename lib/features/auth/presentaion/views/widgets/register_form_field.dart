import 'package:flutter/material.dart';
import 'package:quick_mart/core/utils/app_assets.dart';
import 'package:quick_mart/core/utils/app_colors.dart';
import 'package:quick_mart/core/widgets/custom_button.dart';
import 'package:quick_mart/core/widgets/custom_button_with_icon.dart';
import 'package:quick_mart/features/auth/presentaion/views/widgets/custom_text_field.dart';
import 'package:svg_flutter/svg.dart';

class RegisterFormField extends StatelessWidget {
  const RegisterFormField({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CustomTextFormField(
          hintText: 'Enter Your Name',
          titleText: 'Full Name',
          keyboardType: TextInputType.emailAddress,
        ),
        const CustomTextFormField(
          hintText: 'Enter Your Email',
          titleText: 'Email',
          keyboardType: TextInputType.emailAddress,
        ),
        const SizedBox(
          height: 16,
        ),
        CustomTextFormField(
          hintText: 'Enter Your Password',
          titleText: 'Password',
          suffix: Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: SvgPicture.asset(
              AppAssets.passwordVisible,
            ),
          ),
          keyboardType: TextInputType.visiblePassword,
        ),
        const SizedBox(
          height: 24,
        ),
        Row(
          children: [
            Expanded(
              child: CustomButton(
                text: 'Create Account',
                onPressed: () {},
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 16,
        ),
        const Row(
          children: [
            Expanded(
              child: CustomButtonWithIcon(
                text: 'Signup With Google',
                iconPath: AppAssets.google,
                color: Colors.white,
                textColor: AppColors.kBrandColorBlack,
                borderColor: AppColors.kGrey50,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
