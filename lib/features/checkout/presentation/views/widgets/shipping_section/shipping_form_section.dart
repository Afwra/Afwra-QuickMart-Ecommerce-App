import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quick_mart/core/utils/app_colors.dart';
import 'package:quick_mart/core/utils/app_settings.dart';
import 'package:quick_mart/core/widgets/custom_button.dart';
import 'package:quick_mart/core/widgets/custom_drop_down_field.dart';
import 'package:quick_mart/core/widgets/custom_phone_input_field.dart';
import 'package:quick_mart/core/widgets/custom_text_field.dart';
import 'package:quick_mart/features/checkout/presentation/view_models/shipping_cubit/shipping_cubit.dart';
import 'package:quick_mart/features/checkout/presentation/view_models/shipping_cubit/shipping_state.dart';

class ShippingFormSection extends StatelessWidget {
  const ShippingFormSection({
    super.key,
    this.onPressed,
  });
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<ShippingCubit>(context);
    return Form(
      key: cubit.formKey,
      child: Column(
        children: [
          CustomTextFormField(
            autovalidateMode: cubit.autovalidateMode,
            hintText: 'Enter Full Name',
            titleText: 'Full Name',
            controller: cubit.nameController,
            darkMode: AppSettings.darkMode,
            validator: (value) {
              if (value!.isEmpty || value.length < 3) {
                return 'Please enter full name';
              }
              return null;
            },
          ),
          const SizedBox(
            height: 12,
          ),
          CustomPhoneInputField(
            titleText: 'Phone Number',
            controller: cubit.phoneController,
            darkMode: AppSettings.darkMode,
          ),
          const SizedBox(
            height: 12,
          ),
          CustomDropDownField(
            title: 'Province',
            value: cubit.provinceController.text,
          ),
          const SizedBox(
            height: 12,
          ),
          CustomDropDownField(
            title: 'City',
            value: cubit.cityController.text,
          ),
          const SizedBox(
            height: 12,
          ),
          CustomTextFormField(
            autovalidateMode: cubit.autovalidateMode,
            hintText: 'Enter Street Address',
            titleText: 'Street Address',
            controller: cubit.streetAddress,
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter street address';
              }
              return null;
            },
            darkMode: AppSettings.darkMode,
          ),
          const SizedBox(
            height: 12,
          ),
          CustomTextFormField(
            autovalidateMode: cubit.autovalidateMode,
            hintText: 'Enter Postel Code',
            titleText: 'Postel Code',
            controller: cubit.postalCode,
            validator: (value) {
              if (value!.isEmpty || value.length < 6) {
                return 'Please enter postel code';
              }
              return null;
            },
            darkMode: AppSettings.darkMode,
          ),
          const SizedBox(
            height: 24,
          ),
          BlocBuilder<ShippingCubit, ShippingState>(
            builder: (context, state) {
              return Row(
                children: [
                  cubit.saveAddressToApiLoading
                      ? const Expanded(
                          child: Center(
                            child: CircularProgressIndicator(
                              color: AppColors.kBrandColorCyan,
                            ),
                          ),
                        )
                      : Expanded(
                          child: CustomButton(
                            text: 'Save',
                            color: AppSettings.darkMode
                                ? AppColors.kBrandColorCyan
                                : AppColors.kBrandColorBlack,
                            onPressed: onPressed,
                          ),
                        ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
