import 'package:flutter/material.dart';
import 'package:quick_mart/features/profile/presentation/views/widgets/orders_history_section/custom_tab_bar.dart';
import 'package:quick_mart/features/profile/presentation/views/widgets/orders_history_section/custom_tab_bar_body.dart';

class CustomOrderHistoryBottomSection extends StatelessWidget {
  const CustomOrderHistoryBottomSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const DefaultTabController(
      length: 2,
      child: Column(
        children: [
          CustomTabBar(),
          const SizedBox(
            height: 10,
          ),
          Expanded(
            child: CustomTabBarBody(),
          ),
        ],
      ),
    );
  }
}
