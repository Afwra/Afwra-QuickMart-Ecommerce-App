import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quick_mart/core/utils/app_assets.dart';
import 'package:quick_mart/core/utils/app_colors.dart';
import 'package:quick_mart/core/widgets/custom_button.dart';
import 'package:quick_mart/core/widgets/custom_button_with_icon.dart';
import 'package:quick_mart/features/auth/presentaion/view_models/login_cubit/login_cubit.dart';

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
                text: 'Login',
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
              child: CustomButtonWithIcon(
                onPressed: () {
                  cubit.loginViaGoogle();
                },
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
