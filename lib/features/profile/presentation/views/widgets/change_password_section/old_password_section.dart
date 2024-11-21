import 'package:flutter/material.dart';
import 'package:quick_mart/core/utils/app_assets.dart';
import 'package:quick_mart/core/utils/app_colors.dart';
import 'package:quick_mart/core/utils/app_settings.dart';
import 'package:quick_mart/core/utils/app_text_styles.dart';
import 'package:quick_mart/core/widgets/custom_button.dart';
import 'package:quick_mart/core/widgets/custom_text_field.dart';
import 'package:svg_flutter/svg.dart';

class OldPasswordSection extends StatelessWidget {
  const OldPasswordSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Old Password',
            style: AppTextStyles.heading2Bold.copyWith(
                color: AppSettings.darkMode
                    ? Colors.white
                    : AppColors.kBrandColorBlack),
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            'Enter old password to change the password.',
            style: AppTextStyles.body2Regular.copyWith(
              color: AppColors.kGrey150,
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          CustomTextFormField(
            hintText: 'Enter Your Current Password',
            titleText: 'Password',
            suffix: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: SvgPicture.asset(AppAssets.passwordVisible),
            ),
            obscureText: true,
          ),
          const SizedBox(
            height: 24,
          ),
          Row(
            children: [
              Expanded(
                child: CustomButton(
                  text: 'Continue',
                  onPressed: () {},
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
