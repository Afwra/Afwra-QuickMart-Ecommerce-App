import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:quick_mart/core/utils/app_routes.dart';
import 'package:quick_mart/features/auth/presentaion/views/widgets/auth_title_and_subtitle.dart';
import 'package:quick_mart/features/auth/presentaion/views/widgets/custom_auth_app_bar.dart';
import 'package:quick_mart/features/auth/presentaion/views/widgets/register_form_field.dart';

class RegisterViewBody extends StatelessWidget {
  const RegisterViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
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
              title: 'Sign Up',
              subTitle: 'Already have an account?',
              buttonText: 'Login',
              onPressed: () {
                GoRouter.of(context).go(AppRoutes.kLoginView);
              },
            ),
          ),
          const SliverToBoxAdapter(
            child: SizedBox(
              height: 32,
            ),
          ),
          const SliverToBoxAdapter(
            child: RegisterFormField(),
          ),
        ],
      ),
    );
  }
}
