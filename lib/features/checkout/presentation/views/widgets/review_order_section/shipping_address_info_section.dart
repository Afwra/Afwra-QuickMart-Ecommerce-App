import 'package:flutter/material.dart';
import 'package:quick_mart/core/utils/app_colors.dart';
import 'package:quick_mart/core/utils/app_settings.dart';
import 'package:quick_mart/core/utils/app_text_styles.dart';
import 'package:quick_mart/features/checkout/presentation/views/widgets/review_order_section/custom_info_section.dart';

class ShippingAddressInfoSection extends StatelessWidget {
  const ShippingAddressInfoSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Shipping Address',
          style: AppTextStyles.body1Medium.copyWith(
              color: AppSettings.darkMode
                  ? Colors.white
                  : AppColors.kBrandColorBlack),
        ),
        const SizedBox(
          height: 20,
        ),
        const CustomInfoWidget(
          title: 'Full Name',
          info: 'Ahmed Khan',
        ),
        const SizedBox(
          height: 8.5,
        ),
        const CustomInfoWidget(
          title: 'Mobile Number',
          info: 'Ahmed Khan',
        ),
        const SizedBox(
          height: 8.5,
        ),
        const CustomInfoWidget(
          title: 'Province',
          info: 'Ahmed Khan',
        ),
        const SizedBox(
          height: 8.5,
        ),
        const CustomInfoWidget(
          title: 'City',
          info: 'Ahmed Khan',
        ),
        const SizedBox(
          height: 8.5,
        ),
        const CustomInfoWidget(
          title: 'Street Address',
          info: 'Ahmed Khan',
        ),
        const SizedBox(
          height: 8.5,
        ),
        const CustomInfoWidget(
          title: 'Postal Code',
          info: 'Ahmed Khan',
        ),
      ],
    );
  }
}
