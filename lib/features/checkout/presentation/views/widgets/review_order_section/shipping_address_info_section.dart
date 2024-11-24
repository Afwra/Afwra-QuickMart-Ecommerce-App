import 'package:flutter/material.dart';
import 'package:quick_mart/core/utils/app_colors.dart';
import 'package:quick_mart/core/utils/app_settings.dart';
import 'package:quick_mart/core/utils/app_text_styles.dart';
import 'package:quick_mart/features/checkout/data/models/shipping_model.dart';
import 'package:quick_mart/features/checkout/presentation/views/widgets/review_order_section/custom_info_widget.dart';

class ShippingAddressInfoSection extends StatelessWidget {
  const ShippingAddressInfoSection({
    super.key,
    required this.shippingModel,
  });
  final ShippingModel shippingModel;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Shipping Address',
          style: AppTextStyles.body1Medium.copyWith(
              color: AppSettings.darkMode
                  ? Colors.white
                  : AppColors.kBrandColorBlack),
        ),
        const SizedBox(
          height: 20,
        ),
        CustomInfoWidget(
          title: 'Full Name',
          info: shippingModel.name.toString(),
        ),
        const SizedBox(
          height: 8.5,
        ),
        const CustomInfoWidget(
          title: 'Mobile Number',
          info: '010987654321',
        ),
        const SizedBox(
          height: 8.5,
        ),
        CustomInfoWidget(
          title: 'Province',
          info: shippingModel.region.toString(),
        ),
        const SizedBox(
          height: 8.5,
        ),
        CustomInfoWidget(
          title: 'City',
          info: shippingModel.city.toString(),
        ),
        const SizedBox(
          height: 8.5,
        ),
        CustomInfoWidget(
          title: 'Street Address',
          info: shippingModel.details.toString(),
        ),
        const SizedBox(
          height: 8.5,
        ),
        CustomInfoWidget(
          title: 'Postal Code',
          info: shippingModel.notes.toString(),
        ),
      ],
    );
  }
}
