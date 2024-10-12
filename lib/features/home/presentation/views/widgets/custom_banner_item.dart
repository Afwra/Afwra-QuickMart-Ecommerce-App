import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quick_mart/core/utils/app_colors.dart';
import 'package:quick_mart/core/utils/app_text_styles.dart';
import 'package:quick_mart/core/widgets/custom_image_widget.dart';
import 'package:quick_mart/features/home/data/models/banner_model.dart';
import 'package:quick_mart/features/home/presentation/view_model/home_cubit/home_cubit.dart';

class CustomBannerItem extends StatelessWidget {
  const CustomBannerItem({
    super.key,
    required this.banner,
  });
  final BannerModel banner;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(24.r),
          child: CustomImageWidget(
            imageUrl: banner.image,
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
          left: BlocProvider.of<HomeCubit>(context).lang == 'en' ? 12.w : 0,
          right: BlocProvider.of<HomeCubit>(context).lang == 'ar' ? 12.w : 0,
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
              Row(
                children: [
                  Text(
                    'Exclusive Sales',
                    style: AppTextStyles.heading2Bold
                        .copyWith(color: Colors.white),
                  ),
                  // SmoothIndicator(
                  //   offset: BlocProvider.of<BannerCubit>(context)
                  //       .pageController
                  //       .page!,
                  //   count: BlocProvider.of<BannerCubit>(context).banners.length,
                  //   size: Size(3.w, 3.h),
                  //   effect: WormEffect(
                  //     dotColor: AppColors.kGrey100,
                  //     activeDotColor: AppColors.kBrandColorCyan,
                  //   ),
                  // ),
                ],
              ),
            ],
          ),
        )
      ],
    );
  }
}
