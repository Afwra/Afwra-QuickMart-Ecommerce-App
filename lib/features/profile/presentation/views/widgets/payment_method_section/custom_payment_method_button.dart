import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:quick_mart/core/utils/app_colors.dart';
import 'package:quick_mart/core/utils/app_routes.dart';
import 'package:quick_mart/core/utils/app_settings.dart';
import 'package:quick_mart/core/widgets/custom_button.dart';
import 'package:quick_mart/features/checkout/data/models/stripe_models/input_payment_intent_model.dart';
import 'package:quick_mart/features/checkout/presentation/view_models/checkout_cubit/checkout_cubit.dart';
import 'package:quick_mart/features/checkout/presentation/view_models/payment_cubit/payment_cubit.dart';
import 'package:quick_mart/features/checkout/presentation/view_models/payment_cubit/payment_state.dart';

class CustomPaymentMethodButton extends StatelessWidget {
  const CustomPaymentMethodButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var cartItemModel = BlocProvider.of<CheckoutCubit>(context).cartItemModel;
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      mainAxisSize: MainAxisSize.max,
      children: [
        Row(
          children: [
            Expanded(
              child: BlocConsumer<PaymentCubit, PaymentState>(
                listener: (context, state) {
                  if (state is PaymentCubitSuccess) {
                    GoRouter.of(context).go(AppRoutes.kPaymentSuccess);
                  }
                },
                builder: (context, state) {
                  if (state is PaymentCubitLoading) {
                    return const Center(
                      child: CircularProgressIndicator(
                        color: AppColors.kBrandColorCyan,
                      ),
                    );
                  }
                  return CustomButton(
                    text: 'Save',
                    onPressed: () async {
                      await BlocProvider.of<PaymentCubit>(context)
                          .makeStripePayment(
                              inputPaymentIntentModel: InputPaymentIntentModel(
                                  amount: '${cartItemModel.total}',
                                  currency: 'EGP',
                                  customerId: 'cus_RJ4On7Ufz8Kmtc'));
                    },
                    color: AppSettings.darkMode
                        ? AppColors.kBrandColorCyan
                        : AppColors.kBrandColorBlack,
                  );
                },
              ),
            ),
          ],
        ),
      ],
    );
  }
}
