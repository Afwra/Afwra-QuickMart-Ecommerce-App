import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quick_mart/core/utils/service_locator.dart';
import 'package:quick_mart/features/auth/data/repos/auth_repo_impl.dart';
import 'package:quick_mart/features/auth/presentaion/view_models/login_cubit/login_cubit.dart';
import 'package:quick_mart/features/auth/presentaion/views/widgets/login_view_body.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: BlocProvider(
        create: (context) => LoginCubit(getIt.get<AuthRepoImpl>()),
        child: const LoginViewBody(),
      )),
    );
  }
}
