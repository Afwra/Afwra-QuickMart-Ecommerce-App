import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quick_mart/core/utils/app_colors.dart';
import 'package:quick_mart/core/utils/app_text_styles.dart';
import 'package:svg_flutter/svg.dart';

class CustomProfileViewListTileWithCustomWidget extends StatelessWidget {
  const CustomProfileViewListTileWithCustomWidget(
      {super.key,
      required this.title,
      required this.leadingIcon,
      this.trailing});
  final String title, leadingIcon;
  final Widget? trailing;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: SvgPicture.asset(
        leadingIcon,
        height: 24.h,
        width: 24.w,
        colorFilter:
            const ColorFilter.mode(AppColors.kGrey150, BlendMode.srcIn),
      ),
      title: Text(
        title,
        style: AppTextStyles.body2Medium.copyWith(color: AppColors.kGrey150),
      ),
      trailing: trailing,
      //  isDarkModeTile
      //     ? SizedBox(
      //         height: 32.h, width: 32.w, child: const CustomSwitchButton())
      //     : SvgPicture.asset(
      //         AppAssets.arrowRight,
      //         height: 24.h,
      //         width: 24.w,
      //         colorFilter:
      //             const ColorFilter.mode(AppColors.kGrey150, BlendMode.srcIn),
      //       ),
    );
  }
}
