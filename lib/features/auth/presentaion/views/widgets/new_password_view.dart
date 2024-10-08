import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quick_mart/core/utils/app_assets.dart';
import 'package:quick_mart/features/auth/presentaion/view_models/forgot_password_cubit/forgot_password_cubit.dart';
import 'package:quick_mart/features/auth/presentaion/view_models/forgot_password_cubit/forgot_password_state.dart';
import 'package:quick_mart/features/auth/presentaion/views/widgets/custom_text_field.dart';
import 'package:svg_flutter/svg.dart';

class NewPasswordView extends StatelessWidget {
  const NewPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    ForgotPasswordCubit cubit = BlocProvider.of<ForgotPasswordCubit>(context);
    return Form(
      key: cubit.confirmPasswordFormKey,
      child: BlocBuilder<ForgotPasswordCubit, ForgotPasswordState>(
        builder: (context, state) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomTextFormField(
                hintText: 'Enter Your Password',
                titleText: 'Password',
                obscureText: cubit.field1Visible,
                controller: cubit.passwordController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please Enter Password';
                  }
                  return null;
                },
                suffix: GestureDetector(
                    onTap: cubit.changeField1Visible,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SvgPicture.asset(AppAssets.passwordVisible),
                    )),
              ),
              CustomTextFormField(
                hintText: 'Enter Your Password',
                titleText: 'Confirm Password',
                obscureText: cubit.field2Visible,
                controller: cubit.confirmPasswordController,
                validator: (value) {
                  if (value!.isEmpty ||
                      value != cubit.passwordController.text) {
                    return 'Please Check Password';
                  }
                  return null;
                },
                suffix: GestureDetector(
                    onTap: cubit.changeField2Visible,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SvgPicture.asset(AppAssets.passwordVisible),
                    )),
              ),
            ],
          );
        },
      ),
    );
  }
}
