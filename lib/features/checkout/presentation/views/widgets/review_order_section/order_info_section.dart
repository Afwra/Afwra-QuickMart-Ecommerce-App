import 'package:flutter/material.dart';
import 'package:quick_mart/core/utils/app_colors.dart';
import 'package:quick_mart/core/utils/app_settings.dart';
import 'package:quick_mart/core/utils/app_text_styles.dart';
import 'package:quick_mart/features/cart/data/models/cart_item_model/cart_item_model.dart';
import 'package:quick_mart/features/checkout/presentation/views/widgets/review_order_section/custom_info_widget.dart';

class OrderInfoSection extends StatelessWidget {
  const OrderInfoSection({
    super.key,
    required this.cartItemModel,
  });
  final CartItemModel cartItemModel;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Order Info',
          style: AppTextStyles.body1Medium.copyWith(
              color: AppSettings.darkMode
                  ? Colors.white
                  : AppColors.kBrandColorBlack),
        ),
        const SizedBox(
          height: 8.5,
        ),
        CustomInfoWidget(
          title: 'Subtotal',
          info: '\$${cartItemModel.subTotal.toString()}',
        ),
        const SizedBox(
          height: 8.5,
        ),
        const CustomInfoWidget(
          title: 'Shipping Total',
          info: '\$0',
        ),
      ],
    );
  }
}
