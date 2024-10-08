import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quick_mart/features/auth/presentaion/view_models/forgot_password_cubit/forgot_password_cubit.dart';
import 'package:quick_mart/features/auth/presentaion/views/widgets/custom_text_field.dart';

class ConformationEmailView extends StatelessWidget {
  const ConformationEmailView({super.key});

  @override
  Widget build(BuildContext context) {
    ForgotPasswordCubit cubit = BlocProvider.of<ForgotPasswordCubit>(context);
    return Form(
      key: cubit.formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomTextFormField(
            hintText: 'Enter Your Email',
            titleText: 'Email',
            keyboardType: TextInputType.emailAddress,
            controller: cubit.emailController,
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please Enter Email';
              }
              return null;
            },
          ),
        ],
      ),
    );
  }
}
