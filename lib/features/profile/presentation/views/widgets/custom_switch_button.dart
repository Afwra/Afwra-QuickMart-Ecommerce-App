import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quick_mart/core/utils/app_colors.dart';
import 'package:quick_mart/core/utils/app_settings.dart';
import 'package:quick_mart/features/home/presentation/view_model/home_cubit/home_cubit.dart';

class CustomSwitchButton extends StatefulWidget {
  const CustomSwitchButton({super.key});

  @override
  State<CustomSwitchButton> createState() => _CustomSwitchButtonState();
}

class _CustomSwitchButtonState extends State<CustomSwitchButton> {
  bool isSwitched = AppSettings.darkMode;
  @override
  Widget build(BuildContext context) {
    return Switch(
      value: isSwitched,
      onChanged: (change) {
        setState(() {
          isSwitched = change;
          BlocProvider.of<HomeCubit>(context).changeThemeMode();
        });
      },
      activeColor: AppColors.kBrandColorCyan,
      inactiveTrackColor: AppColors.kGrey150,
      inactiveThumbColor: AppColors.kBrandColorWhite,
    );
  }
}
