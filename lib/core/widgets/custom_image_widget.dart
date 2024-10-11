import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:quick_mart/core/utils/app_colors.dart';

class CustomImageWidget extends StatelessWidget {
  const CustomImageWidget(
      {super.key,
      required this.imageUrl,
      this.height,
      this.width,
      this.boxFit = BoxFit.cover});
  final String imageUrl;
  final double? height, width;
  final BoxFit? boxFit;
  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      height: height,
      width: width,
      fit: boxFit,
      placeholder: (context, url) => const Center(
          child: CircularProgressIndicator(
        color: AppColors.kBrandColorCyan,
      )),
      errorWidget: (context, url, error) => const Center(
          child: Icon(
        Icons.error,
        color: Colors.cyan,
      )),
    );
  }
}
