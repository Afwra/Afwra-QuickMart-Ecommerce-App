import 'package:flutter/material.dart';
import 'package:quick_mart/core/utils/app_colors.dart';
import 'package:quick_mart/core/utils/app_settings.dart';
import 'package:quick_mart/core/widgets/custom_button.dart';
import 'package:quick_mart/core/widgets/custom_drop_down_field.dart';
import 'package:quick_mart/core/widgets/custom_phone_input_field.dart';
import 'package:quick_mart/core/widgets/custom_text_field.dart';

class CheckoutShippingSection extends StatelessWidget {
  const CheckoutShippingSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomTextFormField(
          hintText: 'Enter Full Name',
          titleText: 'Full Name',
          darkMode: AppSettings.darkMode,
        ),
        const SizedBox(
          height: 12,
        ),
        CustomPhoneInputField(
          titleText: 'Phone Number',
          darkMode: AppSettings.darkMode,
        ),
        const SizedBox(
          height: 12,
        ),
        const CustomDropDownField(),
        const SizedBox(
          height: 12,
        ),
        const CustomDropDownField(),
        const SizedBox(
          height: 12,
        ),
        CustomTextFormField(
          hintText: 'Enter Street Address',
          titleText: 'Street Address',
          darkMode: AppSettings.darkMode,
        ),
        const SizedBox(
          height: 12,
        ),
        CustomTextFormField(
          hintText: 'Enter Postel Code',
          titleText: 'Postel Code',
          darkMode: AppSettings.darkMode,
        ),
        const SizedBox(
          height: 24,
        ),
        Row(
          children: [
            Expanded(
              child: CustomButton(
                text: 'Save',
                color: AppSettings.darkMode
                    ? AppColors.kBrandColorCyan
                    : AppColors.kBrandColorBlack,
                onPressed: () {},
              ),
            ),
          ],
        ),
      ],
    ));
  }
}
