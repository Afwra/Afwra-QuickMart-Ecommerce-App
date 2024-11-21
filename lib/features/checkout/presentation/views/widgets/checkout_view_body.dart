import 'package:flutter/material.dart';
import 'package:quick_mart/features/checkout/presentation/views/widgets/custom_checkout_body_page_view.dart';
import 'package:quick_mart/features/checkout/presentation/views/widgets/custom_checkout_status_widget.dart';
import 'package:quick_mart/features/checkout/presentation/views/widgets/custom_checkout_view_app_bar.dart';

class CheckoutViewBody extends StatelessWidget {
  const CheckoutViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        CustomCheckoutViewAppBar(),
        SizedBox(
          height: 30,
        ),
        CustomCheckoutStatusWidget(),
        SizedBox(
          height: 24,
        ),
        Expanded(child: CustomCheckoutBodyPageView()),
      ],
    );
  }
}
