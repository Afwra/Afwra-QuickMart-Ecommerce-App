import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quick_mart/core/utils/app_assets.dart';
import 'package:quick_mart/core/utils/app_colors.dart';
import 'package:quick_mart/core/utils/app_text_styles.dart';
import 'package:quick_mart/core/widgets/custom_image_widget.dart';
import 'package:quick_mart/features/home/presentation/view_model/home_cubit/home_cubit.dart';
import 'package:svg_flutter/svg.dart';

class CustomProfileAppBar extends StatelessWidget {
  const CustomProfileAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<HomeCubit>(context);
    return SliverAppBar(
      expandedHeight: 135.h,
      backgroundColor: AppColors.kBrandColorCyan,
      elevation: 0,
      stretch: true,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        background: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8.r),
                child: CustomImageWidget(
                  imageUrl: cubit.userModel?.image ?? '',
                  height: 40.h,
                  width: 40.w,
                  boxFit: BoxFit.cover,
                ),
              ),
              const SizedBox(
                width: 8,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    cubit.userModel?.name ?? 'Loading',
                    style: AppTextStyles.button1
                        .copyWith(color: AppColors.kBrandColorWhite),
                  ),
                  Text(
                    cubit.userModel?.email ?? 'Loading',
                    style: AppTextStyles.button2
                        .copyWith(color: AppColors.kBrandColorWhite),
                  ),
                ],
              ),
              const Spacer(),
              InkWell(
                onTap: () =>
                    BlocProvider.of<HomeCubit>(context).logout(context),
                child: SvgPicture.asset(
                  AppAssets.logoutIcon,
                  height: 32.h,
                  width: 32.w,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
