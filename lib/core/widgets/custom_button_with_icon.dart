import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quick_mart/core/utils/app_text_styles.dart';
import 'package:svg_flutter/svg.dart';

class CustomButtonWithIcon extends StatelessWidget {
  const CustomButtonWithIcon(
      {super.key,
      required this.text,
      this.onPressed,
      this.color,
      this.textColor,
      this.borderColor,
      required this.iconPath});
  final String text, iconPath;
  final void Function()? onPressed;
  final Color? color, textColor, borderColor;
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      height: 60.h,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(color: borderColor ?? Colors.transparent, width: 2),
      ),
      color: color,
      onPressed: onPressed,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            text,
            style: AppTextStyles.button2
                .copyWith(color: textColor ?? Colors.white),
          ),
          const SizedBox(
            width: 8,
          ),
          SvgPicture.asset(iconPath),
        ],
      ),
    );
  }
}
