import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:quick_mart/core/functions/flutter_toast.dart';
import 'package:quick_mart/core/utils/app_colors.dart';
import 'package:quick_mart/core/utils/app_routes.dart';
import 'package:quick_mart/features/auth/presentaion/view_models/login_cubit/login_cubit.dart';
import 'package:quick_mart/features/auth/presentaion/view_models/login_cubit/login_state.dart';
import 'package:quick_mart/features/auth/presentaion/views/widgets/auth_title_and_subtitle.dart';
import 'package:quick_mart/features/auth/presentaion/views/widgets/custom_auth_app_bar.dart';
import 'package:quick_mart/features/auth/presentaion/views/widgets/custom_terms_widget.dart';
import 'package:quick_mart/features/auth/presentaion/views/widgets/login_form_field.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: BlocListener<LoginCubit, LoginState>(
        listener: (context, state) {
          if (state is LoginSuccess) {
            showFlutterToast(
                msg: 'Login Success',
                backGroundColor: AppColors.kBrandColorCyan);
            GoRouter.of(context).go(AppRoutes.kHomeView);
          } else if (state is LoginFail) {
            showFlutterToast(msg: state.message);
          }
        },
        child: CustomScrollView(
          slivers: [
            const SliverToBoxAdapter(
              child: SizedBox(
                height: 10,
              ),
            ),
            const SliverToBoxAdapter(
              child: CustomAuthAppBar(),
            ),
            const SliverToBoxAdapter(
              child: SizedBox(
                height: 24,
              ),
            ),
            SliverToBoxAdapter(
              child: AuthTitleAndSubtitle(
                title: 'Login',
                subTitle: 'Don\'t have an account?',
                buttonText: 'Sign Up',
                onPressed: () {
                  GoRouter.of(context).go(AppRoutes.kRegisterView);
                },
              ),
            ),
            const SliverToBoxAdapter(
              child: SizedBox(
                height: 32,
              ),
            ),
            const SliverToBoxAdapter(
              child: LoginFormField(),
            ),
            const SliverFillRemaining(
              hasScrollBody: false,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  CustomTermsWidget(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
