import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quick_mart/core/utils/service_locator.dart';
import 'package:quick_mart/features/profile/data/repos/order_history_repo_impl.dart';
import 'package:quick_mart/features/profile/presentation/view_model/order_history_cubit/order_history_cubit.dart';
import 'package:quick_mart/features/profile/presentation/views/widgets/orders_history_section/order_history_view_body.dart';

class OrdersHistoryView extends StatelessWidget {
  const OrdersHistoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
        child: BlocProvider(
          create: (context) =>
              OrderHistoryCubit(getIt.get<OrderHistoryRepoImpl>())
                ..getOrderHistory(),
          child: const OrderHistoryViewBody(),
        ),
      )),
    );
  }
}
