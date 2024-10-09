import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quick_mart/core/utils/app_colors.dart';
import 'package:quick_mart/core/utils/app_texts.dart';
import 'package:quick_mart/core/widgets/custom_button.dart';
import 'package:quick_mart/features/auth/presentaion/view_models/login_cubit/login_cubit.dart';
import 'package:quick_mart/features/auth/presentaion/views/widgets/custom_google_button.dart';

class LoginButtonsBody extends StatelessWidget {
  const LoginButtonsBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    LoginCubit cubit = BlocProvider.of<LoginCubit>(context);
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: CustomButton(
                text: AppTexts.login.tr(),
                color: cubit.darkMode
                    ? AppColors.kBrandColorCyan
                    : AppColors.kBrandColorBlack,
                onPressed: () {
                  if (cubit.formKey.currentState!.validate()) {
                    cubit.login(cubit.emailController.text,
                        cubit.passwordController.text);
                  }
                },
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 16,
        ),
        Row(
          children: [
            Expanded(
              child: CustomGoogleButton(
                text: AppTexts.loginWithGoogle.tr(),
                darkMode: cubit.darkMode,
                onPressed: cubit.loginViaGoogle,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
