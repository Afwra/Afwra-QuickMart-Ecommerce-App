import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quick_mart/core/utils/app_text_styles.dart';

class CustomFitlerListTile extends StatelessWidget {
  const CustomFitlerListTile({
    super.key,
    required this.title,
    required this.isPressed,
    this.onChange,
  });
  final void Function(bool?)? onChange;
  final String title;
  final bool isPressed;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      horizontalTitleGap: 12.w,
      leading: Transform.scale(
        scale: 1.5,
        child: Checkbox(
          value: isPressed,
          onChanged: onChange,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.r)),
          activeColor: Colors.blue,
        ),
      ),
      title: Text(
        title,
        style: AppTextStyles.body2Medium,
      ),
    );
  }
}
