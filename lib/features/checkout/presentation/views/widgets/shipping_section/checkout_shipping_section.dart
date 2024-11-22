import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quick_mart/features/checkout/presentation/views/widgets/shipping_section/custom_map_picker_section.dart';
import 'package:quick_mart/features/checkout/presentation/views/widgets/shipping_section/shipping_form_section.dart';

class CheckoutShippingSection extends StatelessWidget {
  const CheckoutShippingSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 300.h,
            child: const CustomMapPickerSection(),
          ),
          const SizedBox(
            height: 20,
          ),
          const ShippingFormSection(),
        ],
      ),
    );
  }
}
