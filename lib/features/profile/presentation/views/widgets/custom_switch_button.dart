import 'package:flutter/material.dart';
import 'package:quick_mart/core/utils/app_colors.dart';

class CustomSwitchButton extends StatefulWidget {
  const CustomSwitchButton({super.key});

  @override
  State<CustomSwitchButton> createState() => _CustomSwitchButtonState();
}

class _CustomSwitchButtonState extends State<CustomSwitchButton> {
  bool isSwitched = false;
  @override
  Widget build(BuildContext context) {
    return Switch(
      value: isSwitched,
      onChanged: (change) {
        setState(() {
          isSwitched = change;
        });
      },
      activeColor: AppColors.kBrandColorCyan,
      inactiveTrackColor: AppColors.kGrey150,
      inactiveThumbColor: AppColors.kBrandColorWhite,
    );
  }
}
