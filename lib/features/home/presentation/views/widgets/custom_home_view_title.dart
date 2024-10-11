import 'package:flutter/material.dart';
import 'package:quick_mart/core/utils/app_colors.dart';
import 'package:quick_mart/core/utils/app_text_styles.dart';
import 'package:quick_mart/core/widgets/custom_text_button.dart';

class CustomHomeViewTitle extends StatelessWidget {
  const CustomHomeViewTitle({
    super.key,
    required this.title,
    this.onPressed,
    this.darkMode = false,
  });
  final String title;
  final void Function()? onPressed;
  final bool darkMode;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: AppTextStyles.heading3Bold.copyWith(
              color: darkMode ? Colors.white : AppColors.kBrandColorBlack),
        ),
        CustomTextButton(
          buttonText: 'See All',
          onPressed: () {},
        )
      ],
    );
  }
}
