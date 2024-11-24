import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quick_mart/core/utils/service_locator.dart';
import 'package:quick_mart/features/checkout/data/repos/shipping_repo_impl.dart';
import 'package:quick_mart/features/checkout/presentation/view_models/shipping_cubit/shipping_cubit.dart';
import 'package:quick_mart/features/profile/presentation/views/widgets/shipping_address_section/shipping_address_view_body.dart';

class ShippingAddressView extends StatelessWidget {
  const ShippingAddressView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
          child: BlocProvider(
            create: (context) => ShippingCubit(getIt.get<ShippingRepoImpl>())
              ..getAddressFromApi(),
            child: const ShippingAddressViewBody(),
          ),
        ),
      ),
    );
  }
}
