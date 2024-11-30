import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quick_mart/core/utils/app_assets.dart';
import 'package:quick_mart/core/utils/app_colors.dart';
import 'package:quick_mart/features/checkout/data/models/stripe_models/input_payment_intent_model.dart';
import 'package:quick_mart/features/checkout/presentation/view_models/checkout_cubit/checkout_cubit.dart';
import 'package:quick_mart/features/checkout/presentation/view_models/payment_cubit/payment_cubit.dart';
import 'package:svg_flutter/svg_flutter.dart';

class CustomPaymentMethodsWidget extends StatelessWidget {
  const CustomPaymentMethodsWidget({
    super.key,
    this.profileScreen = false,
  });
  final bool profileScreen;
  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<PaymentCubit>(context);
    return Row(
      children: [
        Expanded(
          child: InkWell(
            onTap: () => cubit.setupPaypalPayment(context),
            child: Container(
              height: 64.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.r),
                color: AppColors.kCyan50,
              ),
              child: Center(
                child: SvgPicture.asset(AppAssets.paypalIcon),
              ),
            ),
          ),
        ),
        const SizedBox(
          width: 8,
        ),
        Expanded(
          child: InkWell(
            onTap: () async {
              await BlocProvider.of<PaymentCubit>(context).makeStripePayment(
                  inputPaymentIntentModel: InputPaymentIntentModel(
                      amount:
                          '${BlocProvider.of<CheckoutCubit>(context).cartItemModel.total}',
                      currency: 'EGP',
                      customerId: 'cus_RJ4On7Ufz8Kmtc'));
            },
            child: Container(
              height: 64.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.r),
                color: AppColors.kCyan50,
              ),
              child: Center(
                child: SvgPicture.asset(AppAssets.googlePayIcon),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
