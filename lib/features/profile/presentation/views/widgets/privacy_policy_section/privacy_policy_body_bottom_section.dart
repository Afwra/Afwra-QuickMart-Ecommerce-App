import 'package:flutter/material.dart';
import 'package:quick_mart/features/profile/data/models/privacy_policy_model.dart';
import 'package:quick_mart/features/profile/presentation/views/widgets/privacy_policy_section/privacy_policy_body_section.dart';
import 'package:quick_mart/features/profile/presentation/views/widgets/privacy_policy_section/privacy_policy_title_section.dart';

class PrivacyPolicyBodyBottomSection extends StatelessWidget {
  const PrivacyPolicyBodyBottomSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          PrivacyPolicyTitleSection(
            title: privacy.title,
            subTitle: privacy.subTitle,
          ),
          const SizedBox(
            height: 16,
          ),
          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: privacy.body.length,
            itemBuilder: (context, index) => PrivacyPolicyBodySection(
              title: privacy.body[index].bodyTitle,
              body: privacy.body[index].body,
            ),
            separatorBuilder: (context, index) => const SizedBox(
              height: 10,
            ),
          ),
        ],
      ),
    );
  }
}
