import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quick_mart/core/widgets/custom_image_widget.dart';

class CustomMyCartListViewItemImage extends StatelessWidget {
  const CustomMyCartListViewItemImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12.r),
      child: CustomImageWidget(
        imageUrl: 'https://tinyurl.com/k8z3w8nw',
        boxFit: BoxFit.cover,
        height: 140.h,
        width: 120.w,
      ),
    );
  }
}
