import 'package:flutter/material.dart';
import 'package:quick_mart/core/utils/app_colors.dart';
import 'package:quick_mart/core/utils/app_settings.dart';
import 'package:quick_mart/core/widgets/custom_phone_input_field.dart';
import 'package:quick_mart/core/widgets/custom_text_field.dart';
import 'package:quick_mart/features/profile/presentation/views/widgets/custom_profile_pages_app_bar.dart';

class ShippingAddressViewBody extends StatelessWidget {
  const ShippingAddressViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CustomProfilePagesAppBar(title: 'Shipping Address'),
        const SizedBox(
          height: 12,
        ),
        Divider(
          color: AppSettings.darkMode
              ? AppColors.kGrey50DarkMode
              : AppColors.kGrey50,
        ),
        const SizedBox(
          height: 12,
        ),
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
      ],
    );
  }
}
