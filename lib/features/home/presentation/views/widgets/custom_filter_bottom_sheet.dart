import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quick_mart/core/utils/app_colors.dart';
import 'package:quick_mart/core/utils/app_constants.dart';
import 'package:quick_mart/core/utils/app_settings.dart';
import 'package:quick_mart/core/utils/app_text_styles.dart';
import 'package:quick_mart/core/widgets/custom_button.dart';
import 'package:quick_mart/features/home/presentation/views/widgets/custom_filter_list_tile.dart';

class CustomFilterBottomSheet extends StatefulWidget {
  const CustomFilterBottomSheet({
    super.key,
    this.onPressed,
  });
  final void Function()? onPressed;

  @override
  State<CustomFilterBottomSheet> createState() =>
      _CustomFilterBottomSheetState();
}

enum FilterTypes { lowToHigh, highToLow, aToZ, zToA }

class FilterModel {
  final String title;
  bool value;
  final FilterTypes filterType;
  FilterModel(
      {required this.title, required this.value, required this.filterType});
}

class _CustomFilterBottomSheetState extends State<CustomFilterBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 32.h, vertical: 16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Filter',
            style: AppTextStyles.body1Medium.copyWith(
                color: AppSettings.darkMode
                    ? Colors.white
                    : AppColors.kBrandColorBlack),
          ),
          const SizedBox(
            height: 16,
          ),
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) {
                return CustomFitlerListTile(
                  isPressed: AppConstants.filterList[index].value,
                  title: AppConstants.filterList[index].title,
                  onChange: (value) {
                    for (var i = 0; i < AppConstants.filterList.length; i++) {
                      if (i == index) {
                        AppConstants.filterList[i].value = value!;
                      } else {
                        AppConstants.filterList[i].value = false;
                      }
                    }
                    setState(() {});
                  },
                );
              },
              itemCount: AppConstants.filterList.length,
            ),
          ),
          const SizedBox(
            height: 24,
          ),
          SizedBox(
            width: double.infinity,
            child: CustomButton(
              text: 'Apply',
              color: AppSettings.darkMode
                  ? AppColors.kBrandColorCyan
                  : AppColors.kBrandColorBlack,
              elevation: 0,
              onPressed: widget.onPressed,
            ),
          )
        ],
      ),
    );
  }
}
