import 'package:flutter/material.dart';
import 'package:quick_mart/features/cart/data/models/cart_item_model/cart_item_model.dart';
import 'package:quick_mart/features/cart/presentation/views/widgets/custom_filled_cart_app_bar.dart';
import 'package:quick_mart/features/cart/presentation/views/widgets/custom_my_cart_list_view_item.dart';
import 'package:quick_mart/features/cart/presentation/views/widgets/my_cart_order_info_section.dart';

class CustomFilledCartWidget extends StatelessWidget {
  const CustomFilledCartWidget({super.key, required this.item});
  final CartItemModel item;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CustomFilledCartAppBar(),
        const SizedBox(
          height: 30,
        ),
        Expanded(
            child: ListView.builder(
          itemBuilder: (context, index) => Padding(
            padding: const EdgeInsets.only(bottom: 15),
            child: CustomMyCartListViewItem(
              item: item.cartItems[index],
            ),
          ),
          itemCount: item.cartItems.length,
        )),
        MyCartOrderInfoSection(
          cartItemModel: item,
        ),
      ],
    );
  }
}
