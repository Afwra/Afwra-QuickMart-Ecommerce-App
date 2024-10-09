import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:quick_mart/core/utils/app_assets.dart';
import 'package:quick_mart/core/utils/app_colors.dart';
import 'package:quick_mart/core/utils/app_routes.dart';
import 'package:quick_mart/features/auth/presentaion/view_models/login_cubit/login_cubit.dart';
import 'package:quick_mart/features/auth/presentaion/view_models/login_cubit/login_state.dart';
import 'package:quick_mart/features/auth/presentaion/views/widgets/custom_text_button.dart';
import 'package:quick_mart/features/auth/presentaion/views/widgets/custom_text_field.dart';
import 'package:quick_mart/features/auth/presentaion/views/widgets/login_buttons_body.dart';
import 'package:svg_flutter/svg.dart';

class LoginFormField extends StatelessWidget {
  const LoginFormField({super.key});
  @override
  Widget build(BuildContext context) {
    LoginCubit cubit = BlocProvider.of<LoginCubit>(context);
    return Form(
      key: cubit.formKey,
      child: Column(
        children: [
          CustomTextFormField(
            darkMode: cubit.darkMode,
            controller: cubit.emailController,
            hintText: 'Enter Your Email',
            titleText: 'Email',
            keyboardType: TextInputType.emailAddress,
            validator: (string) {
              if (string!.isEmpty) {
                return 'Please Enter Email';
              }
              return null;
            },
          ),
          const SizedBox(
            height: 16,
          ),
          BlocBuilder<LoginCubit, LoginState>(
            builder: (context, state) {
              return CustomTextFormField(
                darkMode: cubit.darkMode,
                controller: cubit.passwordController,
                hintText: 'Enter Your Password',
                titleText: 'Password',
                suffix: Padding(
                  padding: const EdgeInsets.only(right: 16.0),
                  child: GestureDetector(
                    onTap: cubit.changePasswordVisibility,
                    child: SvgPicture.asset(
                      AppAssets.passwordVisible,
                      colorFilter: ColorFilter.mode(
                        cubit.darkMode
                            ? Colors.white
                            : AppColors.kBrandColorBlack,
                        BlendMode.srcIn,
                      ),
                    ),
                  ),
                ),
                keyboardType: TextInputType.visiblePassword,
                obscureText: cubit.isVisible,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please Enter Password';
                  }
                  return null;
                },
              );
            },
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
          BlocBuilder<LoginCubit, LoginState>(
            builder: (context, state) {
              if (state is LoginLoading) {
                return const Center(
                    child: CircularProgressIndicator(
                  color: AppColors.kBrandColorCyan,
                ));
              }
              return const LoginButtonsBody();
            },
          ),
        ],
      ),
    );
  }
}
