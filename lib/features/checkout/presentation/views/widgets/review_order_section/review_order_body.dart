import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quick_mart/core/widgets/custom_button.dart';
import 'package:quick_mart/features/checkout/presentation/view_models/checkout_cubit/checkout_cubit.dart';
import 'package:quick_mart/features/checkout/presentation/view_models/review_order_cubit/review_order_cubit.dart';
import 'package:quick_mart/features/checkout/presentation/views/widgets/review_order_section/order_info_section.dart';
import 'package:quick_mart/features/checkout/presentation/views/widgets/review_order_section/order_item_count_section.dart';
import 'package:quick_mart/features/checkout/presentation/views/widgets/review_order_section/order_total_section.dart';
import 'package:quick_mart/features/checkout/presentation/views/widgets/review_order_section/shipping_address_info_section.dart';

class ReviewOrderBody extends StatelessWidget {
  const ReviewOrderBody({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    var checkoutCubit = BlocProvider.of<CheckoutCubit>(context);
    var reviewOrderCubit = BlocProvider.of<ReviewOrderCubit>(context);
    return Column(
      children: [
        OrderItemCount(
          items: reviewOrderCubit.cart,
        ),
        const SizedBox(
          height: 16,
        ),
        ShippingAddressInfoSection(
          shippingModel: checkoutCubit.shippingAddress,
        ),
        const SizedBox(
          height: 16,
        ),
        OrderInfoSection(
          cartItemModel: reviewOrderCubit.cart,
        ),
        const SizedBox(
          height: 9,
        ),
        OrderTotalSection(
          total: reviewOrderCubit.cart.total,
        ),
        const Spacer(),
        Row(
          children: [
            Expanded(
              child: CustomButton(
                text: 'Continue',
                onPressed: () {
                  checkoutCubit.nextPage();
                  if (context.mounted) {
                    BlocProvider.of<CheckoutCubit>(context).saveCartItemLocally(
                        BlocProvider.of<ReviewOrderCubit>(context).cart);
                  }
                },
              ),
            ),
          ],
        )
      ],
    );
  }
}
