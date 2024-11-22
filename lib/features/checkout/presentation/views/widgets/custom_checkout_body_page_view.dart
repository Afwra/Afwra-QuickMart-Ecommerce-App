import 'package:flutter/material.dart';
import 'package:quick_mart/features/checkout/presentation/views/widgets/shipping_section/checkout_shipping_section.dart';
import 'package:quick_mart/features/checkout/presentation/views/widgets/payment_method_section.dart';
import 'package:quick_mart/features/checkout/presentation/views/widgets/review_order_section/review_order_section.dart';

class CustomCheckoutBodyPageView extends StatelessWidget {
  const CustomCheckoutBodyPageView({
    super.key,
  });
  final List<Widget> pages = const [
    CheckoutShippingSection(),
    ReviewOrderSection(),
    PaymentMethodSection(),
  ];
  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      itemBuilder: (context, index) => pages[index],
      itemCount: pages.length,
      physics: const BouncingScrollPhysics(),
    );
  }
}
