import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quick_mart/features/on_boarding/presentation/view_models/on_boarding_cubit/on_boarding_cubit.dart';
import 'package:quick_mart/features/on_boarding/presentation/views/widgets/on_boarding_page_item.dart';

class OnBoardingPageView extends StatelessWidget {
  const OnBoardingPageView({super.key});

  @override
  Widget build(BuildContext context) {
    OnBoardingCubit cubit = BlocProvider.of<OnBoardingCubit>(context);
    return PageView.builder(
      controller: cubit.pageController,
      itemCount: cubit.onBoardingItems.length,
      itemBuilder: (context, index) => OnBoardingPageItem(
        item: cubit.onBoardingItems[index],
      ),
      onPageChanged: (value) {
        cubit.changeIndex(value);
      },
    );
  }
}
