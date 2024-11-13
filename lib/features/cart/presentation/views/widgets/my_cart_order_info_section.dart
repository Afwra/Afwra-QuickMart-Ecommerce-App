import 'package:flutter/material.dart';
import 'package:quick_mart/core/utils/app_text_styles.dart';
import 'package:quick_mart/features/cart/presentation/views/widgets/custom_checkout_button.dart';
import 'package:quick_mart/features/cart/presentation/views/widgets/custom_order_info_row.dart';

class MyCartOrderInfoSection extends StatelessWidget {
  const MyCartOrderInfoSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Order Info',
          style: AppTextStyles.body1Medium,
        ),
        const SizedBox(
          height: 20,
        ),
        const CustomOrderInfoRow(
          title: 'Subtotal',
          price: '27.25',
        ),
        const SizedBox(
          height: 20,
        ),
        const CustomOrderInfoRow(title: 'Shipping Cost', price: '0.00'),
        const SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Total',
              style: AppTextStyles.body1Medium,
            ),
            Text(
              '\$27.25',
              style: AppTextStyles.body1Medium,
            ),
          ],
        ),
        const SizedBox(
          height: 24,
        ),
        const CustomCheckoutButton(),
        const SizedBox(
          height: 16,
        ),
      ],
    );
  }
}
