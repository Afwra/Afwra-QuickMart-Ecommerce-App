import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quick_mart/core/utils/app_assets.dart';
import 'package:quick_mart/core/utils/app_colors.dart';
import 'package:quick_mart/core/utils/app_text_styles.dart';
import 'package:svg_flutter/svg.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({
    super.key,
    required this.currPage,
    this.onTapped,
    required this.isDarkMode,
  });
  final int currPage;
  final void Function(int)? onTapped;
  final bool isDarkMode;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70.h,
      child: BottomNavigationBar(
        backgroundColor: isDarkMode ? AppColors.kBrandColorBlack : Colors.white,
        currentIndex: currPage,
        onTap: onTapped,
        selectedLabelStyle: AppTextStyles.captionSemiBold.copyWith(
            color: isDarkMode ? Colors.white : AppColors.kBrandColorBlack),
        unselectedLabelStyle: AppTextStyles.captionRegular
            .copyWith(color: isDarkMode ? Colors.white : AppColors.kGrey150),
        elevation: 2,
        selectedItemColor: AppColors.kBrandColorCyan,
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
        unselectedItemColor: AppColors.kGrey150,
        enableFeedback: false,
        items: [
          customBottomNavigationItem('Home', AppAssets.homeIcon, 0),
          customBottomNavigationItem('Categories', AppAssets.categoriesIcon, 1),
          customBottomNavigationItem('My Cart', AppAssets.cartIcon, 2),
          customBottomNavigationItem('Whishlist', AppAssets.whichListIcon, 3),
          customBottomNavigationItem('Profile', AppAssets.profileIcon, 4),
        ],
      ),
    );
  }

  BottomNavigationBarItem customBottomNavigationItem(
      String label, String icon, int index) {
    return BottomNavigationBarItem(
      icon: SvgPicture.asset(
        icon,
        colorFilter: ColorFilter.mode(
          currPage == index ? AppColors.kBrandColorCyan : AppColors.kGrey150,
          BlendMode.srcIn,
        ),
      ),
      label: label,
    );
  }
}
