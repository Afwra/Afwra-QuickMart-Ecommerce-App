import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quick_mart/features/profile/presentation/views/widgets/payment_method_section/payment_method_view_body.dart';

class PaymentMethodView extends StatelessWidget {
  const PaymentMethodView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
          child: const PaymentMethodViewBody(),
        ),
      ),
    );
  }
}
