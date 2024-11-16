import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quick_mart/core/utils/app_colors.dart';
import 'package:quick_mart/core/utils/app_settings.dart';
import 'package:quick_mart/features/home/presentation/view_model/theme_cubit/theme_cubit.dart';
import 'package:quick_mart/features/home/presentation/view_model/theme_cubit/theme_state.dart';
import 'package:quick_mart/features/profile/presentation/views/widgets/account_management_section.dart';
import 'package:quick_mart/features/profile/presentation/views/widgets/personal_information_section.dart';
import 'package:quick_mart/features/profile/presentation/views/widgets/support_and_information_section.dart';

class CustomProfileViewBottomSection extends StatelessWidget {
  const CustomProfileViewBottomSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeState>(
      builder: (context, state) {
        return SliverToBoxAdapter(
          child: Container(
            color: AppColors.kBrandColorCyan,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 24.h),
              decoration: BoxDecoration(
                color: AppSettings.darkMode
                    ? AppColors.kBrandColorBlack
                    : AppColors.kBrandColorWhite,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(24.r),
                  topRight: Radius.circular(24.r),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  PersonalInformationSection(
                    darkMode: AppSettings.darkMode,
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  SupportAndInformationSection(
                    darkMode: AppSettings.darkMode,
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  AccountManagementSection(
                    txtButtonOnPressed: () {
                      BlocProvider.of<ThemeCubit>(context)
                          .changeAppLocale(context);
                    },
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
