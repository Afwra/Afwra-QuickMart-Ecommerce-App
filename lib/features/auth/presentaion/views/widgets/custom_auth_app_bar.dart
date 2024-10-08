import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quick_mart/core/utils/app_assets.dart';
import 'package:svg_flutter/svg.dart';

class CustomAuthAppBar extends StatelessWidget {
  const CustomAuthAppBar({super.key, required this.darkMode});
  final bool darkMode;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(
          darkMode ? AppAssets.quickMartLogoDarkMode : AppAssets.quickMartLogo,
          height: 32.h,
          width: 102.w,
        ),
      ],
    );
  }
}
