import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quick_mart/core/utils/app_colors.dart';
import 'package:quick_mart/core/utils/app_settings.dart';
import 'package:quick_mart/core/utils/app_text_styles.dart';

class SearchListViewItem extends StatelessWidget {
  const SearchListViewItem({
    super.key,
    required this.query,
    this.onTap,
  });
  final String query;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 64.h,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          GestureDetector(
            onTap: onTap,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  query,
                  style: AppTextStyles.body2Medium.copyWith(
                      color: AppSettings.darkMode
                          ? Colors.white
                          : AppColors.kBrandColorBlack),
                ),
                const Icon(
                  Icons.arrow_upward_outlined,
                  color: AppColors.kGrey100,
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 4,
          ),
          const Divider(
            thickness: 1,
            color: AppColors.kGrey50,
          )
        ],
      ),
    );
  }
}
