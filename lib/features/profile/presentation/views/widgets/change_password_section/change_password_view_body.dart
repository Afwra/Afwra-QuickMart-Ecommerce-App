import 'package:flutter/material.dart';
import 'package:quick_mart/core/utils/app_colors.dart';
import 'package:quick_mart/features/profile/presentation/views/widgets/change_password_section/custom_change_password_body_app_bar.dart';
import 'package:quick_mart/features/profile/presentation/views/widgets/change_password_section/custom_change_password_page_view.dart';

class ChangePasswordViewBody extends StatelessWidget {
  const ChangePasswordViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        CustomChangePasswordBodyAppBar(),
        SizedBox(
          height: 10,
        ),
        Divider(
          height: 3,
          thickness: 2,
          color: AppColors.kGrey50,
        ),
        SizedBox(
          height: 12,
        ),
        Expanded(child: CustomChangePasswordPageView()),
      ],
    );
  }
}
