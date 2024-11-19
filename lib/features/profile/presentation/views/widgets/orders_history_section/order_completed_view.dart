import 'package:flutter/material.dart';
import 'package:quick_mart/features/profile/presentation/views/widgets/orders_history_section/custom_filled_order_item.dart';

class OrderCompletedView extends StatelessWidget {
  const OrderCompletedView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (_, index) => const CustomFilledOrderItem(),
      separatorBuilder: (context, index) => const SizedBox(height: 16),
      itemCount: 5,
    );
  }
}
