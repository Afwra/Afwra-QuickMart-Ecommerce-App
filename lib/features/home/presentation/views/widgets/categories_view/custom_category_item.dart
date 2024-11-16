import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quick_mart/core/utils/app_colors.dart';
import 'package:quick_mart/core/utils/app_settings.dart';
import 'package:quick_mart/core/utils/app_text_styles.dart';
import 'package:quick_mart/core/widgets/custom_image_widget.dart';

class CustomCategoryItem extends StatelessWidget {
  const CustomCategoryItem({
    super.key,
    required this.title,
    required this.imageUrl,
    required this.containerHeight,
    required this.containerWidth,
    required this.imageHeight,
    required this.imageWidth,
    this.isDarkMode = false,
    this.textStyle,
    this.boxFit,
  });
  final String title, imageUrl;
  final double containerHeight, containerWidth, imageHeight, imageWidth;
  final bool isDarkMode;
  final TextStyle? textStyle;
  final BoxFit? boxFit;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: containerWidth,
      height: containerHeight,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(
          color: isDarkMode ? AppColors.kGrey50DarkMode : AppColors.kGrey50,
          width: 1,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomImageWidget(
            imageUrl: imageUrl,
            height: imageHeight,
            width: imageWidth,
            boxFit: boxFit,
          ),
          const SizedBox(
            height: 2,
          ),
          Text(
            title,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: textStyle ??
                AppTextStyles.overlineSemiBold.copyWith(
                  color: AppSettings.darkMode
                      ? Colors.white
                      : AppColors.kBrandColorBlack,
                ),
          ),
        ],
      ),
    );
  }
}
