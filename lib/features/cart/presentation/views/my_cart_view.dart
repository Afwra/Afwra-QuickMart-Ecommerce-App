import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quick_mart/core/utils/service_locator.dart';
import 'package:quick_mart/features/cart/data/repos/cart_repo_impl.dart';
import 'package:quick_mart/features/cart/presentation/view_models/cubit/my_cart_cubit.dart';
import 'package:quick_mart/features/cart/presentation/views/widgets/my_cart_view_body.dart';

class MyCartView extends StatelessWidget {
  const MyCartView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          MyCartCubit(getIt.get<CartReopImpl>())..getCartItems(),
      child: const MyCartViewBody(),
    );
  }
}
