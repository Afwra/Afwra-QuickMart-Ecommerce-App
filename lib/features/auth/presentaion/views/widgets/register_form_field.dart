import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quick_mart/core/utils/app_assets.dart';
import 'package:quick_mart/core/utils/app_colors.dart';
import 'package:quick_mart/core/utils/app_settings.dart';
import 'package:quick_mart/core/utils/app_texts.dart';
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
    return BlocBuilder<RegisterCubit, RegisterState>(
      builder: (context, state) {
        return Form(
          key: cubit.formKey,
          child: Column(
            children: [
              CustomTextFormField(
                darkMode: AppSettings.darkMode,
                controller: cubit.nameController,
                validator: (value) {
                  return cubit.validateTextField(
                      value, AppTexts.enterName.tr());
                },
                hintText: AppTexts.enterName.tr(),
                titleText: AppTexts.name.tr(),
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(
                height: 16,
              ),
              CustomTextFormField(
                darkMode: AppSettings.darkMode,
                controller: cubit.emailController,
                validator: (value) =>
                    cubit.validateTextField(value, AppTexts.enterEmail.tr()),
                hintText: AppTexts.enterEmail.tr(),
                titleText: AppTexts.email.tr(),
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(
                height: 16,
              ),
              CustomTextFormField(
                darkMode: AppSettings.darkMode,
                hintText: AppTexts.enterPassword.tr(),
                controller: cubit.passwordController,
                validator: (value) =>
                    cubit.validateTextField(value, AppTexts.enterPassword.tr()),
                titleText: AppTexts.password.tr(),
                obscureText: cubit.isVisible,
                suffix: GestureDetector(
                  onTap: () => cubit.changePasswordVisibility(),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: SvgPicture.asset(
                      AppAssets.passwordVisible,
                      colorFilter: ColorFilter.mode(
                        AppSettings.darkMode
                            ? Colors.white
                            : AppColors.kBrandColorBlack,
                        BlendMode.srcIn,
                      ),
                    ),
                  ),
                ),
                keyboardType: TextInputType.visiblePassword,
              ),
              const SizedBox(height: 16),
              CustomTextFormField(
                darkMode: AppSettings.darkMode,
                controller: cubit.phoneNumberController,
                validator: (value) => cubit.validateTextField(
                    value, AppTexts.enterPhoneNumber.tr()),
                hintText: AppTexts.enterPhoneNumber.tr(),
                titleText: AppTexts.phoneNumber.tr(),
                keyboardType: TextInputType.number,
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
      },
    );
  }
}
