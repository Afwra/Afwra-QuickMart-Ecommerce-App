import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quick_mart/core/utils/app_colors.dart';
import 'package:quick_mart/core/utils/app_settings.dart';
import 'package:quick_mart/core/widgets/custom_image_widget.dart';
import 'package:quick_mart/core/widgets/custom_text_button.dart';

void showImageDialog({required BuildContext context, required String url}) {
  showDialog(
    context: context,
    builder: (context) {
      return Dialog(
          backgroundColor: AppSettings.darkMode
              ? AppColors.kBrandColorBlack
              : AppColors.kBrandColorWhite,
          alignment: Alignment.center,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.r)),
          clipBehavior: Clip.antiAliasWithSaveLayer,
          child: IntrinsicHeight(
            child: Column(
              children: [
                CustomImageWidget(
                  imageUrl: url,
                  boxFit: BoxFit.scaleDown,
                ),
                CustomTextButton(
                  buttonText: 'Close',
                  onPressed: () => Navigator.pop(context),
                ),
              ],
            ),
          ));
    },
  );
}
