import 'package:flutter/material.dart';
import 'package:quick_mart/features/profile/presentation/views/widgets/orders_history_section/custom_empty_order_widget.dart';
import 'package:quick_mart/features/profile/presentation/views/widgets/orders_history_section/order_ongoing_view.dart';

class CustomTabBarBody extends StatelessWidget {
  const CustomTabBarBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const TabBarView(
      children: [
        OrderOngoingView(),
        CustomEmptyOrderWidget(
          title: 'No completed order',
          bodyTxt:
              'We don\'t have any past orders that have been completed. Start shopping now and create your first order with us.',
        ),
      ],
    );
  }
}
