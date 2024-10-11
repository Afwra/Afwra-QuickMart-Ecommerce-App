import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quick_mart/features/home/presentation/views/widgets/custom_category_item.dart';

class CustomHomeViewCategoryRow extends StatelessWidget {
  const CustomHomeViewCategoryRow({super.key, this.darkMode = false});

  final bool darkMode;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Row(
        children: List.generate(
          4,
          (index) => Padding(
            padding: EdgeInsets.only(right: index == 4 ? 0 : 8),
            child: CustomCategoryItem(
              containerHeight: 70.h,
              containerWidth: 75.w,
              title: 'Shoes',
              imageUrl: 'assets/images/shoes.png',
              imageHeight: 20.h,
              imageWidth: 20.w,
              isDarkMode: darkMode,
            ),
          ),
        ),
      ),
    );
  }
}
