import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:quick_mart/core/utils/app_colors.dart';
import 'package:quick_mart/core/utils/app_routes.dart';
import 'package:quick_mart/core/utils/app_settings.dart';
import 'package:quick_mart/core/widgets/custom_button.dart';

class CustomCheckoutButton extends StatelessWidget {
  const CustomCheckoutButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            child: CustomButton(
          text: 'Checkout',
          onPressed: () {
            GoRouter.of(context).push(AppRoutes.kCheckoutView);
          },
          color: AppSettings.darkMode
              ? AppColors.kBrandColorCyan
              : AppColors.kBrandColorBlack,
          textColor: AppColors.kBrandColorWhite,
        )),
      ],
    );
  }
}
