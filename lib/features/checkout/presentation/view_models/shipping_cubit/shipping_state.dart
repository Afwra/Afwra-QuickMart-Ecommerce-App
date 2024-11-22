sealed class ShippingState {}

final class ShippingInitial extends ShippingState {}

final class GetCurrentLocationSuccess extends ShippingState {}

final class GetCurrentLocationFail extends ShippingState {}

final class ChangeTappedLocation extends ShippingState {}

final class ReturnToSelectedLocation extends ShippingState {}

final class GetAddressFromLatLng extends ShippingState {}

final class ValidateFormSuccessState extends ShippingState {}

final class ValidateFormFailState extends ShippingState {}
