import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:quick_mart/core/utils/app_assets.dart';
import 'package:quick_mart/core/utils/app_colors.dart';
import 'package:quick_mart/core/utils/app_routes.dart';
import 'package:quick_mart/core/widgets/custom_button.dart';
import 'package:quick_mart/core/widgets/custom_button_with_icon.dart';
import 'package:quick_mart/features/auth/presentaion/views/widgets/custom_text_button.dart';
import 'package:quick_mart/features/auth/presentaion/views/widgets/custom_text_field.dart';
import 'package:svg_flutter/svg.dart';

class LoginFormField extends StatelessWidget {
  const LoginFormField({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
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
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            CustomTextButton(
                buttonText: 'Forgot Password?',
                onPressed: () {
                  GoRouter.of(context).push(AppRoutes.kForgotPasswordView);
                }),
          ],
        ),
        const SizedBox(
          height: 24,
        ),
        Row(
          children: [
            Expanded(
              child: CustomButton(
                text: 'Login',
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
                text: 'Login With Google',
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
