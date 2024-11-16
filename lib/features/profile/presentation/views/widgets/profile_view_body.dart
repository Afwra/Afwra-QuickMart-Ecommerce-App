import 'package:flutter/material.dart';
import 'package:quick_mart/features/profile/presentation/views/widgets/custom_profile_app_bar.dart';
import 'package:quick_mart/features/profile/presentation/views/widgets/custom_profile_view_bottom_section.dart';

class ProfileViewBody extends StatelessWidget {
  const ProfileViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      slivers: [
        CustomProfileAppBar(),
        CustomProfileViewBottomSection(),
      ],
    );
  }
}
