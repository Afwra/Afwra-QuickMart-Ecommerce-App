import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quick_mart/core/utils/service_locator.dart';
import 'package:quick_mart/features/cart/data/repos/cart_repo_impl.dart';
import 'package:quick_mart/features/checkout/data/repos/payment_repo_impl.dart';
import 'package:quick_mart/features/checkout/data/repos/shipping_repo_impl.dart';
import 'package:quick_mart/features/checkout/presentation/view_models/checkout_cubit/checkout_cubit.dart';
import 'package:quick_mart/features/checkout/presentation/view_models/payment_cubit/payment_cubit.dart';
import 'package:quick_mart/features/checkout/presentation/view_models/review_order_cubit/review_order_cubit.dart';
import 'package:quick_mart/features/checkout/presentation/view_models/shipping_cubit/shipping_cubit.dart';
import 'package:quick_mart/features/checkout/presentation/views/widgets/checkout_view_body.dart';

class CheckoutView extends StatelessWidget {
  const CheckoutView({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              ShippingCubit(getIt.get<ShippingRepoImpl>())..getAddressFromApi(),
        ),
        BlocProvider(
          create: (context) =>
              ReviewOrderCubit(getIt.get<CartReopImpl>())..getCartItems(),
        ),
        BlocProvider(
          create: (context) =>
              PaymentCubit(paymentRepo: getIt.get<PaymentRepoImpl>()),
        ),
        BlocProvider(
          create: (context) => CheckoutCubit(),
        ),
      ],
      child: Scaffold(
        body: SafeArea(
            child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
          child: const CheckoutViewBody(),
        )),
      ),
    );
  }
}
