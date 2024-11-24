import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quick_mart/core/utils/app_colors.dart';
import 'package:quick_mart/features/profile/presentation/view_model/order_history_cubit/order_history_cubit.dart';
import 'package:quick_mart/features/profile/presentation/view_model/order_history_cubit/order_history_state.dart';
import 'package:quick_mart/features/profile/presentation/views/widgets/custom_profile_pages_app_bar.dart';
import 'package:quick_mart/features/profile/presentation/views/widgets/orders_history_section/custom_order_history_bottom_section.dart';

class OrderHistoryViewBody extends StatelessWidget {
  const OrderHistoryViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<OrderHistoryCubit>(context);
    return Column(
      children: [
        const CustomProfilePagesAppBar(title: 'Order History'),
        Expanded(child: BlocBuilder<OrderHistoryCubit, OrderHistoryState>(
          builder: (context, state) {
            return cubit.orderHistoryLoading
                ? const Center(
                    child: CircularProgressIndicator(
                      color: AppColors.kBrandColorCyan,
                    ),
                  )
                : const CustomOrderHistoryBottomSection();
          },
        )),
      ],
    );
  }
}
