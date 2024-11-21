import 'package:flutter/material.dart';
import 'package:quick_mart/features/profile/presentation/views/widgets/custom_profile_pages_app_bar.dart';
import 'package:quick_mart/features/profile/presentation/views/widgets/privacy_policy_section/privacy_policy_body_bottom_section.dart';

class PrivacyPolicyViewBody extends StatelessWidget {
  const PrivacyPolicyViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomProfilePagesAppBar(title: 'Privacy Policy'),
        Expanded(child: PrivacyPolicyBodyBottomSection()),
      ],
    );
  }
}
