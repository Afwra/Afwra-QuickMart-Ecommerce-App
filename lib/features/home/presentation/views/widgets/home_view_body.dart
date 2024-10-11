import 'package:flutter/material.dart';
import 'package:quick_mart/features/home/presentation/views/widgets/custom_banner_item.dart';
import 'package:quick_mart/features/home/presentation/views/widgets/custom_home_view_app_bar.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CustomHomeViewAppBar(),
        const SizedBox(
          height: 24,
        ),
        const CustomBannerItem()
      ],
    );
  }
}
