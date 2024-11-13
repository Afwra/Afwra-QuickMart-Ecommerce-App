import 'package:flutter/material.dart';
import 'package:quick_mart/core/utils/app_colors.dart';
import 'package:quick_mart/core/utils/app_settings.dart';
import 'package:quick_mart/core/utils/app_text_styles.dart';
import 'package:quick_mart/core/widgets/custom_button.dart';

class CustomPromoCodeBottomSheet extends StatelessWidget {
  const CustomPromoCodeBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          'Voucher Code',
          style: AppTextStyles.body1Medium,
        ),
        const SizedBox(
          height: 16,
        ),
        TextField(
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            contentPadding:
                const EdgeInsets.symmetric(vertical: 22.5, horizontal: 16),
            hintText: 'Enter Voucher Code',
            hintStyle: AppTextStyles.captionRegular
                .copyWith(color: AppColors.kGrey100),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.0),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.0),
              borderSide:
                  const BorderSide(color: AppColors.kBrandColorCyan, width: 2),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.0),
              borderSide: BorderSide(
                color: AppSettings.darkMode
                    ? AppColors.kGrey50DarkMode
                    : AppColors.kGrey50,
                width: 2,
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 24,
        ),
        Row(
          children: [
            Expanded(
                child: CustomButton(
              text: 'Apply',
              onPressed: () {},
              color: AppColors.kBrandColorBlack,
            )),
          ],
        )
      ],
    );
  }
}
