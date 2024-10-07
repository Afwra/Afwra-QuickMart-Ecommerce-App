import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quick_mart/core/utils/app_colors.dart';
import 'package:quick_mart/core/widgets/custom_button.dart';
import 'package:quick_mart/features/auth/presentaion/views/widgets/auth_title_and_subtitle.dart';
import 'package:quick_mart/features/auth/presentaion/views/widgets/custom_auth_app_bar.dart';
import 'package:quick_mart/features/auth/presentaion/views/widgets/custom_google_button.dart';
import 'package:quick_mart/features/auth/presentaion/views/widgets/custom_text_button.dart';
import 'package:quick_mart/features/auth/presentaion/views/widgets/custom_text_field.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CustomAuthAppBar(),
          const SizedBox(
            height: 24,
          ),
          AuthTitleAndSubtitle(
            title: 'Login',
            subTitle: 'Don\'t have an account?',
            buttonText: 'Sign Up',
            onPressed: () {},
          ),
          const SizedBox(
            height: 32,
          ),
          const CustomTextFormField(
            hintText: 'Enter Your Email',
            titleText: 'Email',
            keyboardType: TextInputType.emailAddress,
          ),
          const SizedBox(
            height: 16,
          ),
          const CustomTextFormField(
            hintText: 'Enter Your Password',
            titleText: 'Password',
            keyboardType: TextInputType.visiblePassword,
          ),
          const SizedBox(
            height: 24,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              CustomTextButton(
                  buttonText: 'Forgot Password?', onPressed: () {}),
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
                child: CustomGoogleButton(
                  text: 'Login With Google',
                  color: Colors.white,
                  textColor: AppColors.kBrandColorBlack,
                  borderColor: AppColors.kGrey50,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
