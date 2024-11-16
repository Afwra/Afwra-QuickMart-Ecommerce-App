import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:quick_mart/core/utils/app_assets.dart';
import 'package:quick_mart/core/utils/app_colors.dart';
import 'package:quick_mart/core/utils/app_settings.dart';
import 'package:svg_flutter/svg_flutter.dart';

class CustomSearchViewAppBar extends StatelessWidget {
  const CustomSearchViewAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SvgPicture.asset(
          AppSettings.darkMode
              ? AppAssets.quickMartLogoDarkMode
              : AppAssets.quickMartLogo,
          width: 104.w,
          height: 32.h,
        ),
        IconButton(
          onPressed: () {
            GoRouter.of(context).pop();
          },
          icon: Icon(
            Icons.close_sharp,
            color: AppSettings.darkMode
                ? Colors.white
                : AppColors.kBrandColorBlack,
          ),
        ),
      ],
    );
  }
}
