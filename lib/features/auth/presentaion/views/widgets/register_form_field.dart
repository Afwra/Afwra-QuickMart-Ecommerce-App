import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quick_mart/core/utils/app_assets.dart';
import 'package:quick_mart/core/utils/app_colors.dart';
import 'package:quick_mart/features/auth/presentaion/view_models/register_cubit/register_cubit.dart';
import 'package:quick_mart/features/auth/presentaion/view_models/register_cubit/register_state.dart';
import 'package:quick_mart/features/auth/presentaion/views/widgets/custom_text_field.dart';
import 'package:quick_mart/features/auth/presentaion/views/widgets/register_button_body.dart';
import 'package:svg_flutter/svg.dart';

class RegisterFormField extends StatelessWidget {
  const RegisterFormField({super.key});

  @override
  Widget build(BuildContext context) {
    RegisterCubit cubit = BlocProvider.of<RegisterCubit>(context);
    return Form(
      key: cubit.formKey,
      child: Column(
        children: [
          CustomTextFormField(
            controller: cubit.nameController,
            validator: (value) {
              return cubit.validateTextField(value, 'Enter Your Name');
            },
            hintText: 'Enter Your Name',
            titleText: 'Full Name',
            keyboardType: TextInputType.emailAddress,
          ),
          CustomTextFormField(
            controller: cubit.emailController,
            validator: (value) =>
                cubit.validateTextField(value, 'Enter Your Email'),
            hintText: 'Enter Your Email',
            titleText: 'Email',
            keyboardType: TextInputType.emailAddress,
          ),
          const SizedBox(
            height: 16,
          ),
          BlocBuilder<RegisterCubit, RegisterState>(
            builder: (context, state) {
              return CustomTextFormField(
                hintText: 'Enter Your Password',
                controller: cubit.passwordController,
                validator: (value) =>
                    cubit.validateTextField(value, 'Enter Your Password'),
                titleText: 'Password',
                obscureText: cubit.isVisible,
                suffix: GestureDetector(
                  onTap: () => cubit.changePasswordVisibility(),
                  child: Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: SvgPicture.asset(
                      AppAssets.passwordVisible,
                    ),
                  ),
                ),
                keyboardType: TextInputType.visiblePassword,
              );
            },
          ),
          const SizedBox(
            height: 24,
          ),
          BlocBuilder<RegisterCubit, RegisterState>(
            builder: (context, state) {
              if (state is RegisterLoading) {
                return const Center(
                  child: CircularProgressIndicator(
                    color: AppColors.kBrandColorCyan,
                  ),
                );
              }
              return const RegisterButtonBody();
            },
          ),
        ],
      ),
    );
  }
}
