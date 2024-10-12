import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quick_mart/core/utils/app_assets.dart';

import 'package:quick_mart/core/widgets/custom_text_button.dart';
import 'package:svg_flutter/svg.dart';

class CustomAuthAppBar extends StatelessWidget {
  const CustomAuthAppBar(
      {super.key, required this.darkMode, required this.text, this.onPressed});
  final bool darkMode;
  final String text;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SvgPicture.asset(
          darkMode ? AppAssets.quickMartLogoDarkMode : AppAssets.quickMartLogo,
          height: 32.h,
          width: 102.w,
        ),
        CustomTextButton(
          buttonText: text,
          onPressed: onPressed,
        )
      ],
    );
  }
}
