import 'package:flutter/material.dart';
import 'package:quick_mart/core/widgets/custom_button.dart';
import 'package:quick_mart/features/checkout/presentation/views/widgets/review_order_section/order_info_section.dart';
import 'package:quick_mart/features/checkout/presentation/views/widgets/review_order_section/order_total_section.dart';
import 'package:quick_mart/features/checkout/presentation/views/widgets/review_order_section/shipping_address_info_section.dart';

class ReviewOrderSection extends StatelessWidget {
  const ReviewOrderSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const ShippingAddressInfoSection(),
        const SizedBox(
          height: 16,
        ),
        const OrderInfoSection(),
        const SizedBox(
          height: 9,
        ),
        const OrderTotalSection(),
        const Spacer(),
        Row(
          children: [
            Expanded(child: CustomButton(text: 'Continue', onPressed: () {})),
          ],
        )
      ],
    );
  }
}
