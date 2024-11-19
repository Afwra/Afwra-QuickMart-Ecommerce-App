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
      return AnimatedImageDialog(url: url);
    },
  );
}

class AnimatedImageDialog extends StatefulWidget {
  final String url;

  const AnimatedImageDialog({super.key, required this.url});

  @override
  AnimatedImageDialogState createState() => AnimatedImageDialogState();
}

class AnimatedImageDialogState extends State<AnimatedImageDialog>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _animation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    );
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: _animation,
      child: Dialog(
        backgroundColor: AppSettings.darkMode
            ? AppColors.kBrandColorBlack
            : AppColors.kBrandColorWhite,
        alignment: Alignment.center,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.r),
        ),
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: IntrinsicHeight(
          child: Column(
            children: [
              CustomImageWidget(
                imageUrl: widget.url,
                boxFit: BoxFit.scaleDown,
              ),
              CustomTextButton(
                buttonText: 'Close',
                onPressed: () => Navigator.pop(context),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
