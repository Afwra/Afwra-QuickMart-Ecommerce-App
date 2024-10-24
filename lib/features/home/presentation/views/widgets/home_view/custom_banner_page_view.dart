import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quick_mart/features/home/presentation/view_model/banner_cubit/banner_cubit.dart';
import 'package:quick_mart/features/home/presentation/view_model/banner_cubit/banner_state.dart';
import 'package:quick_mart/features/home/presentation/views/widgets/home_view/custom_banner_item.dart';
import 'package:skeletonizer/skeletonizer.dart';

class CustomBannerPageView extends StatelessWidget {
  const CustomBannerPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BannerCubit, BannerState>(
      builder: (context, state) {
        if (state is BannerError) {
          return Center(
            child: Text(state.errMsg),
          );
        } else if (state is BannerSuccess) {
          return SizedBox(
            height: 148.h,
            child: PageView.builder(
              controller: BlocProvider.of<BannerCubit>(context).pageController,
              scrollDirection: Axis.horizontal,
              physics: const ClampingScrollPhysics(),
              itemCount: state.banners.length,
              itemBuilder: (context, index) {
                return CustomBannerItem(
                  banner: state.banners[index],
                );
              },
              onPageChanged: (page) =>
                  BlocProvider.of<BannerCubit>(context).updatePageIndex(page),
            ),
          );
        } else {
          return Skeletonizer(
            enabled: true,
            child: Container(
              height: 148.h,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24.r),
              ),
            ),
          );
        }
      },
    );
  }
}
