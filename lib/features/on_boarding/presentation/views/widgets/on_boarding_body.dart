import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quick_mart/features/on_boarding/presentation/view_models/on_boarding_cubit/on_boarding_cubit.dart';
import 'package:quick_mart/features/on_boarding/presentation/views/widgets/on_boarding_button.dart';
import 'package:quick_mart/features/on_boarding/presentation/views/widgets/on_boarding_page_indicator.dart';
import 'package:quick_mart/features/on_boarding/presentation/views/widgets/on_boarding_page_view.dart';

class OnBoardingBody extends StatelessWidget {
  const OnBoardingBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: BlocProvider(
        create: (context) => OnBoardingCubit(),
        child: const Column(
          children: [
            SizedBox(
              height: 5,
            ),
            Flexible(child: OnBoardingPageView()),
            SizedBox(
              height: 24,
            ),
            OnBoardingButton(),
            SizedBox(
              height: 24,
            ),
            OnBoardingPageIndicator(),
            SizedBox(
              height: 24,
            ),
          ],
        ),
      ),
    );
  }
}
