import 'package:flutter/material.dart';
import 'package:quick_mart/core/utils/app_assets.dart';
import 'package:quick_mart/core/utils/app_text_styles.dart';
import 'package:quick_mart/features/profile/presentation/views/widgets/custom_profile_view_list_tile.dart';

class SupportAndInformationSection extends StatelessWidget {
  const SupportAndInformationSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Support & Information',
          style: AppTextStyles.captionSemiBold,
        ),
        const SizedBox(
          height: 12,
        ),
        const CustomProfileViewListTile(
          title: 'Privacy Policy',
          leadingIcon: AppAssets.privacyPolicyIcon,
        ),
        const CustomProfileViewListTile(
          title: 'Terms & Conditions',
          leadingIcon: AppAssets.termsAndConditionsIcon,
        ),
        const CustomProfileViewListTile(
          title: 'FAQs',
          leadingIcon: AppAssets.faqsLogo,
        ),
      ],
    );
  }
}
