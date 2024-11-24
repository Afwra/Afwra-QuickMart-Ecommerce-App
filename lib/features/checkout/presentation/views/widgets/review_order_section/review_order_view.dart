import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quick_mart/core/utils/app_colors.dart';
import 'package:quick_mart/features/checkout/presentation/view_models/review_order_cubit/review_order_cubit.dart';
import 'package:quick_mart/features/checkout/presentation/view_models/review_order_cubit/review_order_state.dart';
import 'package:quick_mart/features/checkout/presentation/views/widgets/review_order_section/review_order_body.dart';

class ReviewOrderSection extends StatelessWidget {
  const ReviewOrderSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ReviewOrderCubit, ReviewOrderState>(
      builder: (context, state) {
        return BlocProvider.of<ReviewOrderCubit>(context).cartLoading
            ? const Center(
                child: CircularProgressIndicator(
                  color: AppColors.kBrandColorCyan,
                ),
              )
            : const ReviewOrderBody();
      },
    );
  }
}
