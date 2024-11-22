import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quick_mart/core/utils/app_colors.dart';
import 'package:quick_mart/features/checkout/presentation/view_models/shipping_cubit/shipping_cubit.dart';
import 'package:quick_mart/features/checkout/presentation/view_models/shipping_cubit/shipping_state.dart';

class CustomMapPickerSection extends StatelessWidget {
  const CustomMapPickerSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<ShippingCubit>(context);
    return BlocBuilder<ShippingCubit, ShippingState>(
      builder: (context, state) {
        return cubit.isMapLoading
            ? const Center(
                child: CircularProgressIndicator(
                color: AppColors.kBrandColorCyan,
              ))
            : CustomMap(cubit: cubit);
      },
    );
  }
}

class CustomMap extends StatelessWidget {
  const CustomMap({
    super.key,
    required this.cubit,
  });

  final ShippingCubit cubit;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        FlutterMap(
          mapController: cubit.mapController,
          options: MapOptions(
            initialCenter: cubit.currentLocation!,
            initialZoom: 15,
            onTap: (tapPosition, point) {
              cubit.changeToTappedPosition(point);
            },
          ),
          children: [
            TileLayer(
              urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
              userAgentPackageName: 'com.example.quick_mart',
            ),
            MarkerLayer(markers: [
              Marker(
                  point: cubit.currentLocation!,
                  child: const Icon(
                    Icons.location_pin,
                    color: AppColors.kBrandColorCyan,
                  ))
            ])
          ],
        ),
        Positioned(
          bottom: 20.h,
          right: 20.w,
          child: IconButton(
              onPressed: () {
                cubit.returnToSelectedPosition();
              },
              icon: const Icon(
                Icons.location_on_outlined,
                color: AppColors.kRed,
                size: 30,
              )),
        )
      ],
    );
  }
}
