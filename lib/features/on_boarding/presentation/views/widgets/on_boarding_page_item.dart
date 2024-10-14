import 'package:flutter/material.dart';
import 'package:quick_mart/features/on_boarding/data/models/on_boarding_item_model.dart';
import 'package:quick_mart/features/on_boarding/presentation/views/widgets/on_boarding_title_and_subtitle.dart';
import 'package:quick_mart/features/on_boarding/presentation/views/widgets/on_boarding_container.dart';

class OnBoardingPageItem extends StatelessWidget {
  const OnBoardingPageItem({
    super.key,
    required this.item,
  });
  final OnBoardingItemModel item;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          OnBoardingContainer(item: item),
          const SizedBox(
            height: 20,
          ),
          OnBoardingTitleAndSubtitle(item: item),
        ],
      ),
    );
  }
}
