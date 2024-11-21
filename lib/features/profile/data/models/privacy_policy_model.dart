class PrivacyPolicyModel {
  final String title, subTitle;
  final List<PrivacyPolicyBody> body;

  PrivacyPolicyModel(
      {required this.title, required this.subTitle, required this.body});
}

class PrivacyPolicyBody {
  final String bodyTitle, body;

  PrivacyPolicyBody({required this.bodyTitle, required this.body});
}

final PrivacyPolicyModel privacy = PrivacyPolicyModel(
    title: 'Our Policy',
    subTitle:
        'At QuickMart, we are committed to protecting the privacy and security of our users\' personal information. This Privacy Policy outlines how we collect, use, disclose, and safeguard the information obtained through our e-commerce app. By using QuickMart, you consent to the practices described in this policy.',
    body: [
      PrivacyPolicyBody(
          bodyTitle: '1. Information Collection:',
          body:
              ' - Personal Information: We may collect personal information such as name, address, email, and phone number when you create an account, make a purchase, or interact with our services.\n- Transaction Details: We collect information related to your purchases, including order history, payment method, and shipping details.\n- Usage Data: We may collect data on how you interact with our app, such as browsing activity, search queries, and preferences.'),
      PrivacyPolicyBody(
          bodyTitle: '2. Information Use:',
          body:
              '  - Provide Services: We use the collected information to process orders, deliver products, and provide customer support.\n- Personalization: We may use your information to personalize your shopping experience, recommend products, and display targeted advertisements.\n- Communication: We may use your contact information to send important updates, promotional offers, and newsletters. You can opt-out of these communications at any time.'),
      PrivacyPolicyBody(
          bodyTitle: '3. Information Sharing:',
          body:
              '  - Third-Party Service Providers: We may share your information with trusted third-party service providers who assist us in operating our app, fulfilling orders, and improving our services.\n- Legal Compliance: We may disclose personal information if required by law or in response to a valid legal request from authorities.'),
      PrivacyPolicyBody(
          bodyTitle: '4. Data Security:',
          body:
              '  - We implement appropriate security measures to protect your information from unauthorized access, alteration, disclosure, or destruction.\n- However, please note that no data transmission over the internet or electronic storage is 100% secure. We cannot guarantee absolute security of your information'),
      PrivacyPolicyBody(
          bodyTitle: '5. User Rights:',
          body:
              ' - Access and Update: You have the right to access, correct, or update your personal information stored in our app.\n- Data Retention: We retain your personal information as long as necessary to provide our services and comply with legal obligations'),
      PrivacyPolicyBody(
          bodyTitle: '6. Children\'s Privacy:',
          body:
              ' - QuickMart is not intended for children under the age of 13. We do not knowingly collect or solicit personal information from children.'),
      PrivacyPolicyBody(
          bodyTitle: '7. Updates to the Privacy Policy:',
          body:
              ' - We reserve the right to update this Privacy Policy from time to time. Any changes will be posted on our app, and the revised policy will be effective upon posting.\n\n\nIf you have any questions or concerns about our Privacy Policy, please contact our customer support. By using QuickMart, you acknowledge that you have read and understood this Privacy Policy and agree to its terms and conditions.'),
    ]);

final PrivacyPolicyModel terms = PrivacyPolicyModel(
    title: 'Terms & Conditions',
    subTitle:
        'Welcome to QuickMart! These Terms and Conditions ("Terms") govern your use of our e-commerce app. By accessing or using QuickMart, you agree to be bound by these Terms. Please read them carefully before proceeding.',
    body: [
      PrivacyPolicyBody(
          bodyTitle: '1. Account Registration:',
          body:
              '   - You must create an account to use certain features of QuickMart.\n- You are responsible for providing accurate and up-to-date information during the registration process.\n- You must safeguard your account credentials and notify us immediately of any unauthorized access or use of your account'),
      PrivacyPolicyBody(
          bodyTitle: '2. Product Information and Pricing:',
          body:
              '  - Provide Services: We use the collected information to process orders, deliver products, and provide customer support.\n- Personalization: We may use your information to personalize your shopping experience, recommend products, and display targeted advertisements.\n- Communication: We may use your contact information to send important updates, promotional offers, and newsletters. You can opt-out of these communications at any time.'),
      PrivacyPolicyBody(
          bodyTitle: '3. Information Sharing:',
          body:
              '  - Third-Party Service Providers: We may share your information with trusted third-party service providers who assist us in operating our app, fulfilling orders, and improving our services.\n- Legal Compliance: We may disclose personal information if required by law or in response to a valid legal request from authorities.'),
      PrivacyPolicyBody(
          bodyTitle: '4. Data Security:',
          body:
              '  - We implement appropriate security measures to protect your information from unauthorized access, alteration, disclosure, or destruction.\n- However, please note that no data transmission over the internet or electronic storage is 100% secure. We cannot guarantee absolute security of your information'),
      PrivacyPolicyBody(
          bodyTitle: '5. User Rights:',
          body:
              ' - Access and Update: You have the right to access, correct, or update your personal information stored in our app.\n- Data Retention: We retain your personal information as long as necessary to provide our services and comply with legal obligations'),
      PrivacyPolicyBody(
          bodyTitle: '6. Children\'s Privacy:',
          body:
              ' - QuickMart is not intended for children under the age of 13. We do not knowingly collect or solicit personal information from children.'),
      PrivacyPolicyBody(
          bodyTitle: '7. Updates to the Privacy Policy:',
          body:
              ' - We reserve the right to update this Privacy Policy from time to time. Any changes will be posted on our app, and the revised policy will be effective upon posting.\n\n\nIf you have any questions or concerns about our Privacy Policy, please contact our customer support. By using QuickMart, you acknowledge that you have read and understood this Privacy Policy and agree to its terms and conditions.'),
    ]);
