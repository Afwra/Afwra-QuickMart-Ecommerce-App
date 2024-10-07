import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:quick_mart/core/utils/app_colors.dart';
import 'package:quick_mart/core/utils/app_routes.dart';
import 'package:quick_mart/core/utils/app_text_styles.dart';
import 'package:quick_mart/core/widgets/custom_button.dart';
import 'package:quick_mart/features/auth/data/models/forget_password_view_model.dart';
import 'package:quick_mart/features/auth/presentaion/views/widgets/custom_forgot_password_app_bar.dart';

class ForgotPasswordBody extends StatelessWidget {
  const ForgotPasswordBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const CustomForgotPasswordAppBar(),
        const SizedBox(
          height: 10,
        ),
        const Divider(
          height: 3,
          thickness: 2,
          color: AppColors.kGrey50,
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          'Confirmation Email',
          style: AppTextStyles.heading2Bold,
        ),
        const SizedBox(
          height: 8,
        ),
        Text(
          'Enter your email address for verification.',
          style: AppTextStyles.body2Regular.copyWith(color: AppColors.kGrey150),
        ),
        const SizedBox(
          height: 16,
        ),
        Flexible(child: const ForgotPasswordPageView()),
        const SizedBox(
          height: 24,
        ),
        Row(
          children: [
            Expanded(
                child: CustomButton(
              text: 'Send',
              onPressed: () {
                GoRouter.of(context).go(AppRoutes.kPasswordChangeSuccess);
              },
            )),
          ],
        ),
      ],
    );
  }
}

class ForgotPasswordPageView extends StatelessWidget {
  const ForgotPasswordPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      itemBuilder: (context, index) => forgetPasswordList[index].widget,
      itemCount: forgetPasswordList.length,
    );
  }
}
