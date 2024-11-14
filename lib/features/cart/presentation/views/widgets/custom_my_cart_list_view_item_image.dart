import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quick_mart/core/widgets/custom_image_widget.dart';

class CustomMyCartListViewItemImage extends StatelessWidget {
  const CustomMyCartListViewItemImage({
    super.key,
    required this.imageUrl,
  });
  final String imageUrl;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12.r),
      child: CustomImageWidget(
        imageUrl: imageUrl,
        boxFit: BoxFit.scaleDown,
        height: 140.h,
        width: 120.w,
      ),
    );
  }
}
