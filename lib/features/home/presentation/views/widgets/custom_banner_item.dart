import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quick_mart/core/utils/app_colors.dart';
import 'package:quick_mart/core/utils/app_constants.dart';
import 'package:quick_mart/core/utils/app_text_styles.dart';
import 'package:quick_mart/core/widgets/custom_image_widget.dart';

class CustomBannerItem extends StatelessWidget {
  const CustomBannerItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(24.r),
          child: CustomImageWidget(
            imageUrl: AppConstants.exclusivePictureLink,
            height: 148.h,
            width: double.infinity,
          ),
        ),
        Container(
          height: 148.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24.r),
            gradient: LinearGradient(
              colors: [
                Colors.black.withOpacity(0.5), // Starting color with opacity
                Colors.transparent, // Ending color with opacity
              ],
              begin: Alignment.bottomCenter, // Gradient starts from the top
              end: Alignment.topCenter, // Gradient ends at the bottom
            ),
          ),
        ),
        Positioned(
          bottom: 10.h,
          left: 12.w,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 5.5.h),
                decoration: BoxDecoration(
                  color: AppColors.kBrandColorBlack,
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: Text(
                  '30% OFF',
                  style: AppTextStyles.overlineSemiBold
                      .copyWith(color: Colors.white),
                ),
              ),
              const SizedBox(
                height: 6,
              ),
              Text(
                'On HeadPhones',
                style:
                    AppTextStyles.captionRegular.copyWith(color: Colors.white),
              ),
              Text(
                'Exclusive Sales',
                style: AppTextStyles.heading2Bold.copyWith(color: Colors.white),
              ),
            ],
          ),
        )
      ],
    );
  }
}
