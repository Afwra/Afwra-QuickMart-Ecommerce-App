import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:quick_mart/core/utils/app_assets.dart';
import 'package:quick_mart/core/utils/app_text_styles.dart';
import 'package:svg_flutter/svg_flutter.dart';

class CustomCheckoutViewAppBar extends StatelessWidget {
  const CustomCheckoutViewAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InkWell(
          onTap: () => GoRouter.of(context).pop(),
          child: SvgPicture.asset(
            AppAssets.arrowLeft,
            width: 32.h,
            height: 32.h,
          ),
        ),
        const SizedBox(
          width: 6,
        ),
        Text(
          'Checkout',
          style: AppTextStyles.body2Medium,
        ),
      ],
    );
  }
}
