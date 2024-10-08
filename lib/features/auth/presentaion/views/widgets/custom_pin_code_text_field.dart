import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:quick_mart/core/utils/app_colors.dart';
import 'package:quick_mart/features/auth/presentaion/view_models/forgot_password_cubit/forgot_password_cubit.dart';

class CustomPinCodeTextField extends StatelessWidget {
  const CustomPinCodeTextField({
    super.key,
    this.onCompleted,
  });
  final void Function(String)? onCompleted;
  @override
  Widget build(BuildContext context) {
    ForgotPasswordCubit cubit = BlocProvider.of<ForgotPasswordCubit>(context);
    return Form(
      key: cubit.pinFormKey,
      child: PinCodeTextField(
        controller: cubit.codeController,
        errorTextSpace: 20,
        validator: (value) {
          if (value!.isEmpty) {
            return 'Please Enter Code';
          }
          return null;
        },
        appContext: context,
        obscureText: false,
        keyboardType: TextInputType.number,
        length: 6,
        animationType: AnimationType.fade,
        animationDuration: const Duration(milliseconds: 300),
        pinTheme: PinTheme(
          shape: PinCodeFieldShape.box,
          borderRadius: BorderRadius.circular(12),
          fieldHeight: 48.h,
          fieldWidth: 48.h,
          activeColor: AppColors.kBrandColorCyan,
          inactiveColor: AppColors.kGrey50,
          selectedColor: AppColors.kBrandColorCyan,
        ),
        onCompleted: onCompleted,
      ),
    );
  }
}
