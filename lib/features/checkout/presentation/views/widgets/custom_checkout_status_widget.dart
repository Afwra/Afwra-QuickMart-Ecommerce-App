import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quick_mart/core/utils/app_assets.dart';
import 'package:quick_mart/core/utils/app_colors.dart';
import 'package:quick_mart/features/checkout/presentation/view_models/checkout_cubit/checkout_cubit.dart';
import 'package:quick_mart/features/checkout/presentation/view_models/checkout_cubit/checkout_state.dart';
import 'package:quick_mart/features/checkout/presentation/views/widgets/custom_checkout_status_item.dart';

class CustomCheckoutStatusWidget extends StatelessWidget {
  const CustomCheckoutStatusWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<CheckoutCubit>(context);
    return BlocBuilder<CheckoutCubit, CheckoutState>(
      builder: (context, state) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomCheckoutStatusItem(
              title: 'Shipping',
              iconPath: AppAssets.shippingAddressIcon,
              isFinished: cubit.currPage >= 0,
            ),
            const SizedBox(
              width: 9,
            ),
            SizedBox(
              width: 48.w,
              child: const Divider(
                thickness: 2,
                color: AppColors.kGrey100,
              ),
            ),
            const SizedBox(
              width: 9,
            ),
            CustomCheckoutStatusItem(
              title: 'Review',
              iconPath: AppAssets.reviewIcon,
              isFinished: cubit.currPage >= 1,
            ),
            const SizedBox(
              width: 9,
            ),
            SizedBox(
              width: 48.w,
              child: const Divider(
                thickness: 2,
                color: AppColors.kGrey100,
              ),
            ),
            const SizedBox(
              width: 9,
            ),
            CustomCheckoutStatusItem(
              title: 'Payment',
              iconPath: AppAssets.paymentIcon,
              isFinished: cubit.currPage > 1,
            ),
          ],
        );
      },
    );
  }
}
