import 'package:flutter/material.dart';
import 'package:quick_mart/core/utils/app_colors.dart';
import 'package:quick_mart/core/utils/app_settings.dart';
import 'package:quick_mart/core/widgets/custom_button.dart';

class CustomPaymentMethodButton extends StatelessWidget {
  const CustomPaymentMethodButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      mainAxisSize: MainAxisSize.max,
      children: [
        Row(
          children: [
            Expanded(
              child: CustomButton(
                text: 'Save',
                onPressed: () {},
                color: AppSettings.darkMode
                    ? AppColors.kBrandColorCyan
                    : AppColors.kBrandColorBlack,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
