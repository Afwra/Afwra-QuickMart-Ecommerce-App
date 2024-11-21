import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quick_mart/core/utils/app_assets.dart';
import 'package:quick_mart/core/utils/app_colors.dart';
import 'package:quick_mart/core/utils/app_text_styles.dart';
import 'package:svg_flutter/svg.dart';

class CustomCheckoutStatusWidget extends StatelessWidget {
  const CustomCheckoutStatusWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomCheckoutStatusItem(
          title: 'Shipping',
          iconPath: AppAssets.shippingAddressIcon,
          isFinished: true,
        ),
        const SizedBox(
          width: 9,
        ),
        SizedBox(
          width: 48.w,
          child: Divider(
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
        ),
        const SizedBox(
          width: 9,
        ),
        SizedBox(
          width: 48.w,
          child: Divider(
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
        ),
      ],
    );
  }
}

class CustomCheckoutStatusItem extends StatelessWidget {
  const CustomCheckoutStatusItem({
    super.key,
    required this.iconPath,
    required this.title,
    this.isFinished = false,
  });
  final String iconPath, title;
  final bool isFinished;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SvgPicture.asset(
          iconPath,
          height: 24.h,
          width: 24.w,
          colorFilter: ColorFilter.mode(
            isFinished ? AppColors.kBrandColorCyan : AppColors.kGrey150,
            BlendMode.srcIn,
          ),
        ),
        Text(
          title,
          style: AppTextStyles.captionSemiBold.copyWith(
            color: isFinished ? AppColors.kBrandColorCyan : AppColors.kGrey150,
          ),
        ),
      ],
    );
  }
}
