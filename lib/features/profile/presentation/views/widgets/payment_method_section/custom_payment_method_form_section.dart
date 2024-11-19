import 'package:flutter/material.dart';
import 'package:quick_mart/core/utils/app_settings.dart';
import 'package:quick_mart/core/widgets/custom_text_field.dart';

class CustomPaymentMethodFormSection extends StatelessWidget {
  const CustomPaymentMethodFormSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextFormField(
          hintText: 'Enter Card Holder Name',
          titleText: 'Card Holder Name',
          darkMode: AppSettings.darkMode,
        ),
        const SizedBox(
          height: 12,
        ),
        CustomTextFormField(
            hintText: 'Card Number',
            titleText: 'Card Number',
            darkMode: AppSettings.darkMode),
        const SizedBox(
          height: 12,
        ),
        Row(
          children: [
            Expanded(
                child: CustomTextFormField(
              hintText: 'MM/YY',
              titleText: 'Expiration',
              darkMode: AppSettings.darkMode,
            )),
            const SizedBox(
              width: 8,
            ),
            Expanded(
                child: CustomTextFormField(
              hintText: '123',
              titleText: 'CVV',
              darkMode: AppSettings.darkMode,
            )),
          ],
        ),
      ],
    );
  }
}
