import 'package:flutter/material.dart';

import 'package:quick_mart/features/cart/presentation/views/widgets/custom_filled_cart_widget.dart';

class MyCartViewBody extends StatelessWidget {
  const MyCartViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    // return const CustomEmptyCartWidget();
    return const CustomFilledCartWidget();
  }
}
