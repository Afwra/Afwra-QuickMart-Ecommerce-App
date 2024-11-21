import 'package:flutter/material.dart';
import 'package:quick_mart/features/profile/data/models/privacy_policy_model.dart';
import 'package:quick_mart/features/profile/presentation/views/widgets/terms_and_conditions_section/term_and_conditions_title_section.dart';
import 'package:quick_mart/features/profile/presentation/views/widgets/terms_and_conditions_section/terms_and_conditions_body_section.dart';

class TermsAndConditionsBodyBottomSection extends StatelessWidget {
  const TermsAndConditionsBodyBottomSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          TermsAndConditionsTitleSection(
            title: terms.title,
            subTitle: terms.subTitle,
          ),
          const SizedBox(
            height: 16,
          ),
          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: terms.body.length,
            itemBuilder: (context, index) => TermsAndConditionsBodySection(
              title: terms.body[index].bodyTitle,
              body: terms.body[index].body,
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
