import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:quick_mart/core/utils/app_assets.dart';
import 'package:quick_mart/core/utils/app_colors.dart';
import 'package:quick_mart/core/utils/app_routes.dart';
import 'package:quick_mart/core/utils/app_text_styles.dart';
import 'package:quick_mart/features/on_boarding/data/models/on_boarding_item_model.dart';
import 'package:quick_mart/features/on_boarding/presentation/view_models/on_boarding_cubit/on_boarding_cubit.dart';
import 'package:svg_flutter/svg.dart';

class OnBoardingContainer extends StatelessWidget {
  const OnBoardingContainer({super.key, required this.item});
  final OnBoardingItemModel item;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 20.h, left: 18.w, right: 18.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(32),
        color: AppColors.kBrandColorCyan50,
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              buildRowItem(
                  BlocProvider.of<OnBoardingCubit>(context).index, context),
              BlocProvider.of<OnBoardingCubit>(context).index < 2
                  ? TextButton(
                      onPressed: () {
                        GoRouter.of(context).go(AppRoutes.kLoginView);
                      },
                      child: Text(
                        'Skip For Now',
                        style: AppTextStyles.body2Medium
                            .copyWith(color: AppColors.kBrandColorCyan),
                      ),
                    )
                  : const SizedBox()
            ],
          ),
          const SizedBox(
            height: 46,
          ),
          Image.asset(
            height: 240.h,
            width: 240.w,
            item.image,
            fit: BoxFit.cover,
          ),
          const SizedBox(
            height: 70,
          ),
        ],
      ),
    );
  }

  Widget buildRowItem(index, context) {
    if (index == 0) {
      return SvgPicture.asset(AppAssets.quickMartLogo);
    } else {
      return GestureDetector(
        child: SvgPicture.asset(AppAssets.arrowLeft),
        onTap: () {
          BlocProvider.of<OnBoardingCubit>(context).previousPage(context);
        },
      );
    }
  }
}