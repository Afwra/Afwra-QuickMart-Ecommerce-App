import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quick_mart/core/utils/app_settings.dart';
import 'package:quick_mart/features/home/presentation/view_model/home_cubit/home_cubit.dart';
import 'package:quick_mart/features/home/presentation/view_model/home_cubit/home_state.dart';
import 'package:quick_mart/features/home/presentation/view_model/theme_cubit/theme_cubit.dart';
import 'package:quick_mart/features/home/presentation/view_model/theme_cubit/theme_state.dart';
import 'package:quick_mart/features/home/presentation/views/widgets/categories_view/categories_view.dart';
import 'package:quick_mart/features/home/presentation/views/widgets/home_view/home_view.dart';
import 'package:quick_mart/features/cart/presentation/views/my_cart_view.dart';
import 'package:quick_mart/features/profile/presentation/views/profile_view.dart';
import 'package:quick_mart/features/whishlist/presentation/views/wish_list_view.dart';
import 'package:quick_mart/features/home/presentation/views/widgets/custom_bottom_navigation_bar.dart';

class HomeLayout extends StatelessWidget {
  const HomeLayout({super.key, this.passedPageIndex});
  final int? passedPageIndex;
  final List<Widget> pages = const [
    HomeView(),
    CategoriesView(),
    MyCartView(),
    WishListView(),
    ProfileView(),
  ];
  @override
  Widget build(BuildContext context) {
    HomeCubit cubit = BlocProvider.of<HomeCubit>(context);
    if (passedPageIndex != null) {
      cubit.changeNavigationBarIndex(passedPageIndex!);
    }
    return BlocBuilder<ThemeCubit, ThemeState>(
      builder: (context, state) {
        return BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            return Scaffold(
              body: SafeArea(
                  child: Padding(
                padding: cubit.currPage != 4
                    ? EdgeInsets.only(top: 10.h, right: 16.w, left: 16.w)
                    : EdgeInsets.zero,
                child: pages[cubit.currPage],
              )),
              bottomNavigationBar: CustomBottomNavigationBar(
                currPage: cubit.currPage,
                isDarkMode: AppSettings.darkMode,
                onTapped: (p) => cubit.changeNavigationBarIndex(p),
              ),
            );
          },
        );
      },
    );
  }
}
