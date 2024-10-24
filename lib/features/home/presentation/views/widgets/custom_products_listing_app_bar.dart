import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:quick_mart/core/utils/app_assets.dart';
import 'package:quick_mart/core/utils/app_text_styles.dart';
import 'package:svg_flutter/svg_flutter.dart';

class CustomProductListingAppBar extends StatelessWidget {
  const CustomProductListingAppBar({
    super.key,
    required this.title,
    this.onTap,
  });
  final String title;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
            onTap: () {
              GoRouter.of(context).pop();
            },
            child: SvgPicture.asset(
              AppAssets.arrowLeft,
              height: 32.h,
              width: 32.w,
            )),
        const SizedBox(
          width: 12,
        ),
        Text(
          title,
          style: AppTextStyles.body2Medium,
        ),
        const Spacer(),
        GestureDetector(
          onTap: onTap,
          child: SvgPicture.asset(
            AppAssets.filterIcon,
            height: 32.h,
            width: 32.w,
          ),
        ),
        const SizedBox(
          width: 12,
        ),
        SvgPicture.asset(AppAssets.searchIcon, height: 32.h, width: 32.w),
      ],
    );
  }
}