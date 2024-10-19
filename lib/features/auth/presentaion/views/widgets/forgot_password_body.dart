import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quick_mart/core/utils/app_colors.dart';
import 'package:quick_mart/core/utils/app_settings.dart';
import 'package:quick_mart/core/utils/app_text_styles.dart';
import 'package:quick_mart/core/widgets/custom_button.dart';
import 'package:quick_mart/features/auth/data/models/forget_password_view_model.dart';
import 'package:quick_mart/features/auth/presentaion/view_models/forgot_password_cubit/forgot_password_cubit.dart';
import 'package:quick_mart/features/auth/presentaion/view_models/forgot_password_cubit/forgot_password_state.dart';
import 'package:quick_mart/features/auth/presentaion/views/widgets/custom_forgot_password_app_bar.dart';
import 'package:quick_mart/features/auth/presentaion/views/widgets/forgot_password_page_view.dart';

class ForgotPasswordBody extends StatelessWidget {
  const ForgotPasswordBody({super.key});

  @override
  Widget build(BuildContext context) {
    ForgotPasswordCubit cubit = BlocProvider.of<ForgotPasswordCubit>(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const CustomForgotPasswordAppBar(),
        const SizedBox(
          height: 10,
        ),
        const Divider(
          height: 3,
          thickness: 2,
          color: AppColors.kGrey50,
        ),
        const SizedBox(
          height: 10,
        ),
        BlocBuilder<ForgotPasswordCubit, ForgotPasswordState>(
          builder: (context, state) {
            return Text(
              forgetPasswordList[cubit.pageIndex].title,
              style: AppTextStyles.heading2Bold.copyWith(
                color: AppSettings.darkMode
                    ? Colors.white
                    : AppColors.kBrandColorBlack,
              ),
            );
          },
        ),
        const SizedBox(
          height: 8,
        ),
        BlocBuilder<ForgotPasswordCubit, ForgotPasswordState>(
          builder: (context, state) {
            return Text(
              forgetPasswordList[cubit.pageIndex].subTitle,
              style: AppTextStyles.body2Regular
                  .copyWith(color: AppColors.kGrey150),
            );
          },
        ),
        const SizedBox(
          height: 16,
        ),
        const Flexible(child: ForgotPasswordPageView()),
        const SizedBox(
          height: 24,
        ),
        BlocBuilder<ForgotPasswordCubit, ForgotPasswordState>(
          builder: (context, state) {
            if (state is ForgotPasswordLoading) {
              return const Center(
                child: CircularProgressIndicator(
                  color: AppColors.kBrandColorCyan,
                ),
              );
            }
            return Row(
              children: [
                Expanded(
                    child: CustomButton(
                  color: AppSettings.darkMode
                      ? AppColors.kBrandColorCyan
                      : AppColors.kBrandColorBlack,
                  text: forgetPasswordList[cubit.pageIndex].buttonText,
                  onPressed: () => cubit.buttonLogic(context),
                )),
              ],
            );
          },
        ),
      ],
    );
  }
}
