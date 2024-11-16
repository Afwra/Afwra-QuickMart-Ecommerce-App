import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quick_mart/core/utils/app_assets.dart';
import 'package:quick_mart/core/utils/app_colors.dart';
import 'package:quick_mart/core/utils/app_text_styles.dart';
import 'package:quick_mart/features/profile/presentation/views/widgets/custom_profile_view_list_tile.dart';

class CustomProfileViewBottomSection extends StatelessWidget {
  const CustomProfileViewBottomSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        color: AppColors.kBrandColorCyan,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 24.h),
          decoration: BoxDecoration(
            color: AppColors.kBrandColorWhite,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(24.r),
              topRight: Radius.circular(24.r),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Personal Information',
                style: AppTextStyles.captionSemiBold,
              ),
              const SizedBox(
                height: 12,
              ),
              const CustomProfileViewListTile(
                title: 'Shipping Address',
                leadingIcon: AppAssets.shippingAddressIcon,
              ),
              const CustomProfileViewListTile(
                title: 'Payment Method',
                leadingIcon: AppAssets.paymentMethodIcon,
              ),
              const CustomProfileViewListTile(
                title: 'Order History',
                leadingIcon: AppAssets.orderHistoryIcon,
              ),
              const SizedBox(
                height: 24,
              ),
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
              const SizedBox(
                height: 24,
              ),
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
          ),
        ),
      ),
    );
  }
}
