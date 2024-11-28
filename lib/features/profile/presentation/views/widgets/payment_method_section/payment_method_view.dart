import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quick_mart/core/utils/service_locator.dart';
import 'package:quick_mart/features/checkout/data/repos/payment_repo_impl.dart';
import 'package:quick_mart/features/checkout/presentation/view_models/payment_cubit/payment_cubit.dart';
import 'package:quick_mart/features/profile/presentation/views/widgets/payment_method_section/payment_method_view_body.dart';

class PaymentMethodView extends StatelessWidget {
  const PaymentMethodView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
          child: BlocProvider(
            create: (context) =>
                PaymentCubit(paymentRepo: getIt.get<PaymentRepoImpl>()),
            child: const PaymentMethodViewBody(),
          ),
        ),
      ),
    );
  }
}
