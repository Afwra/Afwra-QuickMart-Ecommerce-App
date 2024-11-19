import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:quick_mart/core/utils/app_assets.dart';
import 'package:quick_mart/core/utils/app_colors.dart';
import 'package:quick_mart/core/utils/app_routes.dart';
import 'package:quick_mart/core/utils/app_text_styles.dart';
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
          'Personal Information',
          style: AppTextStyles.captionSemiBold.copyWith(
            color: darkMode ? Colors.white : AppColors.kBrandColorBlack,
          ),
        ),
        const SizedBox(
          height: 12,
        ),
        CustomProfileViewListTile(
          title: 'Shipping Address',
          leadingIcon: AppAssets.shippingAddressIcon,
          onPressed: () =>
              GoRouter.of(context).push(AppRoutes.kShippingAddress),
        ),
        CustomProfileViewListTile(
          title: 'Payment Method',
          leadingIcon: AppAssets.paymentMethodIcon,
          onPressed: () => GoRouter.of(context).push(AppRoutes.kPaymentMethod),
        ),
        CustomProfileViewListTile(
          title: 'Order History',
          leadingIcon: AppAssets.orderHistoryIcon,
          onPressed: () => GoRouter.of(context).push(AppRoutes.kOrderHistory),
        ),
      ],
    );
  }
}
