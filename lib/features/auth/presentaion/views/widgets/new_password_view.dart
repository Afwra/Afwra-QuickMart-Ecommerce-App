import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quick_mart/core/utils/app_assets.dart';
import 'package:quick_mart/core/utils/app_settings.dart';
import 'package:quick_mart/core/utils/app_texts.dart';
import 'package:quick_mart/features/auth/presentaion/view_models/forgot_password_cubit/forgot_password_cubit.dart';
import 'package:quick_mart/features/auth/presentaion/view_models/forgot_password_cubit/forgot_password_state.dart';
import 'package:quick_mart/core/widgets/custom_text_field.dart';
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
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomTextFormField(
                  darkMode: AppSettings.darkMode,
                  hintText: AppTexts.enterPassword.tr(),
                  titleText: AppTexts.password.tr(),
                  obscureText: cubit.field1Visible,
                  controller: cubit.passwordController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return AppTexts.enterPassword.tr();
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
                  darkMode: AppSettings.darkMode,
                  hintText: AppTexts.enterPassword.tr(),
                  titleText: AppTexts.password.tr(),
                  obscureText: cubit.field2Visible,
                  controller: cubit.confirmPasswordController,
                  validator: (value) {
                    if (value!.isEmpty ||
                        value != cubit.passwordController.text) {
                      return AppTexts.confirmPasswordMessage.tr();
                    }
                    return null;
                  },
                  suffix: GestureDetector(
                      onTap: cubit.changeField2Visible,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: SvgPicture.asset(AppAssets.passwordVisible),
                      )),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
