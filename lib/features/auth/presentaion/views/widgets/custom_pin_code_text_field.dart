import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:quick_mart/core/utils/app_colors.dart';

class CustomPinCodeTextField extends StatelessWidget {
  const CustomPinCodeTextField({
    super.key,
    this.onCompleted,
  });
  final void Function(String)? onCompleted;
  @override
  Widget build(BuildContext context) {
    return PinCodeTextField(
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
    );
  }
}
