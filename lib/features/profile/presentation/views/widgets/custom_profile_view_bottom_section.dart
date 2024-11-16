import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quick_mart/core/utils/app_colors.dart';
import 'package:quick_mart/features/profile/presentation/views/widgets/account_management_section.dart';
import 'package:quick_mart/features/profile/presentation/views/widgets/personal_information_section.dart';
import 'package:quick_mart/features/profile/presentation/views/widgets/support_and_information_section.dart';

class CustomProfileViewBottomSection extends StatelessWidget {
  const CustomProfileViewBottomSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        color: AppColors.kBrandColorCyan,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 24.h),
          decoration: BoxDecoration(
            color: AppColors.kBrandColorWhite,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(24.r),
              topRight: Radius.circular(24.r),
            ),
          ),
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              PersonalInformationSection(),
              SizedBox(
                height: 24,
              ),
              SupportAndInformationSection(),
              SizedBox(
                height: 24,
              ),
              AccountManagementSection()
            ],
          ),
        ),
      ),
    );
  }
}
