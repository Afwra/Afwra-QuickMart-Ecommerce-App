import 'package:flutter/material.dart';
import 'package:quick_mart/core/utils/app_assets.dart';
import 'package:quick_mart/core/utils/app_text_styles.dart';
import 'package:quick_mart/features/profile/presentation/views/widgets/custom_profile_view_list_tile.dart';

class AccountManagementSection extends StatelessWidget {
  const AccountManagementSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Account Management',
          style: AppTextStyles.captionSemiBold,
        ),
        const SizedBox(
          height: 12,
        ),
        const CustomProfileViewListTile(
          title: 'Change Password',
          leadingIcon: AppAssets.changePasswordLogo,
        ),
        const CustomProfileViewListTile(
          title: 'Dark Theme',
          leadingIcon: AppAssets.themeLogo,
          isDarkModeTile: true,
        ),
      ],
    );
  }
}
