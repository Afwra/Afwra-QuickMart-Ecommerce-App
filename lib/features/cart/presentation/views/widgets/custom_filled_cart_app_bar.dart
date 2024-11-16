import 'package:flutter/material.dart';
import 'package:quick_mart/core/functions/show_custom_promo_code_bottom_sheet.dart';
import 'package:quick_mart/core/utils/app_colors.dart';
import 'package:quick_mart/core/utils/app_settings.dart';
import 'package:quick_mart/core/utils/app_text_styles.dart';
import 'package:quick_mart/core/widgets/custom_text_button.dart';

class CustomFilledCartAppBar extends StatelessWidget {
  const CustomFilledCartAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'My Cart',
          style: AppTextStyles.body2Medium.copyWith(
              color: AppSettings.darkMode
                  ? Colors.white
                  : AppColors.kBrandColorBlack),
        ),
        CustomTextButton(
          buttonText: 'Voucher Code',
          onPressed: () {
            showCustomPromoCodeBottomSheet(context);
          },
        ),
      ],
    );
  }
}
