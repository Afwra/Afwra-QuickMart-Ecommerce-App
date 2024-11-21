import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:quick_mart/core/utils/app_assets.dart';
import 'package:quick_mart/core/utils/app_colors.dart';
import 'package:quick_mart/core/utils/app_routes.dart';
import 'package:quick_mart/core/utils/app_settings.dart';
import 'package:quick_mart/core/utils/app_text_styles.dart';
import 'package:quick_mart/core/widgets/custom_text_button.dart';
import 'package:quick_mart/features/profile/presentation/views/widgets/custom_profile_view_list_tile.dart';
import 'package:quick_mart/features/profile/presentation/views/widgets/custom_profile_view_list_tile_with_custom_widget.dart';

class AccountManagementSection extends StatelessWidget {
  const AccountManagementSection({
    super.key,
    this.txtButtonOnPressed,
  });
  final void Function()? txtButtonOnPressed;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Account Management',
          style: AppTextStyles.captionSemiBold.copyWith(
            color: AppSettings.darkMode
                ? Colors.white
                : AppColors.kBrandColorBlack,
          ),
        ),
        const SizedBox(
          height: 12,
        ),
        CustomProfileViewListTile(
          title: 'Change Password',
          leadingIcon: AppAssets.changePasswordLogo,
          onPressed: () => GoRouter.of(context).push(AppRoutes.kChangePassword),
        ),
        const CustomProfileViewListTile(
          title: 'Dark Theme',
          leadingIcon: AppAssets.themeLogo,
          isDarkModeTile: true,
        ),
        CustomProfileViewListTileWithCustomWidget(
          title: 'Language',
          leadingIcon: AppAssets.langIcon,
          trailing: CustomTextButton(
            onPressed: txtButtonOnPressed,
            buttonText: AppSettings.langCode == 'en' ? 'Arabic' : 'English',
          ),
        )
      ],
    );
  }
}
