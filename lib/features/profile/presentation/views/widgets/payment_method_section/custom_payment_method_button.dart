import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quick_mart/core/utils/app_colors.dart';
import 'package:quick_mart/core/utils/app_settings.dart';
import 'package:quick_mart/core/widgets/custom_button.dart';
import 'package:quick_mart/features/checkout/data/models/input_payment_intent_model.dart';
import 'package:quick_mart/features/checkout/presentation/view_models/payment_cubit/payment_cubit.dart';
import 'package:quick_mart/features/checkout/presentation/view_models/payment_cubit/payment_state.dart';

class CustomPaymentMethodButton extends StatelessWidget {
  const CustomPaymentMethodButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      mainAxisSize: MainAxisSize.max,
      children: [
        Row(
          children: [
            Expanded(
              child: BlocBuilder<PaymentCubit, PaymentState>(
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
                      await BlocProvider.of<PaymentCubit>(context).makePayment(
                          inputPaymentIntentModel: InputPaymentIntentModel(
                              amount: '200', currency: 'EGP'));
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
