import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quick_mart/core/utils/app_colors.dart';
import 'package:quick_mart/core/utils/app_text_styles.dart';
import 'package:quick_mart/core/widgets/custom_image_widget.dart';
import 'package:quick_mart/features/home/presentation/views/widgets/custom_banner_item.dart';
import 'package:quick_mart/features/home/presentation/views/widgets/custom_category_item.dart';
import 'package:quick_mart/features/home/presentation/views/widgets/custom_home_view_app_bar.dart';
import 'package:quick_mart/features/home/presentation/views/widgets/custom_home_view_title.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CustomHomeViewAppBar(),
        const SizedBox(
          height: 24,
        ),
        const CustomBannerItem(),
        const SizedBox(
          height: 24,
        ),
        CustomHomeViewTitle(
          title: 'Categories',
          onPressed: () {},
        ),
        const SizedBox(
          height: 12,
        ),
        CustomCategoryItem(
          containerHeight: 70.h,
          containerWidth: 88.w,
          title: 'Shoes',
          imageUrl: 'assets/images/shoes.png',
          imageHeight: 20.h,
          imageWidth: 20.w,
          isDarkMode: false,
        ),
        const SizedBox(
          height: 24,
        ),
        CustomHomeViewTitle(
          title: 'Latest Products',
          onPressed: () {},
        ),
        const SizedBox(
          height: 12,
        ),
        Container(
          child: Column(
            children: [
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(24.r),
                    child: CustomImageWidget(
                      imageUrl: 'https://t.ly/w0j3d',
                      height: 138.h,
                      width: 160.w,
                    ),
                  ),
                  Positioned(
                    top: 6.h,
                    right: 6.w,
                    child: CircleAvatar(
                      backgroundColor: Colors.black,
                      child: Icon(
                        Icons.heart_broken,
                        color: Colors.white,
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 8,
              ),
            ],
          ),
        )
      ],
    );
  }
}
