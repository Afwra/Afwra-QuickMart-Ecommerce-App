import 'package:flutter/material.dart';
import 'package:quick_mart/features/profile/presentation/views/widgets/orders_history_section/filled_order_item_info_section.dart';
import 'package:quick_mart/features/profile/presentation/views/widgets/orders_history_section/filled_order_item_title_section.dart';

class CustomFilledOrderItem extends StatelessWidget {
  const CustomFilledOrderItem({
    super.key,
    this.completed = false,
  });
  final bool completed;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FilledOrderItemTitleSection(completed: completed),
        const SizedBox(
          height: 8,
        ),
        const FilledOrderItemInfoSection(),
      ],
    );
  }
}
