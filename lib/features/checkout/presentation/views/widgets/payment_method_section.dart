import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quick_mart/features/profile/presentation/views/widgets/payment_method_section/custom_payment_method_button.dart';
import 'package:quick_mart/features/profile/presentation/views/widgets/payment_method_section/custom_payment_method_form_section.dart';
import 'package:quick_mart/features/profile/presentation/views/widgets/payment_method_section/custom_payment_methods_widget.dart';

class PaymentMethodSection extends StatelessWidget {
  const PaymentMethodSection({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        const SliverToBoxAdapter(
          child: CustomPaymentMethodsWidget(),
        ),
        SliverToBoxAdapter(
          child: SizedBox(height: 24.h),
        ),
        const SliverToBoxAdapter(
          child: CustomPaymentMethodFormSection(),
        ),
        const SliverFillRemaining(
          hasScrollBody: false,
          child: CustomPaymentMethodButton(),
        )
      ],
    );
  }
}
