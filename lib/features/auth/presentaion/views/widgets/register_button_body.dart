import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quick_mart/core/utils/app_assets.dart';
import 'package:quick_mart/core/utils/app_colors.dart';
import 'package:quick_mart/core/widgets/custom_button.dart';
import 'package:quick_mart/core/widgets/custom_button_with_icon.dart';
import 'package:quick_mart/features/auth/presentaion/view_models/register_cubit/register_cubit.dart';

class RegisterButtonBody extends StatelessWidget {
  const RegisterButtonBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    RegisterCubit cubit = BlocProvider.of<RegisterCubit>(context);
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: CustomButton(
                text: 'Create Account',
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
              child: CustomButtonWithIcon(
                text: 'Signup With Google',
                onPressed: cubit.loginViaGoogle,
                iconPath: AppAssets.google,
                color: Colors.white,
                textColor: AppColors.kBrandColorBlack,
                borderColor: AppColors.kGrey50,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
