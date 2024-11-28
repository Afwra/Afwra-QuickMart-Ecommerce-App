import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:quick_mart/core/utils/app_assets.dart';
import 'package:quick_mart/core/utils/app_colors.dart';
import 'package:quick_mart/core/utils/app_routes.dart';
import 'package:quick_mart/core/utils/app_text_styles.dart';
import 'package:quick_mart/core/utils/app_texts.dart';
import 'package:quick_mart/features/profile/presentation/views/widgets/custom_profile_view_list_tile.dart';

class PersonalInformationSection extends StatelessWidget {
  const PersonalInformationSection({
    super.key,
    this.darkMode = false,
  });
  final bool darkMode;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppTexts.profilePersonalInfo.tr(),
          style: AppTextStyles.captionSemiBold.copyWith(
            color: darkMode ? Colors.white : AppColors.kBrandColorBlack,
          ),
        ),
        const SizedBox(
          height: 12,
        ),
        CustomProfileViewListTile(
          title: AppTexts.profileShippingAddress.tr(),
          leadingIcon: AppAssets.shippingAddressIcon,
          onPressed: () =>
              GoRouter.of(context).push(AppRoutes.kShippingAddress),
        ),
        CustomProfileViewListTile(
          title: AppTexts.profilePaymentMethod.tr(),
          leadingIcon: AppAssets.paymentMethodIcon,
          onPressed: () => GoRouter.of(context).push(AppRoutes.kPaymentMethod),
        ),
        CustomProfileViewListTile(
          title: AppTexts.profileOrderHistory.tr(),
          leadingIcon: AppAssets.orderHistoryIcon,
          onPressed: () => GoRouter.of(context).push(AppRoutes.kOrderHistory),
        ),
      ],
    );
  }
}
