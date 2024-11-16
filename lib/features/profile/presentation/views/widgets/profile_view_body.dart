import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quick_mart/features/home/presentation/view_model/theme_cubit/theme_cubit.dart';
import 'package:quick_mart/features/home/presentation/view_model/theme_cubit/theme_state.dart';
import 'package:quick_mart/features/profile/presentation/views/widgets/custom_profile_app_bar.dart';
import 'package:quick_mart/features/profile/presentation/views/widgets/custom_profile_view_bottom_section.dart';

class ProfileViewBody extends StatelessWidget {
  const ProfileViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        const CustomProfileAppBar(),
        BlocBuilder<ThemeCubit, ThemeState>(
          builder: (context, state) {
            return CustomProfileViewBottomSection();
          },
        ),
      ],
    );
  }
}
