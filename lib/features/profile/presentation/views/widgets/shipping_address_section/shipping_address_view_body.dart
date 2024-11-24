import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quick_mart/features/checkout/presentation/view_models/shipping_cubit/shipping_cubit.dart';
import 'package:quick_mart/features/checkout/presentation/views/widgets/shipping_section/checkout_shipping_section.dart';
import 'package:quick_mart/features/profile/presentation/views/widgets/custom_profile_pages_app_bar.dart';

class ShippingAddressViewBody extends StatelessWidget {
  const ShippingAddressViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CustomProfilePagesAppBar(title: 'Shipping Address'),
        Expanded(
          child: CheckoutShippingSection(
            onPressed: () => BlocProvider.of<ShippingCubit>(context)
                .validateProfileScreenForm(context),
          ),
        ),
      ],
    );
  }
}
