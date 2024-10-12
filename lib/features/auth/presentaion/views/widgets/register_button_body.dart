import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quick_mart/core/utils/app_colors.dart';
import 'package:quick_mart/core/utils/app_texts.dart';
import 'package:quick_mart/core/widgets/custom_button.dart';
import 'package:quick_mart/features/auth/presentaion/view_models/register_cubit/register_cubit.dart';
import 'package:quick_mart/features/auth/presentaion/view_models/register_cubit/register_state.dart';
import 'package:quick_mart/features/auth/presentaion/views/widgets/custom_google_button.dart';

class RegisterButtonBody extends StatelessWidget {
  const RegisterButtonBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    RegisterCubit cubit = BlocProvider.of<RegisterCubit>(context);
    return BlocBuilder<RegisterCubit, RegisterState>(
      builder: (context, state) {
        return Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: CustomButton(
                    text: AppTexts.register.tr(),
                    color: cubit.darkMode
                        ? AppColors.kBrandColorCyan
                        : AppColors.kBrandColorBlack,
                    onPressed: cubit.validateForm,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            Row(
              children: [
                Expanded(
                  child: CustomGoogleButton(
                    text: AppTexts.signupWithGoogle.tr(),
                    darkMode: cubit.darkMode,
                    onPressed: cubit.loginViaGoogle,
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
