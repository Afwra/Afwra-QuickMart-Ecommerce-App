import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:quick_mart/core/functions/flutter_toast.dart';
import 'package:quick_mart/core/utils/app_colors.dart';
import 'package:quick_mart/core/utils/app_routes.dart';
import 'package:quick_mart/core/utils/app_texts.dart';
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
    LoginCubit cubit = BlocProvider.of<LoginCubit>(context);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: BlocListener<LoginCubit, LoginState>(
        listener: (context, state) {
          if (state is LoginSuccess) {
            showFlutterToast(
                msg: 'Login Success',
                backGroundColor: AppColors.kBrandColorCyan);
            GoRouter.of(context).go(AppRoutes.kHomeLayout);
          } else if (state is LoginFail) {
            showFlutterToast(msg: state.message);
          }
        },
        child: BlocBuilder<LoginCubit, LoginState>(
          builder: (context, state) {
            return CustomScrollView(
              slivers: [
                const SliverToBoxAdapter(
                  child: SizedBox(
                    height: 10,
                  ),
                ),
                SliverToBoxAdapter(
                  child: CustomAuthAppBar(
                    darkMode: cubit.darkMode,
                    text: context.locale.languageCode == 'en'
                        ? AppTexts.english.tr()
                        : AppTexts.arabic.tr(),
                    onPressed: () => cubit.changeAppLocale(context),
                  ),
                ),
                const SliverToBoxAdapter(
                  child: SizedBox(
                    height: 24,
                  ),
                ),
                SliverToBoxAdapter(
                  child: AuthTitleAndSubtitle(
                    darkMode: cubit.darkMode,
                    title: AppTexts.authlogin.tr(),
                    subTitle: AppTexts.loginSubTitle.tr(),
                    buttonText: AppTexts.loginTextButton.tr(),
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
                SliverFillRemaining(
                  hasScrollBody: false,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      CustomTermsWidget(
                        darkMode: cubit.darkMode,
                      ),
                    ],
                  ),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
