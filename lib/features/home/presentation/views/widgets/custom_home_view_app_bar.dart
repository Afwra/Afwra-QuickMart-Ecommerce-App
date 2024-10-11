import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quick_mart/core/utils/app_assets.dart';
import 'package:quick_mart/core/utils/app_colors.dart';
import 'package:quick_mart/core/utils/app_constants.dart';
import 'package:quick_mart/core/widgets/custom_image_widget.dart';
import 'package:svg_flutter/svg_flutter.dart';

class CustomHomeViewAppBar extends StatelessWidget {
  const CustomHomeViewAppBar({super.key, this.darkMode = false});
  final bool darkMode;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(
          darkMode ? AppAssets.quickMartLogoDarkMode : AppAssets.quickMartLogo,
          height: 32.h,
          fit: BoxFit.cover,
        ),
        const Spacer(),
        SvgPicture.asset(
          AppAssets.searchIcon,
          colorFilter: ColorFilter.mode(
            darkMode ? Colors.white : AppColors.kBrandColorBlack,
            BlendMode.srcIn,
          ),
          height: 32.h,
          width: 32.w,
          fit: BoxFit.cover,
        ),
        const SizedBox(
          width: 12,
        ),
        ClipRRect(
          borderRadius: BorderRadius.circular(8.r),
          child: CustomImageWidget(
            imageUrl: AppConstants.profilePictureLink,
            height: 32.h,
            width: 32.w,
          ),
        ),
      ],
    );
  }
}
