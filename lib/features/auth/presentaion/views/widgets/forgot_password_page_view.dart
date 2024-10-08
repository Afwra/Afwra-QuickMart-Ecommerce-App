import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quick_mart/features/auth/data/models/forget_password_view_model.dart';
import 'package:quick_mart/features/auth/presentaion/view_models/forgot_password_cubit/forgot_password_cubit.dart';

class ForgotPasswordPageView extends StatelessWidget {
  const ForgotPasswordPageView({super.key});

  @override
  Widget build(BuildContext context) {
    ForgotPasswordCubit cubit = BlocProvider.of<ForgotPasswordCubit>(context);
    return PageView.builder(
      controller: cubit.pageController,
      itemBuilder: (context, index) => forgetPasswordList[index].widget,
      itemCount: forgetPasswordList.length,
      physics: const NeverScrollableScrollPhysics(),
    );
  }
}
