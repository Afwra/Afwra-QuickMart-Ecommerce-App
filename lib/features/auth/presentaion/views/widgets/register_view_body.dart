import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:quick_mart/core/functions/flutter_toast.dart';
import 'package:quick_mart/core/utils/app_colors.dart';
import 'package:quick_mart/core/utils/app_routes.dart';
import 'package:quick_mart/core/utils/app_texts.dart';
import 'package:quick_mart/features/auth/presentaion/view_models/register_cubit/register_cubit.dart';
import 'package:quick_mart/features/auth/presentaion/view_models/register_cubit/register_state.dart';
import 'package:quick_mart/features/auth/presentaion/views/widgets/auth_title_and_subtitle.dart';
import 'package:quick_mart/features/auth/presentaion/views/widgets/custom_auth_app_bar.dart';
import 'package:quick_mart/features/auth/presentaion/views/widgets/register_form_field.dart';

class RegisterViewBody extends StatelessWidget {
  const RegisterViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<RegisterCubit>(context);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: BlocListener<RegisterCubit, RegisterState>(
        listener: (context, state) {
          if (state is RegisterSuccess) {
            showFlutterToast(
                msg: 'Register Success',
                backGroundColor: AppColors.kBrandColorCyan);
            GoRouter.of(context).go(AppRoutes.kHomeView);
          } else if (state is RegisterFail) {
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
            SliverToBoxAdapter(
              child: CustomAuthAppBar(
                darkMode: cubit.darkMode,
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
                title: AppTexts.register.tr(),
                subTitle: AppTexts.registerSubTitle.tr(),
                buttonText: AppTexts.registerTextButton.tr(),
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
      ),
    );
  }
}
