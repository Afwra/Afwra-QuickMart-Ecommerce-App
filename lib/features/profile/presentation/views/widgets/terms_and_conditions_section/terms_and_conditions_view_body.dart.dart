import 'package:flutter/material.dart';
import 'package:quick_mart/features/profile/presentation/views/widgets/custom_profile_pages_app_bar.dart';
import 'package:quick_mart/features/profile/presentation/views/widgets/terms_and_conditions_section/terms_adn_condtions_body_bottom_section.dart';

class TermsAndConditionsViewBody extends StatelessWidget {
  const TermsAndConditionsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomProfilePagesAppBar(title: 'Terms & Conditions'),
        Expanded(child: TermsAndConditionsBodyBottomSection()),
      ],
    );
  }
}
