import 'package:flutter/material.dart';
import 'package:quick_mart/core/utils/app_colors.dart';
import 'package:quick_mart/core/utils/app_settings.dart';
import 'package:quick_mart/core/utils/app_text_styles.dart';
import 'package:quick_mart/features/checkout/presentation/views/widgets/review_order_section/custom_info_section.dart';

class OrderInfoSection extends StatelessWidget {
  const OrderInfoSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Order Info',
          style: AppTextStyles.body1Medium.copyWith(
              color: AppSettings.darkMode
                  ? Colors.white
                  : AppColors.kBrandColorBlack),
        ),
        const SizedBox(
          height: 8.5,
        ),
        const CustomInfoWidget(
          title: 'Subtotal',
          info: 'Shipping Cost',
        ),
        const SizedBox(
          height: 8.5,
        ),
        const CustomInfoWidget(
          title: 'Mobile Number',
          info: 'Ahmed Khan',
        ),
      ],
    );
  }
}
