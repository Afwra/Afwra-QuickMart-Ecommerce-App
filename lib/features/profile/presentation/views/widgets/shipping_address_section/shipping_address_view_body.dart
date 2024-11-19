import 'package:flutter/material.dart';
import 'package:quick_mart/features/profile/presentation/views/widgets/custom_profile_pages_app_bar.dart';
import 'package:quick_mart/features/profile/presentation/views/widgets/shipping_address_section/shipping_address_body_section.dart';

class ShippingAddressViewBody extends StatelessWidget {
  const ShippingAddressViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        CustomProfilePagesAppBar(title: 'Shipping Address'),
        Expanded(
          child: SingleChildScrollView(child: ShippingAddressBodySection()),
        ),
      ],
    );
  }
}
