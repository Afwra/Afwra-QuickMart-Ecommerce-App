import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeletonizer/skeletonizer.dart';

class CustomHomeCategoryLoadingWidget extends StatelessWidget {
  const CustomHomeCategoryLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: true,
      child: Row(
        children: List.generate(
          4,
          (index) => Padding(
              padding: EdgeInsets.only(right: index == 4 ? 0 : 8),
              child: Container(
                height: 70.h,
                width: 75.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.r),
                ),
              )),
        ),
      ),
    );
  }
}
