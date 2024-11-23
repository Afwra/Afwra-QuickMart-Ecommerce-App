import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';
import 'package:quick_mart/core/functions/flutter_toast.dart';
import 'package:quick_mart/features/checkout/data/repos/shipping_repo.dart';
import 'package:quick_mart/features/checkout/presentation/view_models/shipping_cubit/shipping_state.dart';

class ShippingCubit extends Cubit<ShippingState> {
  ShippingCubit(this.shippingRepo) : super(ShippingInitial());

  //-------------------------------------------------------
  // Map Logic Section
  //-------------------------------------------------------

  LatLng? currentLocation = const LatLng(30.0444, 31.2357);
  final MapController mapController = MapController();
  bool isMapLoading = true;
  void getCurrentLocation() async {
    try {
      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          currentLocation = const LatLng(30.0444, 31.2357);
          isMapLoading = false;
          emit(GetCurrentLocationFail());
          return;
        }
      } else if (permission == LocationPermission.deniedForever) {
        currentLocation = const LatLng(30.0444, 31.2357);
        isMapLoading = false;
        emit(GetCurrentLocationFail());
        return;
      }
      Position position = await Geolocator.getCurrentPosition(
          locationSettings: const LocationSettings(
        accuracy: LocationAccuracy.high,
      ));
      currentLocation = LatLng(position.latitude, position.longitude);
      isMapLoading = false;
      getAddressFromLatLng(currentLocation!);
      emit(GetCurrentLocationSuccess());
    } catch (e) {
      log('Error getting current location: $e');
      currentLocation = const LatLng(30.0444, 31.2357);
      isMapLoading = false;
      emit(GetCurrentLocationSuccess());
    }
  }

  void changeToTappedPosition(LatLng point) {
    currentLocation = point;
    getAddressFromLatLng(currentLocation!);
    emit(ChangeTappedLocation());
  }

  void returnToSelectedPosition() {
    mapController.move(currentLocation!, 15);
    emit(ReturnToSelectedLocation());
  }

  void getAddressFromLatLng(LatLng location) async {
    try {
      List<Placemark> placemarks = await placemarkFromCoordinates(
        location.latitude,
        location.longitude,
      );

      if (placemarks.isNotEmpty) {
        Placemark place = placemarks[0];
        cityController.text = place.subAdministrativeArea!;
        provinceController.text = place.administrativeArea!;
        postalCode.text = place.postalCode!;
        streetAddress.text = place.thoroughfare!;
      }
    } catch (e) {
      log('Error getting address: $e');
    }
    emit(GetAddressFromLatLng());
  }

  //-------------------------------------------------------
  // Forms Logic Section
  //-------------------------------------------------------
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final provinceController = TextEditingController();
  final cityController = TextEditingController();
  final streetAddress = TextEditingController();
  final postalCode = TextEditingController();
  void validateForm() {
    if (formKey.currentState!.validate() && phoneController.text.isNotEmpty) {
      formKey.currentState!.save();
      emit(ValidateFormSuccessState());
    } else {
      autovalidateMode = AutovalidateMode.always;
      showFlutterToast(
          msg: 'Please fill all required fields', backGroundColor: Colors.red);
      emit(ValidateFormFailState());
    }
  }

//-------------------------------------------------------
// API Logic Section
//-------------------------------------------------------
  final ShippingRepo shippingRepo;
  bool getAddressFromApiLoading = false;
  void getAddressFromApi() async {
    getAddressFromApiLoading = true;
    emit(GetAddressFromApiLoading());
    final result = await shippingRepo.getShippingAddress();
    getAddressFromApiLoading = false;
    result.fold((error) {
      showFlutterToast(msg: error.errMsg);
      emit(GetAddressFromApiFail());
    }, (address) async {
      if (address != null) {
        nameController.text = address.name!;
        provinceController.text = address.region!;
        cityController.text = address.city!;
        streetAddress.text = address.details!;
        postalCode.text = address.notes!;
        currentLocation =
            LatLng(address.lat!.toDouble(), address.long!.toDouble());
        emit(GetAddressFromApiSuccess());
      } else {
        getCurrentLocation();
        emit(GetAddressFromApiSuccess());
      }
    });
  }

//-------------------------------------------------------
// Cubit LifeCycle Section
//-------------------------------------------------------
  @override
  Future<void> close() {
    nameController.dispose();
    phoneController.dispose();
    provinceController.dispose();
    cityController.dispose();
    streetAddress.dispose();
    postalCode.dispose();
    mapController.dispose();
    return super.close();
  }
}
