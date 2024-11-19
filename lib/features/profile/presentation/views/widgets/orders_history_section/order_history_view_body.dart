import 'package:flutter/material.dart';
import 'package:quick_mart/features/profile/presentation/views/widgets/custom_profile_pages_app_bar.dart';
import 'package:quick_mart/features/profile/presentation/views/widgets/orders_history_section/custom_order_history_bottom_section.dart';

class OrderHistoryViewBody extends StatelessWidget {
  const OrderHistoryViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        CustomProfilePagesAppBar(title: 'Order History'),
        Expanded(child: CustomOrderHistoryBottomSection()),
      ],
    );
  }
}
