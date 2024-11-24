import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:quick_mart/core/utils/app_colors.dart';
import 'package:quick_mart/core/utils/app_routes.dart';
import 'package:quick_mart/core/utils/app_settings.dart';
import 'package:quick_mart/core/utils/app_text_styles.dart';
import 'package:quick_mart/features/cart/data/models/cart_item_model/cart_item_model.dart';

class OrderItemCount extends StatelessWidget {
  const OrderItemCount({
    super.key,
    required this.items,
  });
  final CartItemModel items;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: () => GoRouter.of(context).go(AppRoutes.kHomeLayout, extra: 2),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Items (${items.cartItems.length})',
                style: AppTextStyles.body1Medium.copyWith(
                    color: AppSettings.darkMode
                        ? Colors.white
                        : AppColors.kBrandColorBlack),
              ),
              const Icon(Icons.arrow_right, color: AppColors.kBrandColorCyan),
            ],
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        Divider(
          thickness: 1,
          color: AppSettings.darkMode
              ? AppColors.kGrey50DarkMode
              : AppColors.kGrey50,
        ),
      ],
    );
  }
}
