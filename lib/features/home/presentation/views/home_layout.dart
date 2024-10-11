import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quick_mart/features/home/presentation/view_model/home_cubit/home_cubit.dart';
import 'package:quick_mart/features/home/presentation/view_model/home_cubit/home_state.dart';
import 'package:quick_mart/features/home/presentation/views/categories_view.dart';
import 'package:quick_mart/features/home/presentation/views/home_view.dart';
import 'package:quick_mart/features/home/presentation/views/my_cart_view.dart';
import 'package:quick_mart/features/home/presentation/views/profile_view.dart';
import 'package:quick_mart/features/home/presentation/views/whish_list_view.dart';
import 'package:quick_mart/features/home/presentation/views/widgets/custom_bottom_navigation_bar.dart';

class HomeLayout extends StatelessWidget {
  const HomeLayout({super.key});
  final List<Widget> pages = const [
    HomeView(),
    CategoriesView(),
    MyCartView(),
    WhishListView(),
    ProfileView(),
  ];
  @override
  Widget build(BuildContext context) {
    HomeCubit cubit = BlocProvider.of<HomeCubit>(context);
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        return Scaffold(
          body: SafeArea(
              child: Padding(
            padding: EdgeInsets.only(top: 10.h, right: 16.w, left: 16.w),
            child: pages[cubit.currPage],
          )),
          bottomNavigationBar: CustomBottomNavigationBar(
            currPage: cubit.currPage,
            isDarkMode: cubit.isDarkMode,
            onTapped: (p) => cubit.changeNavigationBarIndex(p),
          ),
        );
      },
    );
  }
}